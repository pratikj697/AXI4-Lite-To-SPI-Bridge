`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Date: August 2026
// Engineer: Pratik Jangale, Anshuman Singh, Om Thakur, Monesh Kamde
// Module Name: AXI_MANAGER
// Project Name: AXI Lite to SPI Bridge
// Description: Checks incoming AXI addresses, generates BRESP/RRESP, pushes
//              accepted write addresses toward the SSQ, and drives the
//              status-register query addresses.
//
//////////////////////////////////////////////////////////////////////////////////


module AXI_MANAGER
(
    input   wire            ACLK,

    input   wire            reset,

    input   wire    [08:00] AWADDR,
    input   wire            AWVALID,
    input   wire            AWREADY,

    input   wire    [08:00] ARADDR,

    input   wire            wrRegStat,   
    input   wire            rdRegStat, 

    input   wire            SSQ_full,

    output  reg     [01:00] setBRESP,
    output  reg     [01:00] setRRESP,

    output  wire    [02:00] wrStatRegAddr, 
    output  wire    [02:00] rdStatRegAddr,  

    output  reg     [07:00] wrSlaveAddr, 
    output  reg             wr_en,
    input   wire            wrUpdateDone
);

    assign wrStatRegAddr = AWADDR[7:5];
    assign rdStatRegAddr = ARADDR[7:5];

    always @(posedge ACLK  or  posedge reset)
    begin
        if(reset == 1)
        begin
            setBRESP <= 0;
            setRRESP <= 0;

            wrSlaveAddr <= 0;
            wr_en <= 0;
        end

        else if(ACLK == 1)
        begin
            if(AWVALID == 1 &&  AWREADY == 1    &&  wrUpdateDone != 1)
            begin
                if(checkWriteStat(wrRegStat) == 2'b00)
                begin
                    wrSlaveAddr <= AWADDR[7:0]; 
                end
            end

            else if(wrUpdateDone == 1   &&  wr_en != 1)
            begin
                wr_en <= 1;
            end

            else if(wr_en == 1)
            begin
                wr_en <= 0;
            end
        end

    end

    always @(*)
    begin
        setBRESP = checkWriteStat(wrRegStat);
    end

    always @(*)
    begin
        if(ARADDR[8] == 1'b0)
        begin
            setRRESP = checkReadStat(rdRegStat);
        end
        else
        begin
            setRRESP = 2'b00;
        end
    end

    function [1:0] checkWriteStat(input x);
        begin
            if(x == 1   ||  SSQ_full == 1) checkWriteStat =  2'b10;  
            else checkWriteStat =  2'b00;              
        end
    endfunction

    function [1:0] checkReadStat(input y);
        begin
            if(y == 1) checkReadStat =  2'b00;  
            else checkReadStat =  2'b10;  
        end
    endfunction

endmodule
