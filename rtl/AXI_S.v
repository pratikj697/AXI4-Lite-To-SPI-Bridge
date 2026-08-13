`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Date: August 2026
// Engineer: Pratik Jangale, Anshuman Singh, Om Thakur, Monesh Kamde, Aditya S
// Module Name: AXI_S
// Project Name: AXI Lite to SPI Bridge
// Description: AXI Slave which handles communication with the AXI Master and
//              forwards requests to DATA_REGISTERS
//
//   AWADDR[8:0]
//       AWADDR[8]   = unused (tie 0)
//       AWADDR[7:5] = chip_sel   (0-7)
//       AWADDR[4:0] = location   (0-31)
//
//   ARADDR[8:0]
//       ARADDR[8]   = is_status  (0 = read RX data bank, 1 = read a status flag)
//       when is_status = 0:
//           ARADDR[7:5] = chip_sel   (0-7)
//           ARADDR[4:0] = location   (0-31)
//       when is_status = 1:
//           ARADDR[3:1] = chip_sel   (0-7)
//           ARADDR[0]   = 0:TX status (busy?)   1:RX status (data ready?)
//////////////////////////////////////////////////////////////////////////////////


module AXI_S
(
    input   wire            ACLK,
    input   wire            ARESET,

    input   wire    [08:00] AWADDR,
    input   wire            AWVALID,
    output  reg             AWREADY,

    input   wire    [31:00] WDATA,
    input   wire    [03:00] WSTRB,
    input   wire            WVALID,
    output  reg             WREADY,

    output  reg     [01:00] BRESP,
    output  reg             BVALID,
    input   wire            BREADY,

    input   wire    [08:00] ARADDR,
    input   wire            ARVALID,
    output  reg             ARREADY,

    output  reg     [31:00] RDATA,
    output  reg     [01:00] RRESP,
    output  reg             RVALID,
    input   wire            RREADY,

    input   wire    [01:00] getBRESP,
    input   wire    [01:00] getRRESP,

    output  reg     [07:00] wr_addr,
    output  reg     [31:00] wr_data,
    output  reg             wr_en,
    output  reg             wrUpdateDone,

    output  wire    [07:00] rd_addr,
    input   wire    [31:00] rd_data,
    input   wire            getTxRegStat,
    input   wire            getRxRegStat
);

    reg [08:00] tempAWADDR;
    reg [31:00] tempWDATA;

    reg [08:00] tempARADDR;

    reg addressWriteHandshake;
    reg dataWriteHandshake;

    reg addressReadHandshake;
    reg dataReadCapture; 

    always @(posedge ACLK)
    begin

        if(ARESET == 1)
        begin
            AWREADY <= 1;

            WREADY <= 1;

            BRESP <= 2'b00;
            BVALID <= 0;

            ARREADY <= 1;

            RDATA <= 0;
            RRESP <= 0;
            RVALID <= 0;

            wr_en <= 0;
            wr_addr <= 0;
            wr_data <= 0;
            wrUpdateDone <= 0;

            tempAWADDR <= 0;
            tempWDATA <= 0;
            tempARADDR <= 0;

            addressWriteHandshake <= 0;
            dataWriteHandshake <= 0;
            addressReadHandshake <= 0;
            dataReadCapture <= 0;
        end

        else 
	begin

            if(AWVALID == 1 &&  AWREADY == 1)
            begin
                tempAWADDR <= AWADDR;

                addressWriteHandshake <= 1;

                AWREADY <= 0;
            end

            if(WVALID == 1  &&  WREADY == 1)
            begin
                tempWDATA <= WDATA & { {8{WSTRB[3]}} , {8{WSTRB[2]}} , {8{WSTRB[1]}} , {8{WSTRB[0]}} };

                dataWriteHandshake <= 1;

                WREADY <= 0;
            end

            if(addressWriteHandshake == 1   &&  dataWriteHandshake == 1)
            begin
                BVALID <= 1;
                BRESP <= getBRESP;

                addressWriteHandshake <= 0;
                dataWriteHandshake <= 0;

                if(getBRESP == 2'b00)
                begin
                    wr_addr <= tempAWADDR[7:0];  
                    wr_data <= tempWDATA;
                    wr_en <= 1;
                    wrUpdateDone <= 1;
                end
            end

            else if(BVALID == 1  &&  BREADY == 1)
            begin
                BVALID <= 0;
                AWREADY <= 1;
                WREADY <= 1;

                wr_en <= 0;
                wrUpdateDone <= 0;
            end



            if(ARVALID == 1  &&  ARREADY == 1)
            begin
                ARREADY <= 0;

                tempARADDR <= ARADDR;

                addressReadHandshake <= 1;
            end

            if(addressReadHandshake == 1)
            begin
                addressReadHandshake <= 0;
                dataReadCapture <= 1;
            end

            else if(dataReadCapture == 1)
            begin
                dataReadCapture <= 0;

                if(tempARADDR[8] == 1'b0)
                begin
                    RDATA <= rd_data;                                    
                end
                else
                begin
                    RDATA <= (tempARADDR[0] == 1'b0) ? {31'b0, getTxRegStat}
                                                      : {31'b0, getRxRegStat}; 
                end

                RRESP <= getRRESP;
                RVALID <= 1;
            end

            else if(RVALID == 1  &&  RREADY == 1)
            begin
                RVALID <= 0;
                ARREADY <= 1;
            end

        end

    end

    assign rd_addr = tempARADDR[7:0];

endmodule
