`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Date: August 2026
// Engineer: Pratik Jangale, Anshuman Singh, Om Thakur, Monesh Kamde, Aditya S
// Module Name: DATA_REGISTERS
// Project Name: AXI Lite to SPI Bridge
// Description: Storage for 8 SPI slave chips, 32 words (locations) per chip,
//              32 bits per word. Implemented as TWO flat 256-deep arrays:
//                  write_data_reg[0:255] -> TX bank, data going OUT on MOSI
//                  read_data_reg [0:255] -> RX bank, data coming IN on MISO
//
//              Address format used on wr_addr / rd_addr / tx_reg_addr / rx_reg_addr:
//                  bit[7:5] = chip_sel  (0-7)  -> which of the 8 slave chips
//                  bit[4:0] = location  (0-31) -> which word inside that chip
//
//////////////////////////////////////////////////////////////////////////////////
module DATA_REGISTERS
(
    input   wire            ACLK,
    input   wire            reset,

    input   wire    [07:00] wr_addr,
    input   wire    [31:00] wr_data,
    input   wire            wr_en,

    input   wire    [07:00] rd_addr,
    output  reg     [31:00] rd_data,

    input   wire    [07:00] tx_reg_addr,
    output  reg     [31:00] dout,

    input   wire            rx_reg_en,
    input   wire    [07:00] rx_reg_addr,
    input   wire    [31:00] din
);

    reg [31:0] write_data_reg [0:255]; 
    reg [31:0] read_data_reg  [0:255];

    always @(posedge ACLK)
    begin
        if(wr_en == 1)
        begin
            write_data_reg[wr_addr] <= wr_data;
        end
    end

    always @(posedge ACLK)
    begin
        dout <= write_data_reg[tx_reg_addr];
    end

    always @(posedge ACLK)
    begin
        if(rx_reg_en == 1)
        begin
            read_data_reg[rx_reg_addr] <= din;
        end
    end

    always @(posedge ACLK)
    begin
        rd_data <= read_data_reg[rd_addr];
    end

endmodule
