`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Date: August 2026
// Engineer: Pratik Jangale, Anshuman Singh, Om Thakur, Monesh Kamde, Aditya S
// Module Name: STATUS_REGISTERS
// Project Name: AXI Lite to SPI Bridge
// Description: Holds a single-bit write/read status for every SPI slave chip.
//   write_status_reg[chip] : 1 = chip's TX bank busy (new writes blocked)
//                             0 = chip's TX bank free (writes allowed)
//   read_status_reg[chip]  : 1 = chip's RX data is ready to read
//                             0 = chip's RX data not ready yet
//
//////////////////////////////////////////////////////////////////////////////////


module STATUS_REGISTERS
(
    input   wire            ACLK,
    input   wire            reset,

    input   wire            wrStatUpEn,       
    input   wire    [02:00] wrStatUpAddr, 

    input   wire            rdStatUpEn,   
    input   wire    [02:00] rdStatUpAddr,   
    input   wire            rdStatUp,  

    input   wire    [02:00] wrAddr,    
    input   wire    [02:00] rdAddr,  

    input   wire            wr_en,  

    output  wire             full_empty,   
    output  wire             valid_invalid    
);

    reg write_status_reg [0:7];  
    reg read_status_reg  [0:7];  

    assign full_empty    = write_status_reg[wrAddr];
    assign valid_invalid = read_status_reg[rdAddr];

    integer i;

    always @(posedge ACLK  or  posedge reset)
    begin
        if(reset == 1)
        begin
            for(i = 0; i < 8; i = i + 1)
            begin
                write_status_reg[i] <= 1'b0;
            end
        end

        else
        begin

            if(wr_en == 1)
            begin
                write_status_reg[wrAddr] <= 1'b1;
            end

            if(wrStatUpEn == 1)
            begin
                write_status_reg[wrStatUpAddr] <= 1'b0;
            end
        end
    end

    always @(posedge ACLK  or  posedge reset)
    begin
        if(reset == 1)
        begin
            for(i = 0; i < 8; i = i + 1)
            begin
                read_status_reg[i] <= 1'b0;
            end
        end

        else
        begin
            if(rdStatUpEn == 1)
            begin
                read_status_reg[rdStatUpAddr] <= rdStatUp;
            end
        end
    end


endmodule
