# Console Output:

UVM_INFO verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(277) @ 0: reporter [Questa UVM] QUESTA_UVM-1.2.3
UVM_INFO verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(278) @ 0: reporter [Questa UVM]  questa_uvm::init(+struct)
UVM_INFO @ 0: reporter [RNTST] Running test axi_spi_test...

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(647) @ 105000: uvm_test_top.env.agent.driver [DRV_RESET] ================ READ-AFTER-RESET SWEEP ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(648) @ 105000: uvm_test_top.env.agent.driver [DRV_RESET]   INPUT   : read RX bank at loc={0,15,31} for all 8 chips (24 reads), expect all 0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(661) @ 1545000: uvm_test_top.env.agent.driver [DRV_RESET]   OUTPUT  : checked 24 locations across all 8 chips -> PASS (no ghost data)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(664) @ 1545000: uvm_test_top.env.agent.driver [DRV_RESET] ==========================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(473) @ 1555000: uvm_test_top.env.agent.driver [DRV_FIFO] ================ SSQ INITIAL-EMPTY CHECK ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(474) @ 1555000: uvm_test_top.env.agent.driver [DRV_FIFO]   INPUT   : (none - sampling SSQ state immediately after reset)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(475) @ 1555000: uvm_test_top.env.agent.driver [DRV_FIFO]   OUTPUT  : empty=1  full=0  wrPtr=0  -> PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(481) @ 1555000: uvm_test_top.env.agent.driver [DRV_FIFO] ===========================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(536) @ 1555000: uvm_test_top.env.agent.driver [DRV_FIFO] ================ SSQ FULL/EMPTY BACKDOOR TEST (depth=16) ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(537) @ 1555000: uvm_test_top.env.agent.driver [DRV_FIFO]   INPUT   : 16 backdoor pushes (bypassing AXI_MANAGER), then 16 backdoor pops
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(550) @ 1588000: uvm_test_top.env.agent.driver [DRV_FIFO]   OUTPUT  : after 16 backdoor pushes -> full=1 wrPtr=16  -> PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(563) @ 1620000: uvm_test_top.env.agent.driver [DRV_FIFO]   OUTPUT  : after draining all 16    -> empty=1 full=0 wrPtr=0  -> PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(571) @ 1621000: uvm_test_top.env.agent.driver [DRV_FIFO] ==========================================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(579) @ 1621000: uvm_test_top.env.agent.driver [DRV_FIFO] ================ SSQ OVERFLOW/UNDERFLOW EDGE PROBE ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(580) @ 1621000: uvm_test_top.env.agent.driver [DRV_FIFO]   INPUT   : fill to full (16), push 1 more; drain to empty, pop 1 more
UVM_WARNING C:/Users/Asus/Downloads/tb_axi_spi_full.sv(605) @ 1656000: uvm_test_top.env.agent.driver [DRV_FIFO]   push-while-full probe : wrPtr advanced 16 -> 17 - SSQ.v's wrPtr!=15 guard does not stop a further push once already at wrPtr==16 (out-of-range buffer[17] access). Documented finding, not a testbench failure.
UVM_WARNING C:/Users/Asus/Downloads/tb_axi_spi_full.sv(627) @ 1692000: uvm_test_top.env.agent.driver [DRV_FIFO]   pop-while-empty probe  : empty flag dropped to 0 after popping an already-empty queue - SSQ.v's rd_en-only branch does not check 'empty' except at the wrPtr==1 boundary case, so wrPtr can underflow. Documented finding, not a testbench failure.
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(631) @ 1692000: uvm_test_top.env.agent.driver [DRV_FIFO]   This probe deliberately corrupts SSQ internal state (wrPtr underflow/overflow) to document the RTL gaps above. Issuing a full system reset now to restore a clean state before any further tests run - otherwise SPI_MANAGER would see a stale SSQ_empty=0 and try to FETCH garbage forever, hanging every test after this one.
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(636) @ 1796000: uvm_test_top.env.agent.driver [DRV_FIFO] =====================================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(673) @ 1796000: uvm_test_top.env.agent.driver [DRV_COLD] ================ COLD-START WRITE TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(674) @ 1796000: uvm_test_top.env.agent.driver [DRV_COLD]   INPUT   : chip=0 loc=1 wdata=0x600d0000 (first write issued by this testbench)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(685) @ 6001905000: uvm_test_top.env.agent.driver [DRV_COLD]   OUTPUT  : bresp=0 fetch_timeout=1 finish_timeout=1 dout=0xdead0000 din=0xdead0000 rdata=0x00000000 -> FAIL
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(689) @ 6001905000: uvm_test_top.env.agent.driver [DRV_COLD] Cold-start write path did not complete correctly
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(690) @ 6001905000: uvm_test_top.env.agent.driver [DRV_COLD] =========================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(703) @ 6001905000: uvm_test_top.env.agent.driver [DRV_ORDER] ================ FIFO SERVICE-ORDER TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(704) @ 6001905000: uvm_test_top.env.agent.driver [DRV_ORDER]   INPUT   : writes issued in chip order 3, 1, 6, 2 (zero wait between them)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(734) @ 6012185000: uvm_test_top.env.agent.driver [DRV_ORDER]   OUTPUT  : observed FETCH order 3, 1, 6, 2  -> PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(744) @ 22012185000: uvm_test_top.env.agent.driver [DRV_ORDER] ===========================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(830) @ 22012185000: uvm_test_top.env.agent.driver [DRV_DECODE] ================ STATUS/DATA BOUNDARY DECODE TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(831) @ 22012185000: uvm_test_top.env.agent.driver [DRV_DECODE]   (chip_sel is plain binary 0-7, all values valid - no 'invalid address'
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(832) @ 22012185000: uvm_test_top.env.agent.driver [DRV_DECODE]    code exists here. This instead confirms decode ignores the status
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(833) @ 22012185000: uvm_test_top.env.agent.driver [DRV_DECODE]    address's reserved bits[7:4], per AXI_S's documented format.)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(834) @ 22012185000: uvm_test_top.env.agent.driver [DRV_DECODE]   INPUT   : Tx-status read for chip=2, once with reserved bits[7:4]=0000, once with =1011
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(843) @ 22012305000: uvm_test_top.env.agent.driver [DRV_DECODE]   OUTPUT  : clean-reserved-bits=0x00000000  dirty-reserved-bits=0x00000000  -> PASS (reserved bits correctly ignored)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(849) @ 22012305000: uvm_test_top.env.agent.driver [DRV_DECODE] ====================================================================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1222) @ 22012305000: uvm_test_top.env.agent.sequencer@@seq [axi_spi_full_seq] Starting EXHAUSTIVE sequence: 256 (full 8x32 address sweep, directed) + 16 (data-pattern corners, directed) + 30 (constrained-random regression) = 302 transactions

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22012305000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #0  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22012305000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=0  wdata=0x00c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22012355000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22012385000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x00c0ffee  expected=0x00c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22015765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x00c0ffee  expected=0x00c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22015825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22015885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x00c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22015885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22015885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #0  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22015885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #1  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22015885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=1  wdata=0x01c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22015935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22015965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x01c0ffee  expected=0x01c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22019365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x01c0ffee  expected=0x01c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22019425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22019485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x01c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22019485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22019485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #1  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22019485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #2  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22019485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=2  wdata=0x02c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22019535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22019565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x02c0ffee  expected=0x02c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22022965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x02c0ffee  expected=0x02c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22023025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22023085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x02c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22023085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22023085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #2  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22023085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #3  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22023085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=3  wdata=0x03c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22023135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22023165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x03c0ffee  expected=0x03c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22026565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x03c0ffee  expected=0x03c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22026625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22026685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x03c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22026685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22026685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #3  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22026685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #4  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22026685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=4  wdata=0x04c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22026735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22026765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x04c0ffee  expected=0x04c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22030165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x04c0ffee  expected=0x04c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22030225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22030285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x04c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22030285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22030285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #4  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22030285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #5  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22030285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=5  wdata=0x05c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22030335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22030365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x05c0ffee  expected=0x05c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22033765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x05c0ffee  expected=0x05c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22033825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22033885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x05c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22033885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22033885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #5  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22033885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #6  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22033885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=6  wdata=0x06c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22033935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22033965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x06c0ffee  expected=0x06c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22037365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x06c0ffee  expected=0x06c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22037425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22037485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x06c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22037485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22037485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #6  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22037485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #7  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22037485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=7  wdata=0x07c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22037535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22037565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x07c0ffee  expected=0x07c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22040965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x07c0ffee  expected=0x07c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22041025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22041085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x07c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22041085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22041085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #7  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22041085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #8  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22041085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=8  wdata=0x08c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22041135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22041165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x08c0ffee  expected=0x08c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22044565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x08c0ffee  expected=0x08c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22044625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22044685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x08c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22044685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22044685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #8  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22044685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #9  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22044685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=9  wdata=0x09c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22044735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22044765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x09c0ffee  expected=0x09c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22048165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x09c0ffee  expected=0x09c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22048225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22048285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x09c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22048285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22048285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #9  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22048285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #10  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22048285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=10  wdata=0x0ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22048335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22048365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x0ac0ffee  expected=0x0ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22051765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x0ac0ffee  expected=0x0ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22051825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22051885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x0ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22051885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22051885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #10  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22051885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #11  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22051885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=11  wdata=0x0bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22051935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22051965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x0bc0ffee  expected=0x0bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22055365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x0bc0ffee  expected=0x0bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22055425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22055485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x0bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22055485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22055485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #11  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22055485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #12  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22055485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=12  wdata=0x0cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22055535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22055565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x0cc0ffee  expected=0x0cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22058965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x0cc0ffee  expected=0x0cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22059025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22059085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x0cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22059085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22059085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #12  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22059085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #13  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22059085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=13  wdata=0x0dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22059135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22059165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x0dc0ffee  expected=0x0dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22062565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x0dc0ffee  expected=0x0dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22062625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22062685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x0dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22062685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22062685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #13  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22062685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #14  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22062685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=14  wdata=0x0ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22062735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22062765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x0ec0ffee  expected=0x0ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22066165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x0ec0ffee  expected=0x0ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22066225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22066285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x0ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22066285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22066285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #14  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22066285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #15  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22066285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0x0fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22066335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22066365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x0fc0ffee  expected=0x0fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22069765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x0fc0ffee  expected=0x0fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22069825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22069885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x0fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22069885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22069885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #15  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22069885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #16  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22069885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=16  wdata=0x10c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22069935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22069965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x10c0ffee  expected=0x10c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22073365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x10c0ffee  expected=0x10c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22073425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22073485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x10c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22073485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22073485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #16  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22073485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #17  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22073485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=17  wdata=0x11c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22073535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22073565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x11c0ffee  expected=0x11c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22076965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x11c0ffee  expected=0x11c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22077025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22077085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x11c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22077085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22077085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #17  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22077085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #18  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22077085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=18  wdata=0x12c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22077135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22077165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x12c0ffee  expected=0x12c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22080565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x12c0ffee  expected=0x12c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22080625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22080685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x12c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22080685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22080685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #18  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22080685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #19  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22080685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=19  wdata=0x13c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22080735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22080765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x13c0ffee  expected=0x13c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22084165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x13c0ffee  expected=0x13c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22084225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22084285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x13c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22084285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22084285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #19  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22084285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #20  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22084285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=20  wdata=0x14c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22084335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22084365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x14c0ffee  expected=0x14c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22087765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x14c0ffee  expected=0x14c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22087825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22087885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x14c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22087885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22087885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #20  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22087885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #21  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22087885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=21  wdata=0x15c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22087935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22087965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x15c0ffee  expected=0x15c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22091365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x15c0ffee  expected=0x15c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22091425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22091485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x15c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22091485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22091485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #21  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22091485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #22  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22091485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=22  wdata=0x16c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22091535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22091565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x16c0ffee  expected=0x16c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22094965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x16c0ffee  expected=0x16c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22095025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22095085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x16c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22095085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22095085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #22  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22095085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #23  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22095085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=23  wdata=0x17c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22095135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22095165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x17c0ffee  expected=0x17c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22098565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x17c0ffee  expected=0x17c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22098625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22098685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x17c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22098685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22098685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #23  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22098685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #24  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22098685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=24  wdata=0x18c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22098735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22098765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x18c0ffee  expected=0x18c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22102165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x18c0ffee  expected=0x18c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22102225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22102285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x18c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22102285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22102285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #24  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22102285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #25  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22102285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=25  wdata=0x19c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22102335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22102365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x19c0ffee  expected=0x19c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22105765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x19c0ffee  expected=0x19c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22105825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22105885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x19c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22105885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22105885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #25  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22105885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #26  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22105885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=26  wdata=0x1ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22105935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22105965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1ac0ffee  expected=0x1ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22109365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1ac0ffee  expected=0x1ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22109425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22109485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22109485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22109485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #26  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22109485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #27  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22109485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=27  wdata=0x1bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22109535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22109565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1bc0ffee  expected=0x1bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22112965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1bc0ffee  expected=0x1bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22113025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22113085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22113085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22113085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #27  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22113085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #28  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22113085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=28  wdata=0x1cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22113135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22113165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1cc0ffee  expected=0x1cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22116565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1cc0ffee  expected=0x1cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22116625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22116685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22116685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22116685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #28  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22116685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #29  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22116685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=29  wdata=0x1dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22116735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22116765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1dc0ffee  expected=0x1dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22120165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1dc0ffee  expected=0x1dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22120225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22120285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22120285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22120285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #29  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22120285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #30  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22120285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=30  wdata=0x1ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22120335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22120365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1ec0ffee  expected=0x1ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22123765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1ec0ffee  expected=0x1ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22123825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22123885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22123885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22123885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #30  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22123885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #31  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22123885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=31  wdata=0x1fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22123935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22123965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1fc0ffee  expected=0x1fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22127365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1fc0ffee  expected=0x1fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22127425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22127485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22127485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22127485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #31  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22127485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #32  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22127485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=0  wdata=0x20c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22127535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22127565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x20c0ffee  expected=0x20c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22130965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x20c0ffee  expected=0x20c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22131025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22131085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x20c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22131085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22131085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #32  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22131085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #33  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22131085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=1  wdata=0x21c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22131135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22131165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x21c0ffee  expected=0x21c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22134565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x21c0ffee  expected=0x21c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22134625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22134685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x21c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22134685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22134685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #33  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22134685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #34  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22134685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=2  wdata=0x22c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22134735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22134765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x22c0ffee  expected=0x22c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22138165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x22c0ffee  expected=0x22c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22138225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22138285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x22c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22138285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22138285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #34  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22138285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #35  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22138285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=3  wdata=0x23c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22138335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22138365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x23c0ffee  expected=0x23c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22141765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x23c0ffee  expected=0x23c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22141825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22141885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x23c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22141885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22141885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #35  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22141885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #36  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22141885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=4  wdata=0x24c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22141935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22141965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x24c0ffee  expected=0x24c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22145365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x24c0ffee  expected=0x24c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22145425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22145485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x24c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22145485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22145485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #36  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22145485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #37  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22145485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=5  wdata=0x25c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22145535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22145565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x25c0ffee  expected=0x25c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22148965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x25c0ffee  expected=0x25c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22149025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22149085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x25c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22149085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22149085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #37  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22149085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #38  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22149085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=6  wdata=0x26c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22149135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22149165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x26c0ffee  expected=0x26c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22152565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x26c0ffee  expected=0x26c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22152625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22152685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x26c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22152685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22152685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #38  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22152685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #39  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22152685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=7  wdata=0x27c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22152735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22152765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x27c0ffee  expected=0x27c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22156165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x27c0ffee  expected=0x27c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22156225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22156285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x27c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22156285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22156285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #39  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22156285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #40  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22156285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=8  wdata=0x28c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22156335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22156365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x28c0ffee  expected=0x28c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22159765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x28c0ffee  expected=0x28c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22159825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22159885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x28c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22159885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22159885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #40  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22159885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #41  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22159885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=9  wdata=0x29c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22159935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22159965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x29c0ffee  expected=0x29c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22163365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x29c0ffee  expected=0x29c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22163425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22163485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x29c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22163485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22163485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #41  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22163485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #42  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22163485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=10  wdata=0x2ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22163535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22163565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x2ac0ffee  expected=0x2ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22166965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x2ac0ffee  expected=0x2ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22167025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22167085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x2ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22167085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22167085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #42  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22167085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #43  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22167085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=11  wdata=0x2bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22167135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22167165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x2bc0ffee  expected=0x2bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22170565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x2bc0ffee  expected=0x2bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22170625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22170685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x2bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22170685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22170685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #43  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22170685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #44  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22170685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=12  wdata=0x2cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22170735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22170765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x2cc0ffee  expected=0x2cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22174165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x2cc0ffee  expected=0x2cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22174225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22174285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x2cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22174285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22174285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #44  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22174285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #45  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22174285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=13  wdata=0x2dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22174335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22174365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x2dc0ffee  expected=0x2dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22177765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x2dc0ffee  expected=0x2dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22177825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22177885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x2dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22177885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22177885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #45  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22177885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #46  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22177885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=14  wdata=0x2ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22177935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22177965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x2ec0ffee  expected=0x2ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22181365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x2ec0ffee  expected=0x2ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22181425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22181485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x2ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22181485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22181485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #46  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22181485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #47  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22181485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=15  wdata=0x2fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22181535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22181565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x2fc0ffee  expected=0x2fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22184965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x2fc0ffee  expected=0x2fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22185025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22185085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x2fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22185085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22185085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #47  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22185085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #48  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22185085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=16  wdata=0x30c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22185135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22185165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x30c0ffee  expected=0x30c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22188565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x30c0ffee  expected=0x30c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22188625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22188685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x30c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22188685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22188685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #48  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22188685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #49  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22188685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=17  wdata=0x31c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22188735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22188765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x31c0ffee  expected=0x31c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22192165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x31c0ffee  expected=0x31c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22192225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22192285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x31c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22192285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22192285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #49  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22192285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #50  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22192285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=18  wdata=0x32c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22192335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22192365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x32c0ffee  expected=0x32c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22195765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x32c0ffee  expected=0x32c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22195825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22195885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x32c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22195885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22195885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #50  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22195885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #51  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22195885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=19  wdata=0x33c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22195935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22195965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x33c0ffee  expected=0x33c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22199365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x33c0ffee  expected=0x33c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22199425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22199485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x33c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22199485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22199485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #51  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22199485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #52  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22199485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=20  wdata=0x34c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22199535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22199565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x34c0ffee  expected=0x34c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22202965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x34c0ffee  expected=0x34c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22203025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22203085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x34c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22203085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22203085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #52  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22203085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #53  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22203085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=21  wdata=0x35c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22203135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22203165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x35c0ffee  expected=0x35c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22206565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x35c0ffee  expected=0x35c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22206625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22206685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x35c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22206685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22206685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #53  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22206685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #54  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22206685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=22  wdata=0x36c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22206735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22206765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x36c0ffee  expected=0x36c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22210165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x36c0ffee  expected=0x36c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22210225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22210285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x36c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22210285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22210285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #54  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22210285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #55  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22210285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=23  wdata=0x37c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22210335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22210365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x37c0ffee  expected=0x37c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22213765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x37c0ffee  expected=0x37c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22213825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22213885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x37c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22213885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22213885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #55  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22213885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #56  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22213885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=24  wdata=0x38c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22213935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22213965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x38c0ffee  expected=0x38c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22217365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x38c0ffee  expected=0x38c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22217425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22217485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x38c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22217485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22217485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #56  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22217485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #57  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22217485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=25  wdata=0x39c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22217535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22217565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x39c0ffee  expected=0x39c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22220965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x39c0ffee  expected=0x39c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22221025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22221085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x39c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22221085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22221085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #57  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22221085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #58  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22221085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=26  wdata=0x3ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22221135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22221165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x3ac0ffee  expected=0x3ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22224565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x3ac0ffee  expected=0x3ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22224625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22224685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x3ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22224685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22224685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #58  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22224685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #59  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22224685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=27  wdata=0x3bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22224735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22224765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x3bc0ffee  expected=0x3bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22228165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x3bc0ffee  expected=0x3bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22228225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22228285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x3bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22228285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22228285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #59  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22228285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #60  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22228285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=28  wdata=0x3cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22228335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22228365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x3cc0ffee  expected=0x3cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22231765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x3cc0ffee  expected=0x3cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22231825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22231885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x3cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22231885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22231885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #60  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22231885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #61  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22231885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=29  wdata=0x3dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22231935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22231965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x3dc0ffee  expected=0x3dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22235365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x3dc0ffee  expected=0x3dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22235425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22235485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x3dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22235485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22235485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #61  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22235485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #62  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22235485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=30  wdata=0x3ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22235535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22235565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x3ec0ffee  expected=0x3ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22238965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x3ec0ffee  expected=0x3ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22239025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22239085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x3ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22239085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22239085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #62  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22239085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #63  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22239085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=31  wdata=0x3fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22239135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22239165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x3fc0ffee  expected=0x3fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22242565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x3fc0ffee  expected=0x3fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22242625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22242685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x3fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22242685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22242685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #63  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22242685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #64  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22242685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=0  wdata=0x40c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22242735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22242765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x40c0ffee  expected=0x40c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22246165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x40c0ffee  expected=0x40c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22246225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22246285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x40c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22246285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22246285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #64  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22246285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #65  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22246285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=1  wdata=0x41c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22246335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22246365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x41c0ffee  expected=0x41c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22249765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x41c0ffee  expected=0x41c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22249825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22249885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x41c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22249885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22249885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #65  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22249885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #66  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22249885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=2  wdata=0x42c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22249935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22249965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x42c0ffee  expected=0x42c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22253365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x42c0ffee  expected=0x42c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22253425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22253485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x42c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22253485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22253485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #66  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22253485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #67  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22253485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=3  wdata=0x43c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22253535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22253565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x43c0ffee  expected=0x43c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22256965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x43c0ffee  expected=0x43c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22257025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22257085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x43c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22257085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22257085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #67  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22257085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #68  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22257085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=4  wdata=0x44c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22257135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22257165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x44c0ffee  expected=0x44c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22260565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x44c0ffee  expected=0x44c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22260625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22260685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x44c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22260685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22260685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #68  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22260685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #69  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22260685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=5  wdata=0x45c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22260735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22260765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x45c0ffee  expected=0x45c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22264165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x45c0ffee  expected=0x45c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22264225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22264285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x45c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22264285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22264285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #69  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22264285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #70  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22264285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=6  wdata=0x46c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22264335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22264365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x46c0ffee  expected=0x46c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22267765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x46c0ffee  expected=0x46c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22267825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22267885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x46c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22267885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22267885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #70  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22267885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #71  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22267885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=7  wdata=0x47c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22267935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22267965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x47c0ffee  expected=0x47c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22271365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x47c0ffee  expected=0x47c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22271425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22271485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x47c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22271485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22271485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #71  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22271485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #72  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22271485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=8  wdata=0x48c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22271535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22271565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x48c0ffee  expected=0x48c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22274965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x48c0ffee  expected=0x48c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22275025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22275085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x48c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22275085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22275085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #72  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22275085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #73  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22275085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=9  wdata=0x49c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22275135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22275165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x49c0ffee  expected=0x49c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22278565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x49c0ffee  expected=0x49c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22278625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22278685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x49c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22278685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22278685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #73  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22278685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #74  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22278685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=10  wdata=0x4ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22278735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22278765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x4ac0ffee  expected=0x4ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22282165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x4ac0ffee  expected=0x4ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22282225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22282285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x4ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22282285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22282285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #74  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22282285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #75  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22282285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=11  wdata=0x4bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22282335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22282365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x4bc0ffee  expected=0x4bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22285765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x4bc0ffee  expected=0x4bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22285825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22285885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x4bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22285885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22285885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #75  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22285885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #76  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22285885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=12  wdata=0x4cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22285935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22285965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x4cc0ffee  expected=0x4cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22289365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x4cc0ffee  expected=0x4cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22289425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22289485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x4cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22289485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22289485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #76  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22289485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #77  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22289485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=13  wdata=0x4dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22289535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22289565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x4dc0ffee  expected=0x4dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22292965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x4dc0ffee  expected=0x4dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22293025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22293085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x4dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22293085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22293085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #77  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22293085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #78  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22293085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=14  wdata=0x4ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22293135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22293165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x4ec0ffee  expected=0x4ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22296565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x4ec0ffee  expected=0x4ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22296625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22296685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x4ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22296685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22296685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #78  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22296685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #79  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22296685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=15  wdata=0x4fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22296735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22296765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x4fc0ffee  expected=0x4fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22300165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x4fc0ffee  expected=0x4fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22300225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22300285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x4fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22300285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22300285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #79  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22300285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #80  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22300285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=16  wdata=0x50c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22300335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22300365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x50c0ffee  expected=0x50c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22303765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x50c0ffee  expected=0x50c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22303825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22303885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x50c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22303885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22303885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #80  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22303885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #81  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22303885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=17  wdata=0x51c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22303935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22303965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x51c0ffee  expected=0x51c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22307365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x51c0ffee  expected=0x51c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22307425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22307485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x51c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22307485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22307485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #81  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22307485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #82  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22307485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=18  wdata=0x52c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22307535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22307565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x52c0ffee  expected=0x52c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22310965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x52c0ffee  expected=0x52c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22311025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22311085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x52c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22311085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22311085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #82  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22311085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #83  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22311085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=19  wdata=0x53c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22311135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22311165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x53c0ffee  expected=0x53c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22314565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x53c0ffee  expected=0x53c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22314625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22314685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x53c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22314685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22314685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #83  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22314685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #84  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22314685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=20  wdata=0x54c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22314735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22314765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x54c0ffee  expected=0x54c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22318165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x54c0ffee  expected=0x54c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22318225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22318285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x54c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22318285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22318285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #84  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22318285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #85  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22318285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=21  wdata=0x55c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22318335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22318365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x55c0ffee  expected=0x55c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22321765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x55c0ffee  expected=0x55c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22321825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22321885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x55c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22321885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22321885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #85  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22321885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #86  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22321885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=22  wdata=0x56c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22321935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22321965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x56c0ffee  expected=0x56c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22325365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x56c0ffee  expected=0x56c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22325425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22325485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x56c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22325485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22325485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #86  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22325485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #87  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22325485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=23  wdata=0x57c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22325535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22325565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x57c0ffee  expected=0x57c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22328965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x57c0ffee  expected=0x57c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22329025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22329085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x57c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22329085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22329085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #87  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22329085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #88  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22329085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=24  wdata=0x58c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22329135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22329165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x58c0ffee  expected=0x58c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22332565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x58c0ffee  expected=0x58c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22332625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22332685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x58c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22332685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22332685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #88  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22332685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #89  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22332685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=25  wdata=0x59c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22332735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22332765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x59c0ffee  expected=0x59c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22336165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x59c0ffee  expected=0x59c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22336225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22336285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x59c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22336285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22336285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #89  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22336285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #90  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22336285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=26  wdata=0x5ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22336335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22336365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x5ac0ffee  expected=0x5ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22339765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x5ac0ffee  expected=0x5ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22339825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22339885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x5ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22339885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22339885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #90  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22339885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #91  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22339885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=27  wdata=0x5bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22339935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22339965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x5bc0ffee  expected=0x5bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22343365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x5bc0ffee  expected=0x5bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22343425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22343485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x5bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22343485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22343485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #91  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22343485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #92  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22343485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=28  wdata=0x5cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22343535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22343565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x5cc0ffee  expected=0x5cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22346965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x5cc0ffee  expected=0x5cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22347025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22347085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x5cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22347085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22347085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #92  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22347085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #93  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22347085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=29  wdata=0x5dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22347135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22347165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x5dc0ffee  expected=0x5dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22350565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x5dc0ffee  expected=0x5dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22350625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22350685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x5dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22350685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22350685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #93  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22350685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #94  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22350685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=30  wdata=0x5ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22350735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22350765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x5ec0ffee  expected=0x5ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22354165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x5ec0ffee  expected=0x5ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22354225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22354285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x5ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22354285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22354285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #94  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22354285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #95  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22354285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=31  wdata=0x5fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22354335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22354365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x5fc0ffee  expected=0x5fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22357765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x5fc0ffee  expected=0x5fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22357825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22357885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x5fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22357885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22357885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #95  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22357885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #96  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22357885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=0  wdata=0x60c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22357935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22357965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x60c0ffee  expected=0x60c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22361365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x60c0ffee  expected=0x60c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22361425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22361485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x60c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22361485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22361485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #96  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22361485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #97  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22361485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=1  wdata=0x61c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22361535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22361565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x61c0ffee  expected=0x61c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22364965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x61c0ffee  expected=0x61c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22365025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22365085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x61c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22365085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22365085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #97  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22365085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #98  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22365085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=2  wdata=0x62c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22365135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22365165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x62c0ffee  expected=0x62c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22368565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x62c0ffee  expected=0x62c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22368625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22368685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x62c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22368685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22368685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #98  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22368685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #99  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22368685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=3  wdata=0x63c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22368735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22368765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x63c0ffee  expected=0x63c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22372165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x63c0ffee  expected=0x63c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22372225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22372285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x63c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22372285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22372285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #99  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22372285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #100  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22372285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=4  wdata=0x64c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22372335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22372365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x64c0ffee  expected=0x64c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22375765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x64c0ffee  expected=0x64c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22375825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22375885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x64c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22375885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22375885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #100  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22375885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #101  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22375885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=5  wdata=0x65c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22375935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22375965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x65c0ffee  expected=0x65c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22379365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x65c0ffee  expected=0x65c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22379425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22379485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x65c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22379485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22379485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #101  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22379485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #102  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22379485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=6  wdata=0x66c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22379535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22379565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x66c0ffee  expected=0x66c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22382965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x66c0ffee  expected=0x66c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22383025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22383085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x66c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22383085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22383085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #102  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22383085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #103  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22383085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=7  wdata=0x67c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22383135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22383165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x67c0ffee  expected=0x67c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22386565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x67c0ffee  expected=0x67c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22386625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22386685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x67c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22386685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22386685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #103  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22386685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #104  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22386685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=8  wdata=0x68c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22386735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22386765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x68c0ffee  expected=0x68c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22390165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x68c0ffee  expected=0x68c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22390225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22390285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x68c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22390285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22390285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #104  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22390285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #105  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22390285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=9  wdata=0x69c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22390335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22390365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x69c0ffee  expected=0x69c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22393765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x69c0ffee  expected=0x69c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22393825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22393885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x69c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22393885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22393885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #105  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22393885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #106  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22393885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=10  wdata=0x6ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22393935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22393965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x6ac0ffee  expected=0x6ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22397365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x6ac0ffee  expected=0x6ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22397425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22397485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x6ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22397485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22397485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #106  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22397485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #107  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22397485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=11  wdata=0x6bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22397535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22397565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x6bc0ffee  expected=0x6bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22400965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x6bc0ffee  expected=0x6bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22401025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22401085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x6bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22401085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22401085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #107  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22401085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #108  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22401085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=12  wdata=0x6cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22401135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22401165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x6cc0ffee  expected=0x6cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22404565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x6cc0ffee  expected=0x6cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22404625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22404685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x6cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22404685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22404685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #108  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22404685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #109  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22404685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=13  wdata=0x6dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22404735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22404765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x6dc0ffee  expected=0x6dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22408165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x6dc0ffee  expected=0x6dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22408225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22408285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x6dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22408285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22408285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #109  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22408285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #110  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22408285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=14  wdata=0x6ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22408335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22408365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x6ec0ffee  expected=0x6ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22411765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x6ec0ffee  expected=0x6ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22411825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22411885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x6ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22411885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22411885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #110  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22411885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #111  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22411885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=15  wdata=0x6fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22411935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22411965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x6fc0ffee  expected=0x6fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22415365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x6fc0ffee  expected=0x6fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22415425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22415485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x6fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22415485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22415485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #111  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22415485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #112  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22415485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=16  wdata=0x70c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22415535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22415565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x70c0ffee  expected=0x70c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22418965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x70c0ffee  expected=0x70c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22419025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22419085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x70c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22419085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22419085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #112  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22419085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #113  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22419085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=17  wdata=0x71c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22419135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22419165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x71c0ffee  expected=0x71c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22422565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x71c0ffee  expected=0x71c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22422625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22422685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x71c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22422685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22422685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #113  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22422685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #114  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22422685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=18  wdata=0x72c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22422735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22422765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x72c0ffee  expected=0x72c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22426165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x72c0ffee  expected=0x72c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22426225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22426285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x72c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22426285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22426285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #114  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22426285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #115  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22426285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=19  wdata=0x73c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22426335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22426365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x73c0ffee  expected=0x73c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22429765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x73c0ffee  expected=0x73c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22429825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22429885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x73c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22429885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22429885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #115  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22429885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #116  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22429885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=20  wdata=0x74c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22429935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22429965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x74c0ffee  expected=0x74c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22433365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x74c0ffee  expected=0x74c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22433425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22433485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x74c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22433485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22433485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #116  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22433485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #117  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22433485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=21  wdata=0x75c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22433535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22433565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x75c0ffee  expected=0x75c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22436965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x75c0ffee  expected=0x75c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22437025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22437085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x75c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22437085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22437085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #117  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22437085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #118  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22437085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=22  wdata=0x76c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22437135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22437165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x76c0ffee  expected=0x76c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22440565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x76c0ffee  expected=0x76c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22440625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22440685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x76c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22440685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22440685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #118  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22440685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #119  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22440685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=23  wdata=0x77c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22440735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22440765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x77c0ffee  expected=0x77c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22444165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x77c0ffee  expected=0x77c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22444225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22444285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x77c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22444285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22444285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #119  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22444285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #120  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22444285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=24  wdata=0x78c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22444335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22444365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x78c0ffee  expected=0x78c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22447765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x78c0ffee  expected=0x78c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22447825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22447885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x78c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22447885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22447885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #120  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22447885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #121  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22447885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=25  wdata=0x79c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22447935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22447965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x79c0ffee  expected=0x79c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22451365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x79c0ffee  expected=0x79c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22451425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22451485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x79c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22451485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22451485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #121  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22451485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #122  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22451485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=26  wdata=0x7ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22451535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22451565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7ac0ffee  expected=0x7ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22454965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7ac0ffee  expected=0x7ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22455025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22455085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22455085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22455085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #122  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22455085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #123  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22455085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=27  wdata=0x7bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22455135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22455165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7bc0ffee  expected=0x7bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22458565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7bc0ffee  expected=0x7bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22458625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22458685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22458685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22458685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #123  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22458685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #124  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22458685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=28  wdata=0x7cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22458735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22458765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7cc0ffee  expected=0x7cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22462165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7cc0ffee  expected=0x7cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22462225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22462285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22462285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22462285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #124  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22462285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #125  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22462285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=29  wdata=0x7dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22462335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22462365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7dc0ffee  expected=0x7dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22465765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7dc0ffee  expected=0x7dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22465825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22465885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22465885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22465885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #125  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22465885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #126  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22465885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=30  wdata=0x7ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22465935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22465965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7ec0ffee  expected=0x7ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22469365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7ec0ffee  expected=0x7ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22469425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22469485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22469485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22469485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #126  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22469485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #127  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22469485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=31  wdata=0x7fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22469535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22469565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7fc0ffee  expected=0x7fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22472965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7fc0ffee  expected=0x7fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22473025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22473085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22473085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22473085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #127  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22473085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #128  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22473085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=0  wdata=0x80c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22473135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22473165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x80c0ffee  expected=0x80c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22476565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x80c0ffee  expected=0x80c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22476625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22476685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x80c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22476685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22476685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #128  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22476685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #129  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22476685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=1  wdata=0x81c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22476735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22476765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x81c0ffee  expected=0x81c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22480165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x81c0ffee  expected=0x81c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22480225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22480285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x81c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22480285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22480285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #129  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22480285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #130  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22480285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=2  wdata=0x82c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22480335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22480365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x82c0ffee  expected=0x82c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22483765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x82c0ffee  expected=0x82c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22483825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22483885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x82c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22483885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22483885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #130  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22483885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #131  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22483885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=3  wdata=0x83c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22483935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22483965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x83c0ffee  expected=0x83c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22487365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x83c0ffee  expected=0x83c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22487425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22487485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x83c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22487485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22487485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #131  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22487485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #132  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22487485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=4  wdata=0x84c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22487535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22487565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x84c0ffee  expected=0x84c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22490965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x84c0ffee  expected=0x84c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22491025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22491085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x84c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22491085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22491085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #132  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22491085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #133  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22491085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=5  wdata=0x85c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22491135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22491165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x85c0ffee  expected=0x85c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22494565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x85c0ffee  expected=0x85c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22494625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22494685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x85c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22494685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22494685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #133  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22494685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #134  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22494685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=6  wdata=0x86c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22494735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22494765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x86c0ffee  expected=0x86c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22498165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x86c0ffee  expected=0x86c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22498225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22498285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x86c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22498285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22498285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #134  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22498285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #135  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22498285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=7  wdata=0x87c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22498335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22498365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x87c0ffee  expected=0x87c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22501765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x87c0ffee  expected=0x87c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22501825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22501885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x87c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22501885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22501885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #135  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22501885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #136  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22501885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=8  wdata=0x88c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22501935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22501965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x88c0ffee  expected=0x88c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22505365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x88c0ffee  expected=0x88c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22505425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22505485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x88c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22505485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22505485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #136  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22505485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #137  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22505485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=9  wdata=0x89c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22505535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22505565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x89c0ffee  expected=0x89c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22508965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x89c0ffee  expected=0x89c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22509025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22509085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x89c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22509085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22509085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #137  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22509085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #138  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22509085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=10  wdata=0x8ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22509135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22509165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x8ac0ffee  expected=0x8ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22512565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x8ac0ffee  expected=0x8ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22512625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22512685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x8ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22512685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22512685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #138  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22512685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #139  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22512685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=11  wdata=0x8bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22512735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22512765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x8bc0ffee  expected=0x8bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22516165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x8bc0ffee  expected=0x8bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22516225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22516285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x8bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22516285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22516285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #139  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22516285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #140  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22516285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=12  wdata=0x8cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22516335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22516365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x8cc0ffee  expected=0x8cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22519765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x8cc0ffee  expected=0x8cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22519825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22519885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x8cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22519885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22519885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #140  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22519885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #141  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22519885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=13  wdata=0x8dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22519935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22519965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x8dc0ffee  expected=0x8dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22523365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x8dc0ffee  expected=0x8dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22523425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22523485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x8dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22523485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22523485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #141  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22523485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #142  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22523485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=14  wdata=0x8ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22523535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22523565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x8ec0ffee  expected=0x8ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22526965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x8ec0ffee  expected=0x8ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22527025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22527085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x8ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22527085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22527085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #142  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22527085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #143  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22527085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=15  wdata=0x8fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22527135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22527165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x8fc0ffee  expected=0x8fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22530565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x8fc0ffee  expected=0x8fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22530625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22530685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x8fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22530685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22530685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #143  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22530685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #144  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22530685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=16  wdata=0x90c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22530735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22530765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x90c0ffee  expected=0x90c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22534165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x90c0ffee  expected=0x90c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22534225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22534285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x90c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22534285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22534285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #144  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22534285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #145  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22534285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=17  wdata=0x91c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22534335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22534365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x91c0ffee  expected=0x91c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22537765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x91c0ffee  expected=0x91c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22537825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22537885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x91c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22537885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22537885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #145  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22537885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #146  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22537885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=18  wdata=0x92c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22537935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22537965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x92c0ffee  expected=0x92c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22541365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x92c0ffee  expected=0x92c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22541425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22541485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x92c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22541485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22541485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #146  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22541485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #147  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22541485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=19  wdata=0x93c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22541535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22541565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x93c0ffee  expected=0x93c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22544965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x93c0ffee  expected=0x93c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22545025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22545085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x93c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22545085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22545085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #147  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22545085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #148  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22545085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=20  wdata=0x94c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22545135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22545165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x94c0ffee  expected=0x94c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22548565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x94c0ffee  expected=0x94c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22548625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22548685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x94c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22548685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22548685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #148  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22548685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #149  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22548685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=21  wdata=0x95c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22548735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22548765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x95c0ffee  expected=0x95c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22552165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x95c0ffee  expected=0x95c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22552225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22552285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x95c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22552285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22552285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #149  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22552285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #150  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22552285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=22  wdata=0x96c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22552335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22552365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x96c0ffee  expected=0x96c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22555765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x96c0ffee  expected=0x96c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22555825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22555885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x96c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22555885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22555885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #150  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22555885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #151  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22555885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=23  wdata=0x97c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22555935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22555965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x97c0ffee  expected=0x97c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22559365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x97c0ffee  expected=0x97c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22559425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22559485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x97c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22559485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22559485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #151  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22559485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #152  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22559485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=24  wdata=0x98c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22559535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22559565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x98c0ffee  expected=0x98c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22562965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x98c0ffee  expected=0x98c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22563025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22563085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x98c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22563085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22563085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #152  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22563085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #153  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22563085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=25  wdata=0x99c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22563135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22563165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x99c0ffee  expected=0x99c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22566565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x99c0ffee  expected=0x99c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22566625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22566685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x99c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22566685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22566685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #153  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22566685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #154  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22566685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=26  wdata=0x9ac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22566735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22566765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x9ac0ffee  expected=0x9ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22570165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x9ac0ffee  expected=0x9ac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22570225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22570285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x9ac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22570285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22570285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #154  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22570285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #155  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22570285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=27  wdata=0x9bc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22570335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22570365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x9bc0ffee  expected=0x9bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22573765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x9bc0ffee  expected=0x9bc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22573825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22573885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x9bc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22573885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22573885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #155  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22573885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #156  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22573885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=28  wdata=0x9cc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22573935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22573965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x9cc0ffee  expected=0x9cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22577365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x9cc0ffee  expected=0x9cc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22577425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22577485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x9cc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22577485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22577485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #156  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22577485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #157  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22577485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=29  wdata=0x9dc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22577535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22577565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x9dc0ffee  expected=0x9dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22580965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x9dc0ffee  expected=0x9dc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22581025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22581085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x9dc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22581085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22581085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #157  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22581085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #158  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22581085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=30  wdata=0x9ec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22581135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22581165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x9ec0ffee  expected=0x9ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22584565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x9ec0ffee  expected=0x9ec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22584625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22584685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x9ec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22584685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22584685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #158  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22584685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #159  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22584685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=31  wdata=0x9fc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22584735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22584765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x9fc0ffee  expected=0x9fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22588165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x9fc0ffee  expected=0x9fc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22588225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22588285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x9fc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22588285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22588285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #159  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22588285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #160  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22588285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=0  wdata=0xa0c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22588335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22588365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa0c0ffee  expected=0xa0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22591765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa0c0ffee  expected=0xa0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22591825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22591885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa0c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22591885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22591885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #160  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22591885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #161  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22591885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=1  wdata=0xa1c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22591935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22591965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa1c0ffee  expected=0xa1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22595365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa1c0ffee  expected=0xa1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22595425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22595485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa1c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22595485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22595485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #161  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22595485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #162  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22595485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=2  wdata=0xa2c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22595535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22595565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa2c0ffee  expected=0xa2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22598965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa2c0ffee  expected=0xa2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22599025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22599085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa2c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22599085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22599085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #162  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22599085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #163  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22599085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=3  wdata=0xa3c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22599135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22599165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa3c0ffee  expected=0xa3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22602565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa3c0ffee  expected=0xa3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22602625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22602685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa3c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22602685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22602685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #163  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22602685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #164  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22602685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=4  wdata=0xa4c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22602735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22602765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa4c0ffee  expected=0xa4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22606165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa4c0ffee  expected=0xa4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22606225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22606285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa4c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22606285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22606285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #164  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22606285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #165  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22606285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=5  wdata=0xa5c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22606335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22606365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa5c0ffee  expected=0xa5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22609765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa5c0ffee  expected=0xa5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22609825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22609885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa5c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22609885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22609885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #165  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22609885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #166  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22609885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=6  wdata=0xa6c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22609935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22609965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa6c0ffee  expected=0xa6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22613365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa6c0ffee  expected=0xa6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22613425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22613485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa6c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22613485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22613485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #166  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22613485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #167  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22613485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=7  wdata=0xa7c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22613535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22613565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa7c0ffee  expected=0xa7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22616965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa7c0ffee  expected=0xa7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22617025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22617085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa7c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22617085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22617085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #167  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22617085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #168  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22617085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=8  wdata=0xa8c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22617135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22617165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa8c0ffee  expected=0xa8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22620565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa8c0ffee  expected=0xa8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22620625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22620685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa8c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22620685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22620685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #168  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22620685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #169  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22620685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=9  wdata=0xa9c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22620735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22620765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa9c0ffee  expected=0xa9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22624165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa9c0ffee  expected=0xa9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22624225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22624285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa9c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22624285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22624285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #169  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22624285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #170  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22624285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=10  wdata=0xaac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22624335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22624365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xaac0ffee  expected=0xaac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22627765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xaac0ffee  expected=0xaac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22627825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22627885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xaac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22627885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22627885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #170  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22627885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #171  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22627885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=11  wdata=0xabc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22627935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22627965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xabc0ffee  expected=0xabc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22631365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xabc0ffee  expected=0xabc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22631425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22631485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xabc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22631485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22631485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #171  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22631485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #172  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22631485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=12  wdata=0xacc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22631535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22631565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xacc0ffee  expected=0xacc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22634965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xacc0ffee  expected=0xacc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22635025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22635085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xacc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22635085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22635085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #172  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22635085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #173  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22635085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=13  wdata=0xadc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22635135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22635165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xadc0ffee  expected=0xadc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22638565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xadc0ffee  expected=0xadc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22638625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22638685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xadc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22638685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22638685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #173  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22638685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #174  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22638685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=14  wdata=0xaec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22638735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22638765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xaec0ffee  expected=0xaec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22642165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xaec0ffee  expected=0xaec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22642225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22642285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xaec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22642285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22642285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #174  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22642285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #175  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22642285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=15  wdata=0xafc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22642335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22642365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xafc0ffee  expected=0xafc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22645765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xafc0ffee  expected=0xafc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22645825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22645885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xafc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22645885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22645885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #175  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22645885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #176  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22645885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=16  wdata=0xb0c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22645935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22645965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb0c0ffee  expected=0xb0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22649365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb0c0ffee  expected=0xb0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22649425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22649485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb0c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22649485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22649485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #176  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22649485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #177  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22649485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=17  wdata=0xb1c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22649535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22649565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb1c0ffee  expected=0xb1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22652965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb1c0ffee  expected=0xb1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22653025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22653085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb1c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22653085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22653085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #177  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22653085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #178  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22653085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=18  wdata=0xb2c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22653135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22653165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb2c0ffee  expected=0xb2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22656565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb2c0ffee  expected=0xb2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22656625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22656685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb2c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22656685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22656685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #178  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22656685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #179  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22656685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=19  wdata=0xb3c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22656735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22656765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb3c0ffee  expected=0xb3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22660165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb3c0ffee  expected=0xb3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22660225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22660285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb3c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22660285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22660285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #179  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22660285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #180  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22660285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=20  wdata=0xb4c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22660335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22660365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb4c0ffee  expected=0xb4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22663765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb4c0ffee  expected=0xb4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22663825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22663885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb4c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22663885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22663885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #180  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22663885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #181  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22663885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=21  wdata=0xb5c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22663935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22663965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb5c0ffee  expected=0xb5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22667365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb5c0ffee  expected=0xb5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22667425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22667485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb5c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22667485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22667485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #181  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22667485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #182  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22667485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=22  wdata=0xb6c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22667535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22667565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb6c0ffee  expected=0xb6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22670965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb6c0ffee  expected=0xb6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22671025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22671085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb6c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22671085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22671085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #182  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22671085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #183  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22671085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=23  wdata=0xb7c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22671135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22671165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb7c0ffee  expected=0xb7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22674565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb7c0ffee  expected=0xb7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22674625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22674685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb7c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22674685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22674685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #183  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22674685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #184  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22674685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=24  wdata=0xb8c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22674735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22674765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb8c0ffee  expected=0xb8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22678165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb8c0ffee  expected=0xb8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22678225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22678285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb8c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22678285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22678285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #184  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22678285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #185  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22678285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=25  wdata=0xb9c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22678335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22678365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb9c0ffee  expected=0xb9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22681765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb9c0ffee  expected=0xb9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22681825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22681885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb9c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22681885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22681885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #185  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22681885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #186  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22681885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=26  wdata=0xbac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22681935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22681965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xbac0ffee  expected=0xbac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22685365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xbac0ffee  expected=0xbac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22685425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22685485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xbac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22685485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22685485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #186  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22685485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #187  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22685485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=27  wdata=0xbbc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22685535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22685565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xbbc0ffee  expected=0xbbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22688965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xbbc0ffee  expected=0xbbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22689025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22689085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xbbc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22689085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22689085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #187  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22689085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #188  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22689085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=28  wdata=0xbcc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22689135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22689165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xbcc0ffee  expected=0xbcc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22692565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xbcc0ffee  expected=0xbcc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22692625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22692685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xbcc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22692685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22692685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #188  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22692685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #189  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22692685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=29  wdata=0xbdc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22692735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22692765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xbdc0ffee  expected=0xbdc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22696165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xbdc0ffee  expected=0xbdc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22696225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22696285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xbdc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22696285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22696285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #189  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22696285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #190  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22696285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=30  wdata=0xbec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22696335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22696365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xbec0ffee  expected=0xbec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22699765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xbec0ffee  expected=0xbec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22699825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22699885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xbec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22699885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22699885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #190  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22699885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #191  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22699885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=31  wdata=0xbfc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22699935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22699965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xbfc0ffee  expected=0xbfc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22703365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xbfc0ffee  expected=0xbfc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22703425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22703485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xbfc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22703485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22703485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #191  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22703485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #192  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22703485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=0  wdata=0xc0c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22703535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22703565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc0c0ffee  expected=0xc0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22706965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc0c0ffee  expected=0xc0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22707025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22707085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc0c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22707085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22707085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #192  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22707085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #193  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22707085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=1  wdata=0xc1c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22707135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22707165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc1c0ffee  expected=0xc1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22710565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc1c0ffee  expected=0xc1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22710625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22710685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc1c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22710685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22710685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #193  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22710685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #194  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22710685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=2  wdata=0xc2c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22710735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22710765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc2c0ffee  expected=0xc2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22714165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc2c0ffee  expected=0xc2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22714225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22714285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc2c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22714285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22714285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #194  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22714285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #195  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22714285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=3  wdata=0xc3c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22714335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22714365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc3c0ffee  expected=0xc3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22717765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc3c0ffee  expected=0xc3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22717825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22717885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc3c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22717885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22717885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #195  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22717885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #196  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22717885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=4  wdata=0xc4c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22717935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22717965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc4c0ffee  expected=0xc4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22721365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc4c0ffee  expected=0xc4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22721425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22721485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc4c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22721485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22721485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #196  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22721485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #197  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22721485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=5  wdata=0xc5c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22721535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22721565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc5c0ffee  expected=0xc5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22724965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc5c0ffee  expected=0xc5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22725025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22725085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc5c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22725085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22725085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #197  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22725085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #198  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22725085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=6  wdata=0xc6c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22725135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22725165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc6c0ffee  expected=0xc6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22728565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc6c0ffee  expected=0xc6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22728625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22728685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc6c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22728685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22728685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #198  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22728685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #199  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22728685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=7  wdata=0xc7c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22728735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22728765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc7c0ffee  expected=0xc7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22732165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc7c0ffee  expected=0xc7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22732225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22732285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc7c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22732285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22732285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #199  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22732285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #200  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22732285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=8  wdata=0xc8c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22732335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22732365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc8c0ffee  expected=0xc8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22735765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc8c0ffee  expected=0xc8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22735825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22735885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc8c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22735885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22735885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #200  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22735885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #201  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22735885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=9  wdata=0xc9c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22735935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22735965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc9c0ffee  expected=0xc9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22739365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc9c0ffee  expected=0xc9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22739425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22739485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc9c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22739485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22739485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #201  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22739485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #202  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22739485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=10  wdata=0xcac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22739535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22739565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xcac0ffee  expected=0xcac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22742965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xcac0ffee  expected=0xcac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22743025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22743085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xcac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22743085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22743085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #202  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22743085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #203  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22743085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=11  wdata=0xcbc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22743135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22743165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xcbc0ffee  expected=0xcbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22746565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xcbc0ffee  expected=0xcbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22746625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22746685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xcbc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22746685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22746685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #203  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22746685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #204  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22746685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=12  wdata=0xccc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22746735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22746765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xccc0ffee  expected=0xccc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22750165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xccc0ffee  expected=0xccc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22750225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22750285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xccc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22750285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22750285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #204  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22750285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #205  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22750285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=13  wdata=0xcdc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22750335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22750365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xcdc0ffee  expected=0xcdc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22753765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xcdc0ffee  expected=0xcdc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22753825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22753885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xcdc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22753885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22753885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #205  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22753885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #206  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22753885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=14  wdata=0xcec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22753935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22753965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xcec0ffee  expected=0xcec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22757365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xcec0ffee  expected=0xcec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22757425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22757485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xcec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22757485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22757485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #206  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22757485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #207  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22757485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=15  wdata=0xcfc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22757535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22757565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xcfc0ffee  expected=0xcfc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22760965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xcfc0ffee  expected=0xcfc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22761025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22761085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xcfc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22761085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22761085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #207  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22761085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #208  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22761085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=16  wdata=0xd0c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22761135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22761165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd0c0ffee  expected=0xd0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22764565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd0c0ffee  expected=0xd0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22764625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22764685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd0c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22764685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22764685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #208  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22764685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #209  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22764685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=17  wdata=0xd1c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22764735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22764765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd1c0ffee  expected=0xd1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22768165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd1c0ffee  expected=0xd1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22768225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22768285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd1c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22768285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22768285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #209  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22768285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #210  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22768285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=18  wdata=0xd2c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22768335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22768365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd2c0ffee  expected=0xd2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22771765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd2c0ffee  expected=0xd2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22771825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22771885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd2c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22771885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22771885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #210  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22771885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #211  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22771885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=19  wdata=0xd3c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22771935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22771965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd3c0ffee  expected=0xd3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22775365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd3c0ffee  expected=0xd3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22775425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22775485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd3c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22775485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22775485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #211  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22775485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #212  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22775485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=20  wdata=0xd4c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22775535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22775565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd4c0ffee  expected=0xd4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22778965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd4c0ffee  expected=0xd4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22779025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22779085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd4c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22779085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22779085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #212  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22779085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #213  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22779085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=21  wdata=0xd5c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22779135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22779165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd5c0ffee  expected=0xd5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22782565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd5c0ffee  expected=0xd5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22782625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22782685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd5c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22782685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22782685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #213  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22782685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #214  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22782685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=22  wdata=0xd6c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22782735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22782765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd6c0ffee  expected=0xd6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22786165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd6c0ffee  expected=0xd6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22786225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22786285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd6c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22786285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22786285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #214  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22786285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #215  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22786285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=23  wdata=0xd7c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22786335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22786365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd7c0ffee  expected=0xd7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22789765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd7c0ffee  expected=0xd7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22789825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22789885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd7c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22789885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22789885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #215  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22789885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #216  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22789885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=24  wdata=0xd8c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22789935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22789965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd8c0ffee  expected=0xd8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22793365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd8c0ffee  expected=0xd8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22793425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22793485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd8c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22793485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22793485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #216  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22793485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #217  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22793485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=25  wdata=0xd9c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22793535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22793565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xd9c0ffee  expected=0xd9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22796965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xd9c0ffee  expected=0xd9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22797025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22797085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xd9c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22797085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22797085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #217  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22797085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #218  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22797085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=26  wdata=0xdac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22797135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22797165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xdac0ffee  expected=0xdac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22800565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xdac0ffee  expected=0xdac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22800625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22800685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xdac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22800685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22800685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #218  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22800685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #219  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22800685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=27  wdata=0xdbc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22800735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22800765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xdbc0ffee  expected=0xdbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22804165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xdbc0ffee  expected=0xdbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22804225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22804285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xdbc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22804285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22804285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #219  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22804285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #220  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22804285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=28  wdata=0xdcc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22804335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22804365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xdcc0ffee  expected=0xdcc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22807765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xdcc0ffee  expected=0xdcc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22807825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22807885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xdcc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22807885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22807885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #220  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22807885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #221  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22807885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=29  wdata=0xddc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22807935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22807965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xddc0ffee  expected=0xddc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22811365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xddc0ffee  expected=0xddc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22811425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22811485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xddc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22811485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22811485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #221  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22811485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #222  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22811485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=30  wdata=0xdec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22811535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22811565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xdec0ffee  expected=0xdec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22814965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xdec0ffee  expected=0xdec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22815025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22815085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xdec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22815085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22815085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #222  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22815085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #223  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22815085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=31  wdata=0xdfc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22815135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22815165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xdfc0ffee  expected=0xdfc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22818565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xdfc0ffee  expected=0xdfc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22818625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22818685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xdfc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22818685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22818685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #223  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22818685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #224  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22818685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=0  wdata=0xe0c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22818735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22818765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe0c0ffee  expected=0xe0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22822165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe0c0ffee  expected=0xe0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22822225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22822285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe0c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22822285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22822285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #224  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22822285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #225  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22822285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=1  wdata=0xe1c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22822335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22822365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe1c0ffee  expected=0xe1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22825765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe1c0ffee  expected=0xe1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22825825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22825885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe1c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22825885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22825885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #225  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22825885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #226  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22825885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=2  wdata=0xe2c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22825935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22825965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe2c0ffee  expected=0xe2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22829365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe2c0ffee  expected=0xe2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22829425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22829485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe2c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22829485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22829485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #226  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22829485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #227  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22829485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=3  wdata=0xe3c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22829535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22829565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe3c0ffee  expected=0xe3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22832965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe3c0ffee  expected=0xe3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22833025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22833085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe3c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22833085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22833085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #227  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22833085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #228  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22833085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=4  wdata=0xe4c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22833135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22833165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe4c0ffee  expected=0xe4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22836565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe4c0ffee  expected=0xe4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22836625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22836685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe4c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22836685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22836685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #228  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22836685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #229  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22836685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=5  wdata=0xe5c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22836735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22836765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe5c0ffee  expected=0xe5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22840165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe5c0ffee  expected=0xe5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22840225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22840285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe5c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22840285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22840285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #229  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22840285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #230  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22840285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=6  wdata=0xe6c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22840335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22840365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe6c0ffee  expected=0xe6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22843765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe6c0ffee  expected=0xe6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22843825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22843885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe6c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22843885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22843885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #230  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22843885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #231  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22843885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=7  wdata=0xe7c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22843935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22843965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe7c0ffee  expected=0xe7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22847365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe7c0ffee  expected=0xe7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22847425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22847485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe7c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22847485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22847485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #231  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22847485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #232  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22847485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=8  wdata=0xe8c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22847535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22847565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe8c0ffee  expected=0xe8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22850965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe8c0ffee  expected=0xe8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22851025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22851085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe8c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22851085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22851085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #232  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22851085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #233  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22851085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=9  wdata=0xe9c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22851135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22851165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe9c0ffee  expected=0xe9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22854565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe9c0ffee  expected=0xe9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22854625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22854685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe9c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22854685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22854685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #233  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22854685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #234  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22854685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=10  wdata=0xeac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22854735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22854765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xeac0ffee  expected=0xeac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22858165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xeac0ffee  expected=0xeac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22858225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22858285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xeac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22858285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22858285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #234  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22858285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #235  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22858285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=11  wdata=0xebc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22858335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22858365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xebc0ffee  expected=0xebc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22861765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xebc0ffee  expected=0xebc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22861825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22861885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xebc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22861885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22861885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #235  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22861885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #236  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22861885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=12  wdata=0xecc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22861935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22861965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xecc0ffee  expected=0xecc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22865365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xecc0ffee  expected=0xecc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22865425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22865485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xecc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22865485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22865485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #236  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22865485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #237  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22865485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=13  wdata=0xedc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22865535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22865565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xedc0ffee  expected=0xedc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22868965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xedc0ffee  expected=0xedc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22869025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22869085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xedc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22869085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22869085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #237  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22869085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #238  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22869085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=14  wdata=0xeec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22869135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22869165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xeec0ffee  expected=0xeec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22872565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xeec0ffee  expected=0xeec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22872625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22872685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xeec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22872685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22872685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #238  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22872685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #239  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22872685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0xefc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22872735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22872765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xefc0ffee  expected=0xefc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22876165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xefc0ffee  expected=0xefc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22876225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22876285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xefc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22876285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22876285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #239  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22876285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #240  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22876285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=16  wdata=0xf0c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22876335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22876365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf0c0ffee  expected=0xf0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22879765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf0c0ffee  expected=0xf0c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22879825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22879885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf0c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22879885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22879885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #240  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22879885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #241  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22879885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=17  wdata=0xf1c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22879935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22879965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf1c0ffee  expected=0xf1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22883365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf1c0ffee  expected=0xf1c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22883425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22883485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf1c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22883485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22883485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #241  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22883485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #242  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22883485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=18  wdata=0xf2c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22883535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22883565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf2c0ffee  expected=0xf2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22886965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf2c0ffee  expected=0xf2c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22887025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22887085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf2c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22887085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22887085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #242  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22887085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #243  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22887085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=19  wdata=0xf3c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22887135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22887165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf3c0ffee  expected=0xf3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22890565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf3c0ffee  expected=0xf3c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22890625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22890685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf3c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22890685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22890685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #243  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22890685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #244  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22890685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=20  wdata=0xf4c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22890735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22890765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf4c0ffee  expected=0xf4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22894165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf4c0ffee  expected=0xf4c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22894225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22894285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf4c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22894285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22894285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #244  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22894285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #245  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22894285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=21  wdata=0xf5c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22894335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22894365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf5c0ffee  expected=0xf5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22897765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf5c0ffee  expected=0xf5c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22897825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22897885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf5c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22897885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22897885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #245  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22897885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #246  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22897885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=22  wdata=0xf6c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22897935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22897965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf6c0ffee  expected=0xf6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22901365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf6c0ffee  expected=0xf6c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22901425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22901485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf6c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22901485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22901485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #246  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22901485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #247  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22901485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=23  wdata=0xf7c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22901535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22901565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf7c0ffee  expected=0xf7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22904965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf7c0ffee  expected=0xf7c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22905025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22905085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf7c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22905085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22905085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #247  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22905085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #248  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22905085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=24  wdata=0xf8c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22905135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22905165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf8c0ffee  expected=0xf8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22908565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf8c0ffee  expected=0xf8c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22908625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22908685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf8c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22908685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22908685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #248  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22908685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #249  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22908685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=25  wdata=0xf9c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22908735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22908765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf9c0ffee  expected=0xf9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22912165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf9c0ffee  expected=0xf9c0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22912225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22912285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf9c0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22912285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22912285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #249  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22912285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #250  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22912285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=26  wdata=0xfac0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22912335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22912365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xfac0ffee  expected=0xfac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22915765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xfac0ffee  expected=0xfac0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22915825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22915885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xfac0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22915885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22915885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #250  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22915885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #251  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22915885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=27  wdata=0xfbc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22915935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22915965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xfbc0ffee  expected=0xfbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22919365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xfbc0ffee  expected=0xfbc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22919425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22919485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xfbc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22919485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22919485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #251  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22919485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #252  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22919485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=28  wdata=0xfcc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22919535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22919565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xfcc0ffee  expected=0xfcc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22922965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xfcc0ffee  expected=0xfcc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22923025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22923085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xfcc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22923085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22923085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #252  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22923085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #253  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22923085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=29  wdata=0xfdc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22923135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22923165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xfdc0ffee  expected=0xfdc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22926565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xfdc0ffee  expected=0xfdc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22926625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22926685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xfdc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22926685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22926685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #253  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22926685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #254  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22926685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=30  wdata=0xfec0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22926735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22926765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xfec0ffee  expected=0xfec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22930165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xfec0ffee  expected=0xfec0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22930225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22930285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xfec0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22930285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22930285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #254  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22930285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #255  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22930285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=31  wdata=0xffc0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22930335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22930365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xffc0ffee  expected=0xffc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22933765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xffc0ffee  expected=0xffc0ffee  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22933825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22933885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xffc0ffee  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22933885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22933885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #255  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22933885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #256  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22933885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0x00000000
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22933935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22933965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x00000000  expected=0x00000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22937365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x00000000  expected=0x00000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22937425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22937485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x00000000  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22937485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22937485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #256  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22937485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #257  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22937485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0xffffffff
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22937535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22937565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22940965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22941025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22941085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xffffffff  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22941085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22941085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #257  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22941085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #258  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22941085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0x55555555
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22941135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22941165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x55555555  expected=0x55555555  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22944565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x55555555  expected=0x55555555  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22944625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22944685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x55555555  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22944685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22944685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #258  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22944685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #259  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22944685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0xaaaaaaaa
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22944735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22944765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xaaaaaaaa  expected=0xaaaaaaaa  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22948165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xaaaaaaaa  expected=0xaaaaaaaa  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22948225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22948285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xaaaaaaaa  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22948285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22948285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #259  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22948285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #260  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22948285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0x00000001
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22948335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22948365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x00000001  expected=0x00000001  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22951765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x00000001  expected=0x00000001  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22951825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22951885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x00000001  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22951885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22951885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #260  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22951885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #261  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22951885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0x80000000
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22951935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22951965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x80000000  expected=0x80000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22955365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x80000000  expected=0x80000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22955425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22955485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x80000000  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22955485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22955485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #261  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22955485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #262  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22955485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0xfffffffe
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22955535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22955565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xfffffffe  expected=0xfffffffe  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22958965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xfffffffe  expected=0xfffffffe  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22959025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22959085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xfffffffe  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22959085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22959085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #262  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22959085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #263  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22959085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=15  wdata=0x7fffffff
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22959135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22959165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7fffffff  expected=0x7fffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22962565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7fffffff  expected=0x7fffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22962625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22962685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7fffffff  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22962685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22962685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #263  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22962685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #264  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22962685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0x00000000
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22962735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22962765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x00000000  expected=0x00000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22966165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x00000000  expected=0x00000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22966225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22966285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x00000000  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22966285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22966285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #264  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22966285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #265  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22966285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0xffffffff
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22966335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22966365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22969765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22969825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22969885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xffffffff  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22969885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22969885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #265  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22969885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #266  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22969885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0x55555555
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22969935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22969965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x55555555  expected=0x55555555  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22973365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x55555555  expected=0x55555555  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22973425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22973485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x55555555  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22973485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22973485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #266  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22973485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #267  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22973485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0xaaaaaaaa
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22973535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22973565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xaaaaaaaa  expected=0xaaaaaaaa  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22976965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xaaaaaaaa  expected=0xaaaaaaaa  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22977025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22977085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xaaaaaaaa  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22977085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22977085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #267  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22977085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #268  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22977085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0x00000001
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22977135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22977165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x00000001  expected=0x00000001  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22980565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x00000001  expected=0x00000001  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22980625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22980685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x00000001  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22980685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22980685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #268  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22980685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #269  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22980685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0x80000000
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22980735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22980765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x80000000  expected=0x80000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22984165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x80000000  expected=0x80000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22984225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22984285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x80000000  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22984285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22984285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #269  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22984285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #270  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22984285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0xfffffffe
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22984335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22984365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xfffffffe  expected=0xfffffffe  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22987765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xfffffffe  expected=0xfffffffe  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22987825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22987885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xfffffffe  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22987885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22987885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #270  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22987885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #271  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22987885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=15  wdata=0x7fffffff
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22987935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22987965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x7fffffff  expected=0x7fffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22991365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x7fffffff  expected=0x7fffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22991425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22991485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x7fffffff  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22991485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22991485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #271  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22991485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #272  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22991485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=0  wdata=0xb6f2b032
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22991535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22991565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb6f2b032  expected=0xb6f2b032  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22994965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb6f2b032  expected=0xb6f2b032  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22995025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22995085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb6f2b032  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22995085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22995085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #272  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22995085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #273  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22995085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=3  wdata=0xdf278fa2
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22995135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22995165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xdf278fa2  expected=0xdf278fa2  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 22998565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xdf278fa2  expected=0xdf278fa2  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 22998625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 22998685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xdf278fa2  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 22998685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 22998685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #273  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 22998685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #274  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 22998685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=20  wdata=0xcbabd340
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 22998735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 22998765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xcbabd340  expected=0xcbabd340  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23002165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xcbabd340  expected=0xcbabd340  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23002225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23002285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xcbabd340  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23002285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23002285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #274  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23002285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #275  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23002285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=31  wdata=0x24587999
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23002335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23002365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x24587999  expected=0x24587999  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23005765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x24587999  expected=0x24587999  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23005825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23005885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x24587999  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23005885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23005885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #275  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23005885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #276  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23005885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=2  wdata=0xffffffff
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23005935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23005965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23009365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23009425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23009485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xffffffff  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23009485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23009485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #276  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23009485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #277  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23009485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=21  wdata=0xffffffff
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23009535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23009565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23012965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xffffffff  expected=0xffffffff  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23013025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23013085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xffffffff  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23013085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23013085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #277  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23013085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #278  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23013085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=4  wdata=0x92d77b58
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23013135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23013165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x92d77b58  expected=0x92d77b58  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23016565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x92d77b58  expected=0x92d77b58  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23016625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23016685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x92d77b58  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23016685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23016685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #278  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23016685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #279  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23016685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=23  wdata=0x58f41c7f
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23016735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23016765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x58f41c7f  expected=0x58f41c7f  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23020165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x58f41c7f  expected=0x58f41c7f  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23020225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23020285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x58f41c7f  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23020285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23020285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #279  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23020285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #280  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23020285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=20  wdata=0x6bfb2ad2
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23020335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23020365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x6bfb2ad2  expected=0x6bfb2ad2  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23023765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x6bfb2ad2  expected=0x6bfb2ad2  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23023825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23023885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x6bfb2ad2  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23023885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23023885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #280  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23023885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #281  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23023885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=15  wdata=0xa97ae7e0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23023935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23023965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa97ae7e0  expected=0xa97ae7e0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23027365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa97ae7e0  expected=0xa97ae7e0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23027425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23027485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa97ae7e0  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23027485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23027485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #281  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23027485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #282  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23027485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=7  wdata=0x513288e9
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23027535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23027565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x513288e9  expected=0x513288e9  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23030965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x513288e9  expected=0x513288e9  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23031025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23031085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x513288e9  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23031085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23031085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #282  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23031085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #283  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23031085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=7  wdata=0x5da4d833
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23031135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23031165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x5da4d833  expected=0x5da4d833  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23034565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x5da4d833  expected=0x5da4d833  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23034625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23034685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x5da4d833  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23034685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23034685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #283  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23034685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #284  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23034685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=6  wdata=0xe7e5e3ac
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23034735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23034765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xe7e5e3ac  expected=0xe7e5e3ac  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23038165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xe7e5e3ac  expected=0xe7e5e3ac  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23038225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23038285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xe7e5e3ac  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23038285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23038285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #284  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23038285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #285  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23038285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=4  loc=15  wdata=0xb2e72a03
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23038335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23038365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xb2e72a03  expected=0xb2e72a03  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23041765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xb2e72a03  expected=0xb2e72a03  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23041825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23041885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xb2e72a03  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23041885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23041885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #285  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23041885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #286  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23041885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=28  wdata=0xf487d50b
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23041935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23041965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf487d50b  expected=0xf487d50b  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23045365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf487d50b  expected=0xf487d50b  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23045425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23045485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf487d50b  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23045485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23045485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #286  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23045485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #287  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23045485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=4  wdata=0xde32453d
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23045535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23045565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xde32453d  expected=0xde32453d  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23048965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xde32453d  expected=0xde32453d  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23049025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23049085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xde32453d  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23049085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23049085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #287  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23049085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #288  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23049085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=7  loc=28  wdata=0x2e59e776
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23049135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23049165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x2e59e776  expected=0x2e59e776  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23052565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x2e59e776  expected=0x2e59e776  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23052625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23052685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x2e59e776  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23052685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23052685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #288  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23052685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #289  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23052685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=8  wdata=0x00000000
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23052735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23052765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x00000000  expected=0x00000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23056165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x00000000  expected=0x00000000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23056225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23056285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x00000000  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23056285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23056285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #289  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23056285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #290  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23056285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=22  wdata=0x1d71217f
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23056335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23056365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1d71217f  expected=0x1d71217f  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23059765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1d71217f  expected=0x1d71217f  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23059825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23059885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1d71217f  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23059885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23059885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #290  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23059885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #291  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23059885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=3  wdata=0x27ce43a9
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23059935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23059965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x27ce43a9  expected=0x27ce43a9  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23063365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x27ce43a9  expected=0x27ce43a9  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23063425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23063485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x27ce43a9  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23063485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23063485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #291  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23063485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #292  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23063485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=27  wdata=0x9ea989eb
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23063535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23063565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x9ea989eb  expected=0x9ea989eb  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23066965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x9ea989eb  expected=0x9ea989eb  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23067025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23067085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x9ea989eb  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23067085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23067085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #292  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23067085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #293  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23067085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=0  loc=31  wdata=0xa0d43f58
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23067135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23067165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xa0d43f58  expected=0xa0d43f58  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23070565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xa0d43f58  expected=0xa0d43f58  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23070625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23070685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xa0d43f58  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23070685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23070685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #293  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23070685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #294  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23070685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=12  wdata=0xf730a6fe
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23070735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23070765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xf730a6fe  expected=0xf730a6fe  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23074165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xf730a6fe  expected=0xf730a6fe  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23074225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23074285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xf730a6fe  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23074285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23074285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #294  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23074285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #295  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23074285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=2  loc=0  wdata=0x0dccb200
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23074335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23074365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x0dccb200  expected=0x0dccb200  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23077765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x0dccb200  expected=0x0dccb200  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23077825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23077885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x0dccb200  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23077885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23077885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #295  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23077885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #296  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23077885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=8  wdata=0xbb210225
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23077935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23077965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xbb210225  expected=0xbb210225  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23081365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xbb210225  expected=0xbb210225  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23081425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23081485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xbb210225  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23081485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23081485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #296  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23081485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #297  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23081485000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=1  wdata=0xaed1ae3d
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23081535000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23081565000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xaed1ae3d  expected=0xaed1ae3d  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23084965000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xaed1ae3d  expected=0xaed1ae3d  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23085025000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23085085000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xaed1ae3d  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23085085000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23085085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #297  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23085085000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #298  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23085085000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=3  loc=23  wdata=0x80206301
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23085135000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23085165000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x80206301  expected=0x80206301  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23088565000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x80206301  expected=0x80206301  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23088625000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23088685000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x80206301  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23088685000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23088685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #298  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23088685000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #299  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23088685000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=1  loc=29  wdata=0xc35706cf
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23088735000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23088765000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0xc35706cf  expected=0xc35706cf  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23092165000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0xc35706cf  expected=0xc35706cf  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23092225000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23092285000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0xc35706cf  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23092285000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23092285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #299  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23092285000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #300  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23092285000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=5  loc=29  wdata=0x66c6cb50
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23092335000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23092365000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x66c6cb50  expected=0x66c6cb50  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23095765000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x66c6cb50  expected=0x66c6cb50  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23095825000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23095885000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x66c6cb50  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23095885000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23095885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #300  END (PASS) ====================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(284) @ 23095885000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #301  START ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(287) @ 23095885000: uvm_test_top.env.agent.driver [DRV]   INPUT   : chip=6  loc=20  wdata=0x1c2c3260
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(292) @ 23095935000: uvm_test_top.env.agent.driver [DRV]   STAGE 1 : AXI WRITE          -> BRESP=0  (ACCEPTED)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(308) @ 23095965000: uvm_test_top.env.agent.driver [DRV]   STAGE 2 : TX BANK FETCH       -> dout=0x1c2c3260  expected=0x1c2c3260  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(315) @ 23099365000: uvm_test_top.env.agent.driver [DRV]   STAGE 3 : RX BANK CAPTURE     -> din=0x1c2c3260  expected=0x1c2c3260  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(322) @ 23099425000: uvm_test_top.env.agent.driver [DRV]   STAGE 4 : getRxRegStat        -> 1  (READY)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(328) @ 23099485000: uvm_test_top.env.agent.driver [DRV]   STAGE 5 : AXI READ-BACK       -> rdata=0x1c2c3260  rresp=0  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(335) @ 23099485000: uvm_test_top.env.agent.driver [DRV]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(338) @ 23099485000: uvm_test_top.env.agent.driver [DRV] ==================== TRANSACTION #301  END (PASS) ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1251) @ 23099485000: uvm_test_top.env.agent.sequencer@@seq [axi_spi_full_seq] All 302 transactions issued

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(493) @ 23099485000: uvm_test_top.env.agent.driver [DRV_FIFO] ================ SSQ MAX-CONCURRENT (8-chip burst) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(494) @ 23099485000: uvm_test_top.env.agent.driver [DRV_FIFO]   INPUT   : 8 writes, one per chip (0-7), all to loc=10, zero waiting between them, then a 9th write to chip=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099535000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=0 -> BRESP=0  wrPtr=1  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099585000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=1 -> BRESP=0  wrPtr=1  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099635000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=2 -> BRESP=0  wrPtr=2  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099685000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=3 -> BRESP=0  wrPtr=3  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099735000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=4 -> BRESP=0  wrPtr=4  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099785000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=5 -> BRESP=0  wrPtr=5  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099835000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=6 -> BRESP=0  wrPtr=6  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(501) @ 23099885000: uvm_test_top.env.agent.driver [DRV_FIFO]   burst write chip=7 -> BRESP=0  wrPtr=7  full=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(508) @ 23099935000: uvm_test_top.env.agent.driver [DRV_FIFO]   9th write (chip=0 again)   -> BRESP=0  (ACCEPTED - chip already freed by FETCH)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(514) @ 23099935000: uvm_test_top.env.agent.driver [DRV_FIFO]   OUTPUT  : all 8 accepted=1, full-never-asserted(8<16)=1 -> PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(528) @ 71130165000: uvm_test_top.env.agent.driver [DRV_FIFO] ==========================================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(757) @ 71130165000: uvm_test_top.env.agent.driver [DRV_ISO] ================ ADDRESS ISOLATION TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(758) @ 71130165000: uvm_test_top.env.agent.driver [DRV_ISO]   INPUT   : write chip=0 loc=5=0x10100000, chip=2 loc=10=0x20200000, chip=4 loc=20=0x30300000, chip=6 loc=30=0x40400000 (each fully completed before the next)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(773) @ 71143825000: uvm_test_top.env.agent.driver [DRV_ISO]   OUTPUT  : re-read chip=0 loc=5 -> 0x10100000  expected 0x10100000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(773) @ 71143885000: uvm_test_top.env.agent.driver [DRV_ISO]   OUTPUT  : re-read chip=2 loc=10 -> 0x20200000  expected 0x20200000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(773) @ 71143945000: uvm_test_top.env.agent.driver [DRV_ISO]   OUTPUT  : re-read chip=4 loc=20 -> 0x30300000  expected 0x30300000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(773) @ 71144005000: uvm_test_top.env.agent.driver [DRV_ISO]   OUTPUT  : re-read chip=6 loc=30 -> 0x40400000  expected 0x40400000  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(784) @ 71144005000: uvm_test_top.env.agent.driver [DRV_ISO]   OUTPUT  : overall = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(785) @ 71144005000: uvm_test_top.env.agent.driver [DRV_ISO] ==========================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(794) @ 71144005000: uvm_test_top.env.agent.driver [DRV_SIMUL] ================ SIMULTANEOUS R/W TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(795) @ 71144005000: uvm_test_top.env.agent.driver [DRV_SIMUL]   INPUT   : setup chip=5 loc=18=0xc0defeed, then CONCURRENTLY write chip=1 loc=1=0x12345678 while reading chip=5 loc=18
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(813) @ 71147525000: uvm_test_top.env.agent.driver [DRV_SIMUL]   OUTPUT  : concurrent WRITE -> BRESP=0  PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(814) @ 71147525000: uvm_test_top.env.agent.driver [DRV_SIMUL]   OUTPUT  : concurrent READ  -> rdata=0xc0defeed RRESP=0  PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(820) @ 71150865000: uvm_test_top.env.agent.driver [DRV_SIMUL] ==========================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(861) @ 71150865000: uvm_test_top.env.agent.driver [DRV_FLOOD] ================ QUEUE FLOODING / SUSTAINED STRESS TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(862) @ 71150865000: uvm_test_top.env.agent.driver [DRV_FLOOD]   INPUT   : 40 writes (5 locations x 8 chips) fired back-to-back, zero waiting
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(875) @ 71152865000: uvm_test_top.env.agent.driver [DRV_FLOOD]   OUTPUT  : burst complete, 9/40 accepted, 31/40 rejected (busy) under sustained load
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 77152925000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=0 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 83152985000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=1 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 89153045000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=2 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 95153105000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=3 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 101153165000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=4 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 107153225000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=5 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 113153285000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=6 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 119153345000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=7 loc=1 round=0 did not round-trip correctly
UVM_ERROR C:/Users/Asus/Downloads/tb_axi_spi_full.sv(889) @ 125153405000: uvm_test_top.env.agent.driver [DRV_FLOOD] Flooding: accepted write chip=0 loc=2 round=1 did not round-trip correctly
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(921) @ 125261925000: uvm_test_top.env.agent.driver [DRV_FLOOD]   OUTPUT  : retry pass 31 succeeded, 0 failed  -> PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(926) @ 125261925000: uvm_test_top.env.agent.driver [DRV_FLOOD] =========================================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(353) @ 125261925000: uvm_test_top.env.agent.driver [DRV_HAZARD] ================ RAW (Read-After-Write) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(354) @ 125261925000: uvm_test_top.env.agent.driver [DRV_HAZARD]   INPUT   : chip=1 loc=3 new_wdata=0x11112222
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(357) @ 125261985000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 1 : baseline RX read   -> 0x00f10002
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(360) @ 125262035000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 2 : write issued       -> BRESP=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(363) @ 125262095000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 3 : IMMEDIATE RX read  -> 0x00f10002  (must still equal baseline, must NOT equal new_wdata)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(370) @ 125262095000: uvm_test_top.env.agent.driver [DRV_HAZARD]   OUTPUT  : RAW isolation = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(379) @ 131262155000: uvm_test_top.env.agent.driver [DRV_HAZARD]   DRAIN   : after full round-trip, RX read -> 0x11112222  (expected 0x11112222)  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(382) @ 131262155000: uvm_test_top.env.agent.driver [DRV_HAZARD] ===============================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(353) @ 131262155000: uvm_test_top.env.agent.driver [DRV_HAZARD] ================ RAW (Read-After-Write) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(354) @ 131262155000: uvm_test_top.env.agent.driver [DRV_HAZARD]   INPUT   : chip=6 loc=20 new_wdata=0xabcdef01
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(357) @ 131262215000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 1 : baseline RX read   -> 0x1c2c3260
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(360) @ 131262265000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 2 : write issued       -> BRESP=0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(363) @ 131262325000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 3 : IMMEDIATE RX read  -> 0x1c2c3260  (must still equal baseline, must NOT equal new_wdata)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(370) @ 131262325000: uvm_test_top.env.agent.driver [DRV_HAZARD]   OUTPUT  : RAW isolation = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(379) @ 137262385000: uvm_test_top.env.agent.driver [DRV_HAZARD]   DRAIN   : after full round-trip, RX read -> 0xabcdef01  (expected 0xabcdef01)  MATCH
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(382) @ 137262385000: uvm_test_top.env.agent.driver [DRV_HAZARD] ===============================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(395) @ 137262385000: uvm_test_top.env.agent.driver [DRV_HAZARD] ================ WAR (Write-After-Read) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(396) @ 137262385000: uvm_test_top.env.agent.driver [DRV_HAZARD]   INPUT   : chip=2 loc=7 wdata=0x33334444
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(399) @ 137262445000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 1 : read              -> 0x513288e9
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(402) @ 137262495000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 2 : immediate write   -> BRESP=0  ACCEPTED
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(413) @ 137265925000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 3 : full round-trip   -> dout=0x33334444 din=0x33334444 final_read=0x33334444
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(416) @ 137265925000: uvm_test_top.env.agent.driver [DRV_HAZARD]   OUTPUT  : WAR = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(419) @ 137265925000: uvm_test_top.env.agent.driver [DRV_HAZARD] ===============================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(395) @ 137265925000: uvm_test_top.env.agent.driver [DRV_HAZARD] ================ WAR (Write-After-Read) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(396) @ 137265925000: uvm_test_top.env.agent.driver [DRV_HAZARD]   INPUT   : chip=5 loc=25 wdata=0xfeed1234
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(399) @ 137265985000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 1 : read              -> 0xb9c0ffee
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(402) @ 137266035000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 2 : immediate write   -> BRESP=0  ACCEPTED
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(413) @ 137269525000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 3 : full round-trip   -> dout=0xfeed1234 din=0xfeed1234 final_read=0xfeed1234
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(416) @ 137269525000: uvm_test_top.env.agent.driver [DRV_HAZARD]   OUTPUT  : WAR = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(419) @ 137269525000: uvm_test_top.env.agent.driver [DRV_HAZARD] ===============================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(432) @ 137269525000: uvm_test_top.env.agent.driver [DRV_HAZARD] ================ WAW (Write-After-Write) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(433) @ 137269525000: uvm_test_top.env.agent.driver [DRV_HAZARD]   INPUT   : chip=3 loc=12 wdata1=0xa5a50001 wdata2=0x5a5a0002 (last-write-wins expected)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(440) @ 137272965000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 1 : write #1 round-trip -> BRESP=0 dout=0xa5a50001 din=0xa5a50001
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(447) @ 137276365000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 2 : write #2 round-trip -> BRESP=0 dout=0x5a5a0002 din=0x5a5a0002
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(452) @ 137276425000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 3 : final read           -> 0x5a5a0002  (expected wdata2=0x5a5a0002)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(462) @ 137276425000: uvm_test_top.env.agent.driver [DRV_HAZARD]   OUTPUT  : WAW (last-write-wins) = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(465) @ 137276425000: uvm_test_top.env.agent.driver [DRV_HAZARD] =================================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(432) @ 137276425000: uvm_test_top.env.agent.driver [DRV_HAZARD] ================ WAW (Write-After-Write) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(433) @ 137276425000: uvm_test_top.env.agent.driver [DRV_HAZARD]   INPUT   : chip=7 loc=0 wdata1=0x00001111 wdata2=0xffff2222 (last-write-wins expected)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(440) @ 137279865000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 1 : write #1 round-trip -> BRESP=0 dout=0x00001111 din=0x00001111
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(447) @ 137283265000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 2 : write #2 round-trip -> BRESP=0 dout=0xffff2222 din=0xffff2222
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(452) @ 137283325000: uvm_test_top.env.agent.driver [DRV_HAZARD]   STAGE 3 : final read           -> 0xffff2222  (expected wdata2=0xffff2222)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(462) @ 137283325000: uvm_test_top.env.agent.driver [DRV_HAZARD]   OUTPUT  : WAW (last-write-wins) = PASS
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(465) @ 137283325000: uvm_test_top.env.agent.driver [DRV_HAZARD] =================================================================

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(934) @ 137283325000: uvm_test_top.env.agent.driver [DRV_MALFORMED] ================ MISSING-HANDSHAKE (malformed write) TEST ================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(935) @ 137283325000: uvm_test_top.env.agent.driver [DRV_MALFORMED]   Run last deliberately, in case AXI_S has no timeout for an address-only write.
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(936) @ 137283325000: uvm_test_top.env.agent.driver [DRV_MALFORMED]   INPUT   : AWADDR=chip4/loc4, AWVALID asserted, WVALID deliberately NEVER asserted
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(949) @ 137285335000: uvm_test_top.env.agent.driver [DRV_MALFORMED]   OUTPUT  : after 200 cycles with AWVALID alone (no WVALID) -> BVALID seen=0  PASS (malformed write correctly never completed)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(959) @ 137285345000: uvm_test_top.env.agent.driver [DRV_MALFORMED]   INPUT   : recovery probe - a normal, well-formed write to the same address (chip4/loc4)
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(983) @ 137285385000: uvm_test_top.env.agent.driver [DRV_MALFORMED]   OUTPUT  : RECOVERY - a subsequent well-formed write completed normally - write channel recovered.
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(990) @ 137285385000: uvm_test_top.env.agent.driver [DRV_MALFORMED] ===========================================================================
UVM_INFO verilog_src/uvm-1.1d/src/base/uvm_objection.svh(1267) @ 137290385000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1106) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] ==================== SCOREBOARD SUMMARY ====================
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1107) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] Total transactions issued        : 302
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1108) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] Rejected at AXI (chip busy/full) : 0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1109) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] TX bank (dout) match / mismatch  : 302 / 0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1110) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] RX bank (din)  match / mismatch  : 302 / 0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1111) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] getRxRegStat ready / not-ready   : 302 / 0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1112) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] Final AXI read-back match / mismatch : 302 / 0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1113) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] OVERALL pass / fail               : 302 / 0
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1116) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] RESULT: *** TEST PASSED ***

UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1121) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] -------------------- FUNCTIONAL COVERAGE --------------------
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1122) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] chip (0-7)                      : 100.00 %
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1123) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] location (0-31)                 : 100.00 %
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1124) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] chip x location CROSS (256 bins): 100.00 %
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1125) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] data pattern corner cases       : 100.00 %
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1126) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] write BRESP (OKAY/SLVERR)       : 50.00 %
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1127) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] overall pass/fail outcomes      : 50.00 %
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1128) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] TOTAL functional coverage       : 70.00 %
UVM_INFO C:/Users/Asus/Downloads/tb_axi_spi_full.sv(1133) @ 137290385000: uvm_test_top.env.scoreboard [SB_REPORT] ==============================================================

--- UVM Report Summary ---

** Report counts by severity
UVM_INFO : 2856
UVM_WARNING :    2
UVM_ERROR :   10
UVM_FATAL :    0
** Report counts by id
[DRV]  2718
[DRV_COLD]     5
[DRV_DECODE]     7
[DRV_FIFO]    28
[DRV_FLOOD]    14
[DRV_HAZARD]    44
[DRV_ISO]     8
[DRV_MALFORMED]     7
[DRV_ORDER]     4
[DRV_RESET]     4
[DRV_SIMUL]     5
[Questa UVM]     2
[RNTST]     1
[SB_REPORT]    18
[TEST_DONE]     1
[axi_spi_full_seq]     2
** Note: $finish    : C:/questasim64_2024.1/win64/../verilog_src/uvm-1.1d/src/base/uvm_root.svh(430)
   Time: 137290385 ns  Iteration: 54  Instance: /tb_top
# [axi_spi_full_seq]     2
# ** Note: $finish    : C:/questasim64_2024.1/win64/../verilog_src/uvm-1.1d/src/base/uvm_root.svh(430)
#    Time: 137290385 ns  Iteration: 54  Instance: /tb_top
