`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Engineer: Humum Shaikh, Shrish, Sonali, Shubham, Dev
// Module Name: SPI_MANAGER
// Project Name: AXI Lite to SPI Bridge
// Description: Controls the SPI Master and updates the Data/Status registers
//              for whichever chip+location transaction is currently queued.
//
// UPDATED for 8 chips x 32 locations:
//   - rd_slave_addr / tempAddress / tx_reg_addr / rx_reg_addr are now the
//     full 8-bit {chip_sel[2:0], location[4:0]} value (unchanged width,
//     just reinterpreted).
//   - Chip-select decode simplified from an 8-way case statement to a single
//     one-hot assignment driven directly by tempAddress[7:5].
//   - wr_stat_up_addr / rd_stat_up_addr are now plain 3-bit chip_sel values
//     (STATUS_REGISTERS tracks status per chip, not per location).
//////////////////////////////////////////////////////////////////////////////////


module SPI_MANAGER
(
    input   wire            ACLK,
    input   wire            SPICLK,

    input   wire            reset,

    output  reg             rx_reg_en,
    output  reg     [07:00] rx_reg_addr,

    output  reg     [07:00] tx_reg_addr,

    output  reg             rd_en,
    input   wire    [07:00] rd_slave_addr,     // chip_sel[7:5] + location[4:0], popped from SSQ

    input   wire            SSQ_empty,

    output  reg     [02:00] wr_stat_up_addr,   // chip_sel only
    output  reg             wr_stat_up_en,

    output  reg             rd_stat_up,
    output  reg     [02:00] rd_stat_up_addr,   // chip_sel only
    output  reg             rd_stat_up_en,

    output  reg             SPI_start,
    output  reg     [00:07] SPI_select,

    input   wire            SPI_busy
);

    localparam [3:0]    IDLE                =   0,
                        FETCH               =   1,
                        INITCOMM            =   2,
                        HALT                =   3,
                        FINISH              =   4;

    reg [3:0] SPISTATE = IDLE;

    reg [07:00] tempAddress;      // chip_sel[7:5] + location[4:0] for the transaction in progress
    reg spiStartPrev;



    always @(posedge ACLK)
    begin
        if(reset)
        begin
            SPISTATE <= IDLE;

            rx_reg_en <= 0;
            rx_reg_addr <= 8'h00;
            tx_reg_addr <= 8'h00;

            rd_en <= 0;

            wr_stat_up_addr <= 3'b000;
            wr_stat_up_en <= 0;

            rd_stat_up <= 0;
            rd_stat_up_addr <= 3'b000;
            rd_stat_up_en <= 0;

            SPI_start <= 0;
            SPI_select <= 8'hFF;

            tempAddress <= 8'h00;

            spiStartPrev <= 1;
        end

        else
        begin
            case (SPISTATE)

                IDLE                :   begin
                                            rd_stat_up_en <= 0;
                                            rx_reg_en <= 0;

                                            if(SSQ_empty != 1   &&  SPI_busy != 1)
                                            begin
                                                rd_en <= 1;
                                                SPISTATE <= FETCH;
                                            end

                                            else rd_en <= 0;
                                        end

                FETCH               :   begin
                                            rd_en <= 0;

                                            wr_stat_up_addr <= rd_slave_addr[7:5];   // chip_sel only
                                            wr_stat_up_en <= 1;

                                            tx_reg_addr <= rd_slave_addr;            // chip + location

                                            tempAddress <= rd_slave_addr;

                                            SPISTATE <= INITCOMM;
                                        end

                INITCOMM            :   begin
                                            wr_stat_up_en <= 0;
                                            SPI_start <= 1;
                                            spiStartPrev <= SPICLK;

                                            rd_stat_up <= 0;
                                            rd_stat_up_addr <= tempAddress[7:5];     // chip_sel only
                                            rd_stat_up_en <= 1;

                                            // one-hot active-low chip select, decoded
                                            // directly from the 3-bit chip_sel field
                                            SPI_select <= 8'hFF;
                                            SPI_select[tempAddress[7:5]] <= 1'b0;

                                            SPISTATE <= HALT;
                                        end

                HALT              :   begin
                                            rd_stat_up_en <= 0;

                                            if(spiStartPrev == 0    &&  SPICLK == 1)
                                            begin
                                                SPI_start <= 0;
                                                SPISTATE <= FINISH;
                                            end

                                            else if(spiStartPrev == 1   &&  SPICLK == 0)
                                            begin
                                                spiStartPrev <= 0;
                                                SPISTATE <= HALT;
                                            end

                                            else SPISTATE <= HALT;
                                        end

                FINISH              :   begin
                                            if(SPI_busy != 1)
                                            begin
                                                rd_stat_up <= 1;
                                                rd_stat_up_addr <= tempAddress[7:5];   // chip_sel only
                                                rd_stat_up_en <= 1;

                                                rx_reg_en <= 1;
                                                rx_reg_addr <= tempAddress;            // same chip + location

                                                SPISTATE <= IDLE;
                                            end

                                            else SPISTATE <= FINISH;
                                        end

            endcase
        end
    end



endmodule
