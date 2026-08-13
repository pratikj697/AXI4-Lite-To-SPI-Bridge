`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Date: August 2026
// Engineer: Pratik Jangale, Anshuman Singh, Om Thakur, Monesh Kamde, Aditya S
// Module Name: SPI_M
// Project Name: AXI Lite to SPI Bridge 
// Description: Fetches the intermediate data from Slave Service Queue and then sends to SPI Slaves in serial manner. (Support for Mode 1 of SPI)
//		SPI Mode 1 : CPOL = 0 CPHA = 1 , Tx +posedge Rx -negedge
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI_M
(
    input   wire    [31:00] din,
    output  wire    [31:00] dout,
    input   wire            start,
    output  reg             busy,
    input   wire    [00:07] selecter,
    input   wire            clk,
    input   wire            reset,
    input   wire            miso,
    output  reg             mosi,
    output  wire            sclk,
    output  reg     [00:07] ss
);
    
    reg start_flag = 0;
    reg sclk_flag = 0;
    reg [5:0] counter = 32;
    reg dataBuffer = 0;
    reg [31:0] masterData = 32'h2121_3434; 
    
    
    initial
    begin
        mosi <= 1'b0;
        ss <= 8'hFF;
        busy <= 1'b0;
    end

    
    always @(posedge clk  or  posedge reset)
    begin 
        if(reset == 1'b1)
        begin 
            ss <= 8'hFF;
            mosi <= 1'b0;
            masterData <= 32'h0000_0000;
            start_flag <= 1'b0;
            sclk_flag <= 1'b0;
            busy <= 1'b0;
        end 
        
        else if(start == 1'b1    &&    start_flag ==1'b0)
        begin 
            start_flag <= 1'b1;
            ss <= selecter;
            masterData <= din;
            busy <= 1'b1;
        end 
        
        else if(start_flag == 1'b1)
        begin
            if(counter == 32)
            begin
                sclk_flag <= 1'b1;
                mosi <= masterData[31];
                masterData <= masterData << 1;
                counter <= counter - 1'b1;
            end
            
            else if(counter > 1)
            begin
                sclk_flag <= 1'b1;
                mosi <= masterData[31];
                masterData <= masterData << 1;
                masterData[1] <= dataBuffer;
                counter <= counter - 1'b1;
            end
            
            else if(counter == 1)
            begin
                mosi <= masterData[31];
                masterData <= masterData << 1;
                masterData[1] <= dataBuffer;
                counter <= counter - 1'b1;
            end 
            
            else if(counter == 0)
            begin
                masterData[0] <= dataBuffer;
                sclk_flag <= 1'b0;
                mosi <= 1'b0;
                ss <= 8'hFF;
                start_flag <= 1'b0;
                counter <= 32;
                busy <= 1'b0;
            end 
        end 
        
    end
    
    
    always @(negedge clk or posedge reset)
    begin
	if(reset)
		dataBuffer <= 0;
        else if(sclk_flag == 1'b1)
        begin
            dataBuffer <= miso;
        end
    end
    
    assign sclk = (sclk_flag) ? clk : 1'b0;
    
    assign dout = masterData;

endmodule
