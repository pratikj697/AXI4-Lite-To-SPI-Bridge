`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CDAC Acts, Pune
// Date: August 2026
// Engineer: Pratik Jangale, Anshuman Singh, Om Thakur, Monesh Kamde, Aditya S
// Module Name: AXI_SPI_BRIDGE_TOP
// Project Name: AXI4-Lite to SPI Bridge.
// Description: Synthesizable top-level wrapper.
//
//////////////////////////////////////////////////////////////////////////////////

module AXI_SPI_BRIDGE_TOP
(
    input   wire            ACLK,
    input   wire            ARESET,

    input   wire    [08:00] AWADDR,
    input   wire            AWVALID,
    output  wire             AWREADY,

    input   wire    [31:00] WDATA,
    input   wire    [03:00] WSTRB,
    input   wire            WVALID,
    output  wire             WREADY,

    output  wire    [01:00] BRESP,
    output  wire             BVALID,
    input   wire            BREADY,

    input   wire    [08:00] ARADDR,
    input   wire            ARVALID,
    output  wire             ARREADY,

    output  wire    [31:00] RDATA,
    output  wire    [01:00] RRESP,
    output  wire             RVALID,
    input   wire            RREADY,

    output  wire            MOSI,
    input   wire            MISO,
    output  wire            SCLK,
    output  wire    [00:07] SS         
);

    wire [7:0]  wr_addr_w, rd_addr_w, tx_reg_addr_w, rx_reg_addr_w;
    wire [31:0] wr_data_w, rd_data_w, dout_w, din_w;
    wire        wr_en_w, wrUpdateDone_w, rx_reg_en_w;

    wire [1:0]  setBRESP_w, setRRESP_w;
    wire        getTxRegStat_w, getRxRegStat_w;

    wire [2:0]  wrStatRegAddr_w, rdStatRegAddr_w;
    wire [7:0]  wrSlaveAddr_w;
    wire        axi_mgr_wr_en_w;

    wire        wrRegStat_w, rdRegStat_w;
    wire        wrStatUpEn_w, rdStatUpEn_w, rdStatUp_w;
    wire [2:0]  wrStatUpAddr_w, rdStatUpAddr_w;

    wire [7:0]  rd_slave_addr_w;
    wire        rd_en_w, ssq_empty_w, ssq_full_w;

    wire        SPI_start_w, SPI_busy_w;
    wire [0:7]  SPI_select_w;

    wire        SPICLK_w;

    AXI_S u_axi_s
    (
        .ACLK          (ACLK),
        .ARESET        (ARESET),

        .AWADDR        (AWADDR),
        .AWVALID       (AWVALID),
        .AWREADY       (AWREADY),

        .WDATA         (WDATA),
        .WSTRB         (WSTRB),
        .WVALID        (WVALID),
        .WREADY        (WREADY),

        .BRESP         (BRESP),
        .BVALID        (BVALID),
        .BREADY        (BREADY),

        .ARADDR        (ARADDR),
        .ARVALID       (ARVALID),
        .ARREADY       (ARREADY),

        .RDATA         (RDATA),
        .RRESP         (RRESP),
        .RVALID        (RVALID),
        .RREADY        (RREADY),

        .getBRESP      (setBRESP_w),
        .getRRESP      (setRRESP_w),

        .wr_addr       (wr_addr_w),
        .wr_data       (wr_data_w),
        .wr_en         (wr_en_w),
        .wrUpdateDone  (wrUpdateDone_w),

        .rd_addr       (rd_addr_w),
        .rd_data       (rd_data_w),
        .getTxRegStat  (getTxRegStat_w),
        .getRxRegStat  (getRxRegStat_w)
    );


    DATA_REGISTERS u_data_registers
    (
        .ACLK          (ACLK),
        .reset         (ARESET),

        .wr_addr       (wr_addr_w),
        .wr_data       (wr_data_w),
        .wr_en         (wr_en_w),

        .rd_addr       (rd_addr_w),
        .rd_data       (rd_data_w),

        .tx_reg_addr   (tx_reg_addr_w),
        .dout          (dout_w),

        .rx_reg_en     (rx_reg_en_w),
        .rx_reg_addr   (rx_reg_addr_w),
        .din           (din_w)
    );

    AXI_MANAGER u_axi_manager
    (
        .ACLK          (ACLK),
        .reset         (ARESET),

        .AWADDR        (AWADDR),
        .AWVALID       (AWVALID),
        .AWREADY       (AWREADY),

        .ARADDR        (ARADDR),

        .wrRegStat     (wrRegStat_w),
        .rdRegStat     (rdRegStat_w),

        .SSQ_full      (ssq_full_w),

        .setBRESP      (setBRESP_w),
        .setRRESP      (setRRESP_w),

        .wrStatRegAddr (wrStatRegAddr_w),
        .rdStatRegAddr (rdStatRegAddr_w),

        .wrSlaveAddr   (wrSlaveAddr_w),
        .wr_en         (axi_mgr_wr_en_w),
        .wrUpdateDone  (wrUpdateDone_w)
    );


    STATUS_REGISTERS u_status_registers
    (
        .ACLK          (ACLK),
        .reset         (ARESET),

        .wrStatUpEn    (wrStatUpEn_w),
        .wrStatUpAddr  (wrStatUpAddr_w),

        .rdStatUpEn    (rdStatUpEn_w),
        .rdStatUpAddr  (rdStatUpAddr_w),
        .rdStatUp      (rdStatUp_w),

        .wrAddr        (wrStatRegAddr_w),
        .rdAddr        (status_query_chip_w),

        .wr_en         (wr_en_w),

        .full_empty    (wrRegStat_w),
        .valid_invalid (rdRegStat_w)
    );

    assign getTxRegStat_w = wrRegStat_w;  
    assign getRxRegStat_w = rdRegStat_w;


    SSQ u_ssq
    (
        .reset          (ARESET),
        .wr_en          (axi_mgr_wr_en_w),
        .wr_slave_addr  (wrSlaveAddr_w),
        .rd_en          (rd_en_w),
        .rd_slave_addr  (rd_slave_addr_w),
        .empty          (ssq_empty_w),
        .full           (ssq_full_w)
    );


    SPI_MANAGER u_spi_manager
    (
        .ACLK            (ACLK),
        .SPICLK          (SPICLK_w),
        .reset           (ARESET),

        .rx_reg_en       (rx_reg_en_w),
        .rx_reg_addr     (rx_reg_addr_w),

        .tx_reg_addr     (tx_reg_addr_w),

        .rd_en           (rd_en_w),
        .rd_slave_addr   (rd_slave_addr_w),

        .SSQ_empty       (ssq_empty_w),

        .wr_stat_up_addr (wrStatUpAddr_w),
        .wr_stat_up_en   (wrStatUpEn_w),

        .rd_stat_up      (rdStatUp_w),
        .rd_stat_up_addr (rdStatUpAddr_w),
        .rd_stat_up_en   (rdStatUpEn_w),

        .SPI_start       (SPI_start_w),
        .SPI_select      (SPI_select_w),

        .SPI_busy        (SPI_busy_w)
    );


    SPI_CLOCKER u_spi_clocker
    (
        .clkin  (ACLK),
        .reset  (ARESET),
        .clkout (SPICLK_w)
    );


    SPI_M u_spi_m
    (
        .din       (dout_w),
        .dout      (din_w),
        .start     (SPI_start_w),
        .busy      (SPI_busy_w),
        .selecter  (SPI_select_w),
        .clk       (ACLK),
        .reset     (ARESET),
        .miso      (MISO),
        .mosi      (MOSI),
        .sclk      (SCLK),
        .ss        (SS)
    );

endmodule : AXI_SPI_BRIDGE_TOP
