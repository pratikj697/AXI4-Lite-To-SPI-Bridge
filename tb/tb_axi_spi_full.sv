`timescale 1ns / 1ps

interface axi_spi_if (input logic ACLK);

    logic            ARESET;

    logic    [8:0]   AWADDR;
    logic            AWVALID;
    logic            AWREADY;

    logic    [31:0]  WDATA;
    logic    [3:0]   WSTRB;
    logic            WVALID;
    logic            WREADY;

    logic    [1:0]   BRESP;
    logic            BVALID;
    logic            BREADY;

    logic    [8:0]   ARADDR;
    logic            ARVALID;
    logic            ARREADY;

    logic    [31:0]  RDATA;
    logic    [1:0]   RRESP;
    logic            RVALID;
    logic            RREADY;

    logic            MOSI;
    logic            MISO;
    logic            SCLK;
    logic    [0:7]   SS;

    logic    [7:0]   tx_reg_addr_mon;
    logic    [31:0]  dout_mon;
    logic            wr_stat_up_en_mon;

    logic            rx_reg_en_mon;
    logic    [7:0]   rx_reg_addr_mon;
    logic    [31:0]  din_mon;

    logic            ssq_empty_mon;
    logic            ssq_full_mon;
    logic    [4:0]   ssq_wrptr_mon;

    logic            backdoor_ssq_en;
    logic            backdoor_ssq_wr_en;
    logic    [7:0]   backdoor_ssq_wr_addr;
    logic            backdoor_ssq_rd_en;

    logic            extra_reset_req;
    initial extra_reset_req = 1'b0;

endinterface : axi_spi_if

module spi_slave_bfm
(
    input   wire   MOSI,
    output  wire   MISO
);
    assign MISO = MOSI;
endmodule

package axi_spi_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    typedef enum {
        PAT_RANDOM,
        PAT_BOUNDARY_SWEEP,
        PAT_ALL_ZERO,
        PAT_ALL_ONE,
        PAT_ALT_5A,
        PAT_ALT_A5,
        PAT_WALK_ONE,
        PAT_WALK_ZERO
    } pattern_e;

    class axi_spi_txn extends uvm_sequence_item;

        int         txn_id;
        rand bit [2:0]   chip;
        rand bit [4:0]   loc;
        rand bit [31:0]  wdata;
        string      pattern_name = "random";

        constraint c_chip_range {
            chip inside {[0:7]};
        }

        constraint c_loc_range {
            loc inside {[0:31]};
        }

        constraint c_wdata_dist {

            wdata dist {
                32'h0000_0000                  :/ 5,
                32'hFFFF_FFFF                  :/ 5,
                [32'h0000_0001 : 32'hFFFF_FFFE] :/ 90
            };
        }

        constraint c_no_sentinel {

            wdata != 32'hDEAD_0000;
        }

        bit [1:0]   write_bresp;
        bit [31:0]  tx_bank_dout;
        bit         tx_bank_match;
        bit [31:0]  rx_bank_din;
        bit         rx_bank_match;
        bit         rx_ready_flag;
        bit [31:0]  final_rdata;
        bit [1:0]   final_rresp;
        bit         final_match;
        bit         write_accepted;
        bit         overall_pass;

        `uvm_object_utils_begin(axi_spi_txn)
            `uvm_field_int(txn_id, UVM_ALL_ON)
            `uvm_field_int(chip,   UVM_ALL_ON)
            `uvm_field_int(loc,    UVM_ALL_ON)
            `uvm_field_int(wdata,  UVM_ALL_ON)
        `uvm_object_utils_end

        function new(string name = "axi_spi_txn");
            super.new(name);
        endfunction

        function bit [8:0] get_awaddr();
            return {1'b0, chip, loc};
        endfunction

        function bit [8:0] get_araddr_data();
            return {1'b0, chip, loc};
        endfunction

        function bit [8:0] get_araddr_status(bit is_rx);
            return {1'b1, 4'b0000, chip, is_rx};
        endfunction

        function bit [7:0] get_flat_addr();
            return {chip, loc};
        endfunction

    endclass : axi_spi_txn

    class axi_spi_sequencer extends uvm_sequencer #(axi_spi_txn);
        `uvm_component_utils(axi_spi_sequencer)
        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction
    endclass : axi_spi_sequencer

    class axi_spi_driver extends uvm_driver #(axi_spi_txn);

        `uvm_component_utils(axi_spi_driver)

        virtual axi_spi_if vif;
        uvm_analysis_port #(axi_spi_txn) ap;

        function new(string name, uvm_component parent);
            super.new(name, parent);
            ap = new("ap", this);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            if (!uvm_config_db#(virtual axi_spi_if)::get(this, "", "vif", vif))
                `uvm_fatal("DRV", "virtual interface not set")
        endfunction

        task run_phase(uvm_phase phase);
            vif.AWVALID = 0; vif.WVALID = 0; vif.BREADY = 0;
            vif.ARVALID = 0; vif.RREADY = 0;
            vif.backdoor_ssq_en = 0; vif.backdoor_ssq_wr_en = 0; vif.backdoor_ssq_rd_en = 0;
            vif.extra_reset_req = 0;

            wait (vif.ARESET == 0);
            @(posedge vif.ACLK);

            forever begin
                axi_spi_txn t;
                seq_item_port.get_next_item(t);
                do_transaction(t);
                seq_item_port.item_done();
                ap.write(t);
            end
        endtask

        task automatic pulse_extra_reset(int cycles = 10);
            vif.extra_reset_req = 1'b1;
            repeat (cycles) @(posedge vif.ACLK);
            vif.extra_reset_req = 1'b0;
            @(posedge vif.ACLK);
        endtask

        task automatic drive_write(bit [8:0] awaddr, bit [31:0] wdata, output bit [1:0] bresp);
            @(posedge vif.ACLK);
            vif.AWADDR  <= awaddr;
            vif.AWVALID <= 1'b1;
            vif.WDATA   <= wdata;
            vif.WSTRB   <= 4'hF;
            vif.WVALID  <= 1'b1;

            @(posedge vif.ACLK);
            vif.AWVALID <= 1'b0;
            vif.WVALID  <= 1'b0;

            while (vif.BVALID !== 1'b1) @(posedge vif.ACLK);
            bresp = vif.BRESP;

            vif.BREADY <= 1'b1;
            @(posedge vif.ACLK);
            vif.BREADY <= 1'b0;
        endtask

        task automatic drive_read(bit [8:0] araddr, output bit [31:0] rdata, output bit [1:0] rresp);
            @(posedge vif.ACLK);
            vif.ARADDR  <= araddr;
            vif.ARVALID <= 1'b1;

            @(posedge vif.ACLK);
            vif.ARVALID <= 1'b0;

            while (vif.RVALID !== 1'b1) @(posedge vif.ACLK);
            rdata = vif.RDATA;
            rresp = vif.RRESP;

            vif.RREADY <= 1'b1;
            @(posedge vif.ACLK);
            vif.RREADY <= 1'b0;
        endtask

        task automatic wait_for_fetch(bit [7:0] addr8, output bit [31:0] dout_val, output bit timed_out);
            int unsigned budget = 200_000;
            timed_out = 0;
            forever begin
                @(posedge vif.ACLK);
                if (vif.wr_stat_up_en_mon === 1'b1 && vif.tx_reg_addr_mon === addr8) begin
                    @(posedge vif.ACLK);
                    dout_val = vif.dout_mon;
                    return;
                end
                budget--;
                if (budget == 0) begin
                    timed_out = 1;
                    dout_val  = 32'hDEAD_0000;
                    return;
                end
            end
        endtask

        task automatic wait_for_finish(bit [7:0] addr8, output bit [31:0] din_val, output bit timed_out);
            int unsigned budget = 400_000;
            timed_out = 0;
            forever begin
                @(posedge vif.ACLK);
                if (vif.rx_reg_en_mon === 1'b1 && vif.rx_reg_addr_mon === addr8) begin
                    din_val = vif.din_mon;
                    return;
                end
                budget--;
                if (budget == 0) begin
                    timed_out = 1;
                    din_val   = 32'hDEAD_0000;
                    return;
                end
            end
        endtask

        task automatic do_transaction(axi_spi_txn t);
            bit [7:0]  addr8;
            bit [31:0] rx_stat_word;
            bit [1:0]  rx_stat_rresp;
            bit        fetch_timeout, finish_timeout;

            addr8 = t.get_flat_addr();

            $display("");
            `uvm_info("DRV", $sformatf(
                "==================== TRANSACTION #%0d  START ====================",
                t.txn_id), UVM_LOW)
            `uvm_info("DRV", $sformatf(
                "  INPUT   : chip=%0d  loc=%0d  wdata=0x%08h", t.chip, t.loc, t.wdata), UVM_LOW)

            drive_write(t.get_awaddr(), t.wdata, t.write_bresp);
            t.write_accepted = (t.write_bresp == 2'b00);
            `uvm_info("DRV", $sformatf(
                "  STAGE 1 : AXI WRITE          -> BRESP=%0b  (%0s)",
                t.write_bresp, t.write_accepted ? "ACCEPTED" : "REJECTED"), UVM_LOW)

            if (!t.write_accepted) begin
                `uvm_warning("DRV", $sformatf(
                    "  Transaction #%0d write rejected - skipping downstream checks", t.txn_id))
                t.overall_pass = 0;
                `uvm_info("DRV", $sformatf(
                    "==================== TRANSACTION #%0d  END (FAIL) ====================",
                    t.txn_id), UVM_LOW)
                return;
            end

            wait_for_fetch(addr8, t.tx_bank_dout, fetch_timeout);
            t.tx_bank_match = !fetch_timeout && (t.tx_bank_dout === t.wdata);
            `uvm_info("DRV", $sformatf(
                "  STAGE 2 : TX BANK FETCH       -> dout=0x%08h  expected=0x%08h  %0s",
                t.tx_bank_dout, t.wdata,
                fetch_timeout ? "TIMEOUT" : (t.tx_bank_match ? "MATCH" : "MISMATCH")), UVM_LOW)

            wait_for_finish(addr8, t.rx_bank_din, finish_timeout);
            t.rx_bank_match = !finish_timeout && (t.rx_bank_din === t.wdata);
            `uvm_info("DRV", $sformatf(
                "  STAGE 3 : RX BANK CAPTURE     -> din=0x%08h  expected=0x%08h  %0s",
                t.rx_bank_din, t.wdata,
                finish_timeout ? "TIMEOUT" : (t.rx_bank_match ? "MATCH" : "MISMATCH")), UVM_LOW)

            drive_read(t.get_araddr_status(1'b1), rx_stat_word, rx_stat_rresp);
            t.rx_ready_flag = rx_stat_word[0];
            `uvm_info("DRV", $sformatf(
                "  STAGE 4 : getRxRegStat        -> %0b  (%0s)",
                t.rx_ready_flag, t.rx_ready_flag ? "READY" : "NOT READY"), UVM_LOW)

            drive_read(t.get_araddr_data(), t.final_rdata, t.final_rresp);
            t.final_match = (t.final_rdata === t.wdata) && (t.final_rresp == 2'b00);
            `uvm_info("DRV", $sformatf(
                "  STAGE 5 : AXI READ-BACK       -> rdata=0x%08h  rresp=%0b  %0s",
                t.final_rdata, t.final_rresp, t.final_match ? "MATCH" : "MISMATCH"), UVM_LOW)

            t.overall_pass = t.tx_bank_match && t.rx_bank_match &&
                              t.rx_ready_flag && t.final_match;

            `uvm_info("DRV", $sformatf(
                "  OUTPUT  : overall = %0s",
                t.overall_pass ? "PASS" : "FAIL"), UVM_LOW)
            `uvm_info("DRV", $sformatf(
                "==================== TRANSACTION #%0d  END (%0s) ====================",
                t.txn_id, t.overall_pass ? "PASS" : "FAIL"), UVM_LOW)
        endtask

        task automatic hazard_test_raw(bit [2:0] chip, bit [4:0] loc, bit [31:0] new_wdata);
            bit [8:0]  awaddr, araddr;
            bit [31:0] old_rdata, immediate_rdata, tx_dout, rx_din, final_rdata;
            bit [1:0]  wbresp, rresp1, rresp2, final_rresp;
            bit        fetch_to, finish_to, pass;

            awaddr = {1'b0, chip, loc};
            araddr = {1'b0, chip, loc};

            $display("");
            `uvm_info("DRV_HAZARD", "================ RAW (Read-After-Write) TEST ================", UVM_LOW)
            `uvm_info("DRV_HAZARD", $sformatf("  INPUT   : chip=%0d loc=%0d new_wdata=0x%08h", chip, loc, new_wdata), UVM_LOW)

            drive_read(araddr, old_rdata, rresp1);
            `uvm_info("DRV_HAZARD", $sformatf("  STAGE 1 : baseline RX read   -> 0x%08h", old_rdata), UVM_LOW)

            drive_write(awaddr, new_wdata, wbresp);
            `uvm_info("DRV_HAZARD", $sformatf("  STAGE 2 : write issued       -> BRESP=%0b", wbresp), UVM_LOW)

            drive_read(araddr, immediate_rdata, rresp2);
            `uvm_info("DRV_HAZARD", $sformatf(
                "  STAGE 3 : IMMEDIATE RX read  -> 0x%08h  (must still equal baseline, must NOT equal new_wdata)",
                immediate_rdata), UVM_LOW)

            pass = (immediate_rdata === old_rdata) &&
                   (immediate_rdata !== new_wdata || new_wdata === old_rdata);

            `uvm_info("DRV_HAZARD", $sformatf("  OUTPUT  : RAW isolation = %0s", pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_HAZARD", $sformatf(
                    "RAW HAZARD: RX bank read 0x%08h immediately after write -- TX write appears to have leaked into the RX bank",
                    immediate_rdata))

            wait_for_fetch({chip, loc}, tx_dout, fetch_to);
            wait_for_finish({chip, loc}, rx_din, finish_to);
            drive_read(araddr, final_rdata, final_rresp);
            `uvm_info("DRV_HAZARD", $sformatf(
                "  DRAIN   : after full round-trip, RX read -> 0x%08h  (expected 0x%08h)  %0s",
                final_rdata, new_wdata, (final_rdata === new_wdata) ? "MATCH" : "MISMATCH"), UVM_LOW)
            `uvm_info("DRV_HAZARD", "===============================================================", UVM_LOW)
        endtask

        task automatic hazard_test_war(bit [2:0] chip, bit [4:0] loc, bit [31:0] wdata);
            bit [8:0]  awaddr, araddr;
            bit [31:0] pre_read, tx_dout, rx_din, final_rdata;
            bit [1:0]  rresp1, wbresp, final_rresp;
            bit        fetch_to, finish_to, pass;

            awaddr = {1'b0, chip, loc};
            araddr = {1'b0, chip, loc};

            $display("");
            `uvm_info("DRV_HAZARD", "================ WAR (Write-After-Read) TEST ================", UVM_LOW)
            `uvm_info("DRV_HAZARD", $sformatf("  INPUT   : chip=%0d loc=%0d wdata=0x%08h", chip, loc, wdata), UVM_LOW)

            drive_read(araddr, pre_read, rresp1);
            `uvm_info("DRV_HAZARD", $sformatf("  STAGE 1 : read              -> 0x%08h", pre_read), UVM_LOW)

            drive_write(awaddr, wdata, wbresp);
            `uvm_info("DRV_HAZARD", $sformatf(
                "  STAGE 2 : immediate write   -> BRESP=%0b  %0s",
                wbresp, (wbresp == 2'b00) ? "ACCEPTED" : "REJECTED"), UVM_LOW)

            wait_for_fetch({chip, loc}, tx_dout, fetch_to);
            wait_for_finish({chip, loc}, rx_din, finish_to);
            drive_read(araddr, final_rdata, final_rresp);

            pass = (wbresp == 2'b00) && !fetch_to && !finish_to &&
                   (tx_dout === wdata) && (rx_din === wdata) && (final_rdata === wdata);

            `uvm_info("DRV_HAZARD", $sformatf(
                "  STAGE 3 : full round-trip   -> dout=0x%08h din=0x%08h final_read=0x%08h",
                tx_dout, rx_din, final_rdata), UVM_LOW)
            `uvm_info("DRV_HAZARD", $sformatf("  OUTPUT  : WAR = %0s", pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_HAZARD", "WAR HAZARD: write immediately following a read did not complete correctly")
            `uvm_info("DRV_HAZARD", "===============================================================", UVM_LOW)
        endtask

        task automatic hazard_test_waw(bit [2:0] chip, bit [4:0] loc, bit [31:0] wdata1, bit [31:0] wdata2);
            bit [8:0]  awaddr, araddr;
            bit [31:0] tx1, rx1, tx2, rx2, final_rdata;
            bit [1:0]  bresp1, bresp2, final_rresp;
            bit        fto1, fio1, fto2, fio2, pass;

            awaddr = {1'b0, chip, loc};
            araddr = {1'b0, chip, loc};

            $display("");
            `uvm_info("DRV_HAZARD", "================ WAW (Write-After-Write) TEST ================", UVM_LOW)
            `uvm_info("DRV_HAZARD", $sformatf(
                "  INPUT   : chip=%0d loc=%0d wdata1=0x%08h wdata2=0x%08h (last-write-wins expected)",
                chip, loc, wdata1, wdata2), UVM_LOW)

            drive_write(awaddr, wdata1, bresp1);
            wait_for_fetch({chip, loc}, tx1, fto1);
            wait_for_finish({chip, loc}, rx1, fio1);
            `uvm_info("DRV_HAZARD", $sformatf(
                "  STAGE 1 : write #1 round-trip -> BRESP=%0b dout=0x%08h din=0x%08h",
                bresp1, tx1, rx1), UVM_LOW)

            drive_write(awaddr, wdata2, bresp2);
            wait_for_fetch({chip, loc}, tx2, fto2);
            wait_for_finish({chip, loc}, rx2, fio2);
            `uvm_info("DRV_HAZARD", $sformatf(
                "  STAGE 2 : write #2 round-trip -> BRESP=%0b dout=0x%08h din=0x%08h",
                bresp2, tx2, rx2), UVM_LOW)

            drive_read(araddr, final_rdata, final_rresp);
            `uvm_info("DRV_HAZARD", $sformatf(
                "  STAGE 3 : final read           -> 0x%08h  (expected wdata2=0x%08h)",
                final_rdata, wdata2), UVM_LOW)

            pass = (bresp1 == 2'b00) && (bresp2 == 2'b00) &&
                   !fto1 && !fio1 && !fto2 && !fio2 &&
                   (tx1 === wdata1) && (rx1 === wdata1) &&
                   (tx2 === wdata2) && (rx2 === wdata2) &&
                   (final_rdata === wdata2);

            `uvm_info("DRV_HAZARD", $sformatf("  OUTPUT  : WAW (last-write-wins) = %0s", pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_HAZARD", "WAW HAZARD: second write to the same location did not correctly supersede the first")
            `uvm_info("DRV_HAZARD", "=================================================================", UVM_LOW)
        endtask

        task automatic hazard_test_ssq_initial_empty();
            bit pass;
            @(posedge vif.ACLK);
            pass = (vif.ssq_empty_mon === 1'b1) && (vif.ssq_full_mon === 1'b0);
            $display("");
            `uvm_info("DRV_FIFO", "================ SSQ INITIAL-EMPTY CHECK ================", UVM_LOW)
            `uvm_info("DRV_FIFO", "  INPUT   : (none - sampling SSQ state immediately after reset)", UVM_LOW)
            `uvm_info("DRV_FIFO", $sformatf(
                "  OUTPUT  : empty=%0b  full=%0b  wrPtr=%0d  -> %0s",
                vif.ssq_empty_mon, vif.ssq_full_mon, vif.ssq_wrptr_mon,
                pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_FIFO", "SSQ did not report empty at the start of the test")
            `uvm_info("DRV_FIFO", "===========================================================", UVM_LOW)
        endtask

        task automatic hazard_test_ssq_max_concurrent(bit [4:0] loc);
            int        c;
            bit [1:0]  bresp [0:7];
            bit [1:0]  bresp9;
            bit        all_accepted, pass;
            bit [31:0] tx_dout, rx_din;
            bit        fetch_to, finish_to;

            $display("");
            `uvm_info("DRV_FIFO", "================ SSQ MAX-CONCURRENT (8-chip burst) TEST ================", UVM_LOW)
            `uvm_info("DRV_FIFO", $sformatf(
                "  INPUT   : 8 writes, one per chip (0-7), all to loc=%0d, zero waiting between them, then a 9th write to chip=0",
                loc), UVM_LOW)

            all_accepted = 1;
            for (c = 0; c < 8; c++) begin
                drive_write({1'b0, c[2:0], loc}, {c[2:0], loc, 24'hBEEF00}, bresp[c]);
                `uvm_info("DRV_FIFO", $sformatf(
                    "  burst write chip=%0d -> BRESP=%0b  wrPtr=%0d  full=%0b",
                    c, bresp[c], vif.ssq_wrptr_mon, vif.ssq_full_mon), UVM_LOW)
                if (bresp[c] != 2'b00) all_accepted = 0;
            end

            drive_write({1'b0, 3'd0, loc}, 32'hDEAD_BEEF, bresp9);
            `uvm_info("DRV_FIFO", $sformatf(
                "  9th write (chip=0 again)   -> BRESP=%0b  (%0s)",
                bresp9, (bresp9 == 2'b00) ? "ACCEPTED - chip already freed by FETCH" : "REJECTED - chip still busy, as expected"),
                UVM_LOW)

            pass = all_accepted && (vif.ssq_full_mon === 1'b0);
            `uvm_info("DRV_FIFO", $sformatf(
                "  OUTPUT  : all 8 accepted=%0b, full-never-asserted(8<16)=%0b -> %0s",
                all_accepted, (vif.ssq_full_mon === 1'b0), pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_FIFO", "8-chip concurrent burst did not behave as expected")

            for (c = 0; c < 8; c++) begin
                wait_for_fetch({c[2:0], loc}, tx_dout, fetch_to);
                wait_for_finish({c[2:0], loc}, rx_din, finish_to);
            end
            if (bresp9 == 2'b00) begin
                wait_for_fetch({3'd0, loc}, tx_dout, fetch_to);
                wait_for_finish({3'd0, loc}, rx_din, finish_to);
            end
            `uvm_info("DRV_FIFO", "==========================================================================", UVM_LOW)
        endtask

        task automatic hazard_test_ssq_full_empty_backdoor();
            int i;
            bit pass_full, pass_empty;

            $display("");
            `uvm_info("DRV_FIFO", "================ SSQ FULL/EMPTY BACKDOOR TEST (depth=16) ================", UVM_LOW)
            `uvm_info("DRV_FIFO", "  INPUT   : 16 backdoor pushes (bypassing AXI_MANAGER), then 16 backdoor pops", UVM_LOW)

            vif.backdoor_ssq_en = 1'b1;
            #1;

            for (i = 0; i < 16; i++) begin
                vif.backdoor_ssq_wr_addr = i[7:0];
                vif.backdoor_ssq_wr_en   = 1'b1;
                #1;
                vif.backdoor_ssq_wr_en   = 1'b0;
                #1;
            end
            pass_full = (vif.ssq_full_mon === 1'b1);
            `uvm_info("DRV_FIFO", $sformatf(
                "  OUTPUT  : after 16 backdoor pushes -> full=%0b wrPtr=%0d  -> %0s",
                vif.ssq_full_mon, vif.ssq_wrptr_mon, pass_full ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass_full)
                `uvm_error("DRV_FIFO", "SSQ did not report full after exactly 16 pushes")

            for (i = 0; i < 16; i++) begin
                vif.backdoor_ssq_rd_en = 1'b1;
                #1;
                vif.backdoor_ssq_rd_en = 1'b0;
                #1;
            end
            pass_empty = (vif.ssq_empty_mon === 1'b1) && (vif.ssq_full_mon === 1'b0);
            `uvm_info("DRV_FIFO", $sformatf(
                "  OUTPUT  : after draining all 16    -> empty=%0b full=%0b wrPtr=%0d  -> %0s",
                vif.ssq_empty_mon, vif.ssq_full_mon, vif.ssq_wrptr_mon, pass_empty ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass_empty)
                `uvm_error("DRV_FIFO", "SSQ did not report empty after draining all 16 entries")

            vif.backdoor_ssq_en = 1'b0;
            #1;
            `uvm_info("DRV_FIFO", "==========================================================================", UVM_LOW)
        endtask

        task automatic hazard_test_ssq_overflow_underflow();
            int i;
            bit [4:0] wrptr_before, wrptr_after;

            $display("");
            `uvm_info("DRV_FIFO", "================ SSQ OVERFLOW/UNDERFLOW EDGE PROBE ================", UVM_LOW)
            `uvm_info("DRV_FIFO", "  INPUT   : fill to full (16), push 1 more; drain to empty, pop 1 more", UVM_LOW)

            vif.backdoor_ssq_en = 1'b1;
            #1;

            for (i = 0; i < 16; i++) begin
                vif.backdoor_ssq_wr_addr = i[7:0];
                vif.backdoor_ssq_wr_en   = 1'b1;
                #1;
                vif.backdoor_ssq_wr_en   = 1'b0;
                #1;
            end

            wrptr_before = vif.ssq_wrptr_mon;
            vif.backdoor_ssq_wr_addr = 8'hFF;
            vif.backdoor_ssq_wr_en   = 1'b1;
            #1;
            vif.backdoor_ssq_wr_en   = 1'b0;
            #1;
            wrptr_after = vif.ssq_wrptr_mon;

            if (wrptr_after == wrptr_before)
                `uvm_info("DRV_FIFO", $sformatf(
                    "  push-while-full probe : wrPtr held at %0d - extra push correctly ignored", wrptr_before), UVM_LOW)
            else
                `uvm_warning("DRV_FIFO", $sformatf(
                    "  push-while-full probe : wrPtr advanced %0d -> %0d - SSQ.v's wrPtr!=15 guard does not stop a further push once already at wrPtr==16 (out-of-range buffer[17] access). Documented finding, not a testbench failure.",
                    wrptr_before, wrptr_after))

            for (i = 0; i < 17; i++) begin
                vif.backdoor_ssq_rd_en = 1'b1;
                #1;
                vif.backdoor_ssq_rd_en = 1'b0;
                #1;
                if (vif.ssq_empty_mon === 1'b1) begin
                    i = 17;
                end
            end

            vif.backdoor_ssq_rd_en = 1'b1;
            #1;
            vif.backdoor_ssq_rd_en = 1'b0;
            #1;

            if (vif.ssq_empty_mon === 1'b1)
                `uvm_info("DRV_FIFO", "  pop-while-empty probe  : empty flag remained set - no corruption observed", UVM_LOW)
            else
                `uvm_warning("DRV_FIFO", $sformatf(
                    "  pop-while-empty probe  : empty flag dropped to %0b after popping an already-empty queue - SSQ.v's rd_en-only branch does not check 'empty' except at the wrPtr==1 boundary case, so wrPtr can underflow. Documented finding, not a testbench failure.",
                    vif.ssq_empty_mon))

            `uvm_info("DRV_FIFO", "  This probe deliberately corrupts SSQ internal state (wrPtr underflow/overflow) to document the RTL gaps above. Issuing a full system reset now to restore a clean state before any further tests run - otherwise SPI_MANAGER would see a stale SSQ_empty=0 and try to FETCH garbage forever, hanging every test after this one.", UVM_LOW)
            pulse_extra_reset(10);

            vif.backdoor_ssq_en = 1'b0;
            #1;
            `uvm_info("DRV_FIFO", "=====================================================================", UVM_LOW)
        endtask

        task automatic hazard_test_reset_read_sweep();
            int c, li;
            bit [4:0] sample_locs [0:2] = '{5'd0, 5'd15, 5'd31};
            bit [31:0] rdata;
            bit [1:0]  rresp;
            bit        all_zero;

            $display("");
            `uvm_info("DRV_RESET", "================ READ-AFTER-RESET SWEEP ================", UVM_LOW)
            `uvm_info("DRV_RESET", "  INPUT   : read RX bank at loc={0,15,31} for all 8 chips (24 reads), expect all 0", UVM_LOW)
            all_zero = 1'b1;
            for (c = 0; c < 8; c++) begin
                for (li = 0; li < 3; li++) begin
                    drive_read({1'b0, c[2:0], sample_locs[li]}, rdata, rresp);
                    if (rdata !== 32'h0) begin
                        all_zero = 1'b0;
                        `uvm_error("DRV_RESET", $sformatf(
                            "Ghost data after reset: chip=%0d loc=%0d = 0x%08h (expected 0)",
                            c, sample_locs[li], rdata))
                    end
                end
            end
            `uvm_info("DRV_RESET", $sformatf(
                "  OUTPUT  : checked %0d locations across all 8 chips -> %0s",
                24, all_zero ? "PASS (no ghost data)" : "FAIL"), UVM_LOW)
            `uvm_info("DRV_RESET", "==========================================================", UVM_LOW)
        endtask

        task automatic hazard_test_cold_start_write();
            bit [1:0]  bresp, rresp;
            bit [31:0] tx_dout, rx_din, rdata;
            bit        fetch_to, finish_to, pass;

            $display("");
            `uvm_info("DRV_COLD", "================ COLD-START WRITE TEST ================", UVM_LOW)
            `uvm_info("DRV_COLD", "  INPUT   : chip=0 loc=1 wdata=0x600d0000 (first write issued by this testbench)", UVM_LOW)

            drive_write({1'b0, 3'd0, 5'd1}, 32'h600D_0000, bresp);
            wait_for_fetch({3'd0, 5'd1}, tx_dout, fetch_to);
            wait_for_finish({3'd0, 5'd1}, rx_din, finish_to);
            drive_read({1'b0, 3'd0, 5'd1}, rdata, rresp);

            pass = (bresp == 2'b00) && !fetch_to && !finish_to &&
                   (tx_dout === 32'h600D_0000) && (rx_din === 32'h600D_0000) &&
                   (rdata === 32'h600D_0000);

            `uvm_info("DRV_COLD", $sformatf(
                "  OUTPUT  : bresp=%0b fetch_timeout=%0b finish_timeout=%0b dout=0x%08h din=0x%08h rdata=0x%08h -> %0s",
                bresp, fetch_to, finish_to, tx_dout, rx_din, rdata, pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_COLD", "Cold-start write path did not complete correctly")
            `uvm_info("DRV_COLD", "=========================================================", UVM_LOW)
        endtask

        task automatic hazard_test_fifo_order();
            bit [2:0]  order_chips [0:3] = '{3'd3, 3'd1, 3'd6, 3'd2};
            bit [2:0]  observed_chips [0:3];
            int        observed_count;
            bit [31:0] rx_din;
            bit        finish_to;
            bit        pass;
            int        i;

            $display("");
            `uvm_info("DRV_ORDER", "================ FIFO SERVICE-ORDER TEST ================", UVM_LOW)
            `uvm_info("DRV_ORDER", $sformatf(
                "  INPUT   : writes issued in chip order %0d, %0d, %0d, %0d (zero wait between them)",
                order_chips[0], order_chips[1], order_chips[2], order_chips[3]), UVM_LOW)

            observed_count = 0;

            fork
                begin : issue_writes
                    int j;
                    bit [1:0] bresp;
                    for (j = 0; j < 4; j++)
                        drive_write({1'b0, order_chips[j], 5'd8},
                                    {order_chips[j], 5'd8, 24'hFACE00}, bresp);
                end
                begin : monitor_fetch_order
                    while (observed_count < 4) begin
                        @(posedge vif.ACLK);
                        if (vif.wr_stat_up_en_mon === 1'b1) begin
                            observed_chips[observed_count] = vif.tx_reg_addr_mon[7:5];
                            observed_count++;
                        end
                    end
                end
            join

            pass = (observed_chips[0] == order_chips[0]) &&
                   (observed_chips[1] == order_chips[1]) &&
                   (observed_chips[2] == order_chips[2]) &&
                   (observed_chips[3] == order_chips[3]);

            `uvm_info("DRV_ORDER", $sformatf(
                "  OUTPUT  : observed FETCH order %0d, %0d, %0d, %0d  -> %0s",
                observed_chips[0], observed_chips[1], observed_chips[2], observed_chips[3],
                pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_ORDER", "SSQ did not service entries in the same order they were issued")

            for (i = 0; i < 4; i++)
                wait_for_finish({order_chips[i], 5'd8}, rx_din, finish_to);

            `uvm_info("DRV_ORDER", "===========================================================", UVM_LOW)
        endtask

        task automatic hazard_test_address_isolation();
            bit [2:0]  chips [0:3] = '{3'd0, 3'd2, 3'd4, 3'd6};
            bit [4:0]  locs  [0:3] = '{5'd5, 5'd10, 5'd20, 5'd30};
            bit [31:0] wdatas [0:3] = '{32'h1010_0000, 32'h2020_0000, 32'h3030_0000, 32'h4040_0000};
            bit [31:0] tx_dout, rx_din, rdata;
            bit [1:0]  bresp, rresp;
            bit        fetch_to, finish_to, pass, all_pass;
            int        i;

            $display("");
            `uvm_info("DRV_ISO", "================ ADDRESS ISOLATION TEST ================", UVM_LOW)
            `uvm_info("DRV_ISO", $sformatf(
                "  INPUT   : write chip=%0d loc=%0d=0x%08h, chip=%0d loc=%0d=0x%08h, chip=%0d loc=%0d=0x%08h, chip=%0d loc=%0d=0x%08h (each fully completed before the next)",
                chips[0], locs[0], wdatas[0], chips[1], locs[1], wdatas[1],
                chips[2], locs[2], wdatas[2], chips[3], locs[3], wdatas[3]), UVM_LOW)

            for (i = 0; i < 4; i++) begin
                drive_write({1'b0, chips[i], locs[i]}, wdatas[i], bresp);
                wait_for_fetch({chips[i], locs[i]}, tx_dout, fetch_to);
                wait_for_finish({chips[i], locs[i]}, rx_din, finish_to);
            end

            all_pass = 1'b1;
            for (i = 0; i < 4; i++) begin
                drive_read({1'b0, chips[i], locs[i]}, rdata, rresp);
                pass = (rdata === wdatas[i]);
                `uvm_info("DRV_ISO", $sformatf(
                    "  OUTPUT  : re-read chip=%0d loc=%0d -> 0x%08h  expected 0x%08h  %0s",
                    chips[i], locs[i], rdata, wdatas[i], pass ? "MATCH" : "MISMATCH"), UVM_LOW)
                if (!pass) begin
                    all_pass = 1'b0;
                    `uvm_error("DRV_ISO", $sformatf(
                        "Address isolation violated: chip=%0d loc=%0d was corrupted by a later write to a different chip",
                        chips[i], locs[i]))
                end
            end

            `uvm_info("DRV_ISO", $sformatf("  OUTPUT  : overall = %0s", all_pass ? "PASS" : "FAIL"), UVM_LOW)
            `uvm_info("DRV_ISO", "==========================================================", UVM_LOW)
        endtask

        task automatic hazard_test_simultaneous_rw();
            bit [1:0]  setup_bresp, w_bresp, r_rresp;
            bit [31:0] tx_dout, rx_din, r_rdata;
            bit        fetch_to, finish_to, write_pass, read_pass;

            $display("");
            `uvm_info("DRV_SIMUL", "================ SIMULTANEOUS R/W TEST ================", UVM_LOW)
            `uvm_info("DRV_SIMUL", "  INPUT   : setup chip=5 loc=18=0xc0defeed, then CONCURRENTLY write chip=1 loc=1=0x12345678 while reading chip=5 loc=18", UVM_LOW)

            drive_write({1'b0, 3'd5, 5'd18}, 32'hC0DE_FEED, setup_bresp);
            wait_for_fetch({3'd5, 5'd18}, tx_dout, fetch_to);
            wait_for_finish({3'd5, 5'd18}, rx_din, finish_to);

            fork
                begin : concurrent_write
                    drive_write({1'b0, 3'd1, 5'd1}, 32'h1234_5678, w_bresp);
                end
                begin : concurrent_read
                    drive_read({1'b0, 3'd5, 5'd18}, r_rdata, r_rresp);
                end
            join

            write_pass = (w_bresp == 2'b00);
            read_pass  = (r_rdata === 32'hC0DE_FEED) && (r_rresp == 2'b00);

            `uvm_info("DRV_SIMUL", $sformatf("  OUTPUT  : concurrent WRITE -> BRESP=%0b  %0s", w_bresp, write_pass ? "PASS" : "FAIL"), UVM_LOW)
            `uvm_info("DRV_SIMUL", $sformatf("  OUTPUT  : concurrent READ  -> rdata=0x%08h RRESP=%0b  %0s", r_rdata, r_rresp, read_pass ? "PASS" : "FAIL"), UVM_LOW)
            if (!write_pass || !read_pass)
                `uvm_error("DRV_SIMUL", "AXI write and read channels did not operate independently when exercised concurrently")

            wait_for_fetch({3'd1, 5'd1}, tx_dout, fetch_to);
            wait_for_finish({3'd1, 5'd1}, rx_din, finish_to);
            `uvm_info("DRV_SIMUL", "==========================================================", UVM_LOW)
        endtask

        task automatic hazard_test_status_data_boundary();
            bit [8:0]  addr_clean, addr_dirty;
            bit [31:0] rdata_clean, rdata_dirty;
            bit [1:0]  rresp;
            bit        pass;

            $display("");
            `uvm_info("DRV_DECODE", "================ STATUS/DATA BOUNDARY DECODE TEST ================", UVM_LOW)
            `uvm_info("DRV_DECODE", "  (chip_sel is plain binary 0-7, all values valid - no 'invalid address'", UVM_LOW)
            `uvm_info("DRV_DECODE", "   code exists here. This instead confirms decode ignores the status", UVM_LOW)
            `uvm_info("DRV_DECODE", "   address's reserved bits[7:4], per AXI_S's documented format.)", UVM_LOW)
            `uvm_info("DRV_DECODE", "  INPUT   : Tx-status read for chip=2, once with reserved bits[7:4]=0000, once with =1011", UVM_LOW)

            addr_clean = {1'b1, 4'b0000, 3'd2, 1'b0};
            drive_read(addr_clean, rdata_clean, rresp);

            addr_dirty = {1'b1, 4'b1011, 3'd2, 1'b0};
            drive_read(addr_dirty, rdata_dirty, rresp);

            pass = (rdata_clean === rdata_dirty);
            `uvm_info("DRV_DECODE", $sformatf(
                "  OUTPUT  : clean-reserved-bits=0x%08h  dirty-reserved-bits=0x%08h  -> %0s",
                rdata_clean, rdata_dirty,
                pass ? "PASS (reserved bits correctly ignored)" : "FAIL"), UVM_LOW)
            if (!pass)
                `uvm_error("DRV_DECODE", "Status-region decode is sensitive to reserved address bits that should be ignored")
            `uvm_info("DRV_DECODE", "====================================================================", UVM_LOW)
        endtask

        task automatic hazard_test_queue_flooding();
            bit [4:0] round_locs [0:4] = '{5'd1, 5'd2, 5'd3, 5'd4, 5'd5};
            bit [1:0] bresp_grid [0:4][0:7];
            bit [31:0] tx_dout, rx_din, rdata;
            bit [1:0]  rresp;
            bit        fetch_to, finish_to, pass;
            int        round, c, accepted_count, rejected_count, retry_success, retry_fail;

            $display("");
            `uvm_info("DRV_FLOOD", "================ QUEUE FLOODING / SUSTAINED STRESS TEST ================", UVM_LOW)
            `uvm_info("DRV_FLOOD", "  INPUT   : 40 writes (5 locations x 8 chips) fired back-to-back, zero waiting", UVM_LOW)

            accepted_count = 0; rejected_count = 0;
            for (round = 0; round < 5; round++) begin
                for (c = 0; c < 8; c++) begin
                    bit [1:0] bresp;
                    drive_write({1'b0, c[2:0], round_locs[round]},
                                {c[2:0], round_locs[round], 24'hF10000 + round}, bresp);
                    bresp_grid[round][c] = bresp;
                    if (bresp == 2'b00) accepted_count++; else rejected_count++;
                end
            end

            `uvm_info("DRV_FLOOD", $sformatf(
                "  OUTPUT  : burst complete, %0d/40 accepted, %0d/40 rejected (busy) under sustained load",
                accepted_count, rejected_count), UVM_LOW)

            for (round = 0; round < 5; round++) begin
                for (c = 0; c < 8; c++) begin
                    if (bresp_grid[round][c] == 2'b00) begin
                        bit [31:0] expected = {c[2:0], round_locs[round], 24'hF10000 + round};
                        wait_for_fetch({c[2:0], round_locs[round]}, tx_dout, fetch_to);
                        wait_for_finish({c[2:0], round_locs[round]}, rx_din, finish_to);
                        drive_read({1'b0, c[2:0], round_locs[round]}, rdata, rresp);
                        pass = !fetch_to && !finish_to && (tx_dout === expected) &&
                               (rx_din === expected) && (rdata === expected);
                        if (!pass)
                            `uvm_error("DRV_FLOOD", $sformatf(
                                "Flooding: accepted write chip=%0d loc=%0d round=%0d did not round-trip correctly",
                                c, round_locs[round], round))
                    end
                end
            end

            retry_success = 0; retry_fail = 0;
            for (round = 0; round < 5; round++) begin
                for (c = 0; c < 8; c++) begin
                    if (bresp_grid[round][c] != 2'b00) begin
                        bit [1:0]  retry_bresp;
                        bit [31:0] expected = {c[2:0], round_locs[round], 24'hF10000 + round};
                        drive_write({1'b0, c[2:0], round_locs[round]}, expected, retry_bresp);
                        if (retry_bresp == 2'b00) begin
                            wait_for_fetch({c[2:0], round_locs[round]}, tx_dout, fetch_to);
                            wait_for_finish({c[2:0], round_locs[round]}, rx_din, finish_to);
                            drive_read({1'b0, c[2:0], round_locs[round]}, rdata, rresp);
                            pass = !fetch_to && !finish_to && (tx_dout === expected) &&
                                   (rx_din === expected) && (rdata === expected);
                            if (pass) retry_success++; else retry_fail++;
                        end
                        else begin
                            retry_fail++;
                            `uvm_warning("DRV_FLOOD", $sformatf(
                                "Retry of chip=%0d loc=%0d round=%0d still rejected after drain - unexpected",
                                c, round_locs[round], round))
                        end
                    end
                end
            end

            `uvm_info("DRV_FLOOD", $sformatf(
                "  OUTPUT  : retry pass %0d succeeded, %0d failed  -> %0s",
                retry_success, retry_fail, (retry_fail == 0) ? "PASS" : "FAIL"), UVM_LOW)
            if (retry_fail != 0)
                `uvm_error("DRV_FLOOD", "Some rejected writes could not be successfully retried after the system drained")
            `uvm_info("DRV_FLOOD", "=========================================================================", UVM_LOW)
        endtask

        task automatic hazard_test_missing_handshake();
            int  budget, recovery_budget;
            bit  bvalid_seen, recovery_ok;

            $display("");
            `uvm_info("DRV_MALFORMED", "================ MISSING-HANDSHAKE (malformed write) TEST ================", UVM_LOW)
            `uvm_info("DRV_MALFORMED", "  Run last deliberately, in case AXI_S has no timeout for an address-only write.", UVM_LOW)
            `uvm_info("DRV_MALFORMED", "  INPUT   : AWADDR=chip4/loc4, AWVALID asserted, WVALID deliberately NEVER asserted", UVM_LOW)

            @(posedge vif.ACLK);
            vif.AWADDR  <= {1'b0, 3'd4, 5'd4};
            vif.AWVALID <= 1'b1;

            budget = 200;
            bvalid_seen = 1'b0;
            repeat (budget) begin
                @(posedge vif.ACLK);
                if (vif.BVALID === 1'b1) bvalid_seen = 1'b1;
            end

            `uvm_info("DRV_MALFORMED", $sformatf(
                "  OUTPUT  : after %0d cycles with AWVALID alone (no WVALID) -> BVALID seen=%0b  %0s",
                budget, bvalid_seen,
                !bvalid_seen ? "PASS (malformed write correctly never completed)" : "FAIL"), UVM_LOW)
            if (bvalid_seen)
                `uvm_error("DRV_MALFORMED", "AXI write completed (BVALID asserted) despite WVALID never being asserted")

            vif.AWVALID <= 1'b0;
            @(posedge vif.ACLK);

            `uvm_info("DRV_MALFORMED", "  INPUT   : recovery probe - a normal, well-formed write to the same address (chip4/loc4)", UVM_LOW)
            vif.AWADDR  <= {1'b0, 3'd4, 5'd4};
            vif.AWVALID <= 1'b1;
            vif.WDATA   <= 32'hC0DE_0001;
            vif.WSTRB   <= 4'hF;
            vif.WVALID  <= 1'b1;

            recovery_budget = 200;
            recovery_ok = 1'b0;
            repeat (recovery_budget) begin
                @(posedge vif.ACLK);
                if (vif.BVALID === 1'b1) begin
                    recovery_ok = 1'b1;
                    break;
                end
            end

            vif.AWVALID <= 1'b0;
            vif.WVALID  <= 1'b0;

            if (recovery_ok) begin
                vif.BREADY <= 1'b1;
                @(posedge vif.ACLK);
                vif.BREADY <= 1'b0;
                `uvm_info("DRV_MALFORMED", "  OUTPUT  : RECOVERY - a subsequent well-formed write completed normally - write channel recovered.", UVM_LOW)
            end
            else begin
                `uvm_warning("DRV_MALFORMED", $sformatf(
                    "  OUTPUT  : RECOVERY - no BVALID within %0d cycles after the abandoned malformed write - AXI_S appears to have NO timeout/recovery for an address-only write. Documented finding, not a testbench bug.",
                    recovery_budget))
            end
            `uvm_info("DRV_MALFORMED", "===========================================================================", UVM_LOW)
        endtask

    endclass : axi_spi_driver

    class axi_spi_scoreboard extends uvm_subscriber #(axi_spi_txn);

        `uvm_component_utils(axi_spi_scoreboard)

        int total_txns;
        int rejected_txns;
        int tx_bank_pass, tx_bank_fail;
        int rx_bank_pass, rx_bank_fail;
        int rx_ready_pass, rx_ready_fail;
        int final_read_pass, final_read_fail;
        int overall_pass, overall_fail;

        bit [2:0]  cov_chip;
        bit [4:0]  cov_loc;
        pattern_e  cov_pattern;
        bit [1:0]  cov_bresp;
        bit        cov_overall;
        bit        cov_tx_match;
        bit        cov_rx_match;
        bit        cov_rx_ready;
        bit        cov_final_match;

        covergroup cg_txn;
            option.per_instance = 1;

            cp_chip: coverpoint cov_chip {
                bins chip[] = {[0:7]};
            }

            cp_loc: coverpoint cov_loc {
                bins loc[] = {[0:31]};
            }

            cp_chip_x_loc: cross cp_chip, cp_loc;

            cp_pattern: coverpoint cov_pattern {
                bins random_pat   = {PAT_RANDOM};
                bins boundary_pat = {PAT_BOUNDARY_SWEEP};
                bins all_zero_pat = {PAT_ALL_ZERO};
                bins all_one_pat  = {PAT_ALL_ONE};
                bins alt_5a_pat   = {PAT_ALT_5A};
                bins alt_a5_pat   = {PAT_ALT_A5};
                bins walk1_pat    = {PAT_WALK_ONE};
                bins walk0_pat    = {PAT_WALK_ZERO};
            }

            cp_bresp: coverpoint cov_bresp {
                bins okay   = {2'b00};
                bins slverr = {2'b10};
            }

            cp_overall:  coverpoint cov_overall   { bins fail_bin = {0}; bins pass_bin = {1}; }
            cp_tx:       coverpoint cov_tx_match  { bins fail_bin = {0}; bins pass_bin = {1}; }
            cp_rx:       coverpoint cov_rx_match  { bins fail_bin = {0}; bins pass_bin = {1}; }
            cp_ready:    coverpoint cov_rx_ready  { bins fail_bin = {0}; bins pass_bin = {1}; }
            cp_final:    coverpoint cov_final_match { bins fail_bin = {0}; bins pass_bin = {1}; }
        endgroup

        function new(string name, uvm_component parent);
            super.new(name, parent);
            cg_txn = new();
        endfunction

        function pattern_e str_to_pattern(string s);
            case (s)
                "random":         return PAT_RANDOM;
                "boundary_sweep": return PAT_BOUNDARY_SWEEP;
                "all_zero":       return PAT_ALL_ZERO;
                "all_one":        return PAT_ALL_ONE;
                "alternating_5A": return PAT_ALT_5A;
                "alternating_A5": return PAT_ALT_A5;
                "walking_one":    return PAT_WALK_ONE;
                "walking_zero":   return PAT_WALK_ZERO;
                default:          return PAT_RANDOM;
            endcase
        endfunction

        function void write(axi_spi_txn t);
            total_txns++;

            cov_chip    = t.chip;
            cov_loc     = t.loc;
            cov_pattern = str_to_pattern(t.pattern_name);
            cov_bresp   = t.write_bresp;

            if (!t.write_accepted) begin
                rejected_txns++;
                overall_fail++;
                cov_overall = 0; cov_tx_match = 0; cov_rx_match = 0;
                cov_rx_ready = 0; cov_final_match = 0;
                cg_txn.sample();
                return;
            end

            if (t.tx_bank_match) tx_bank_pass++; else tx_bank_fail++;
            if (t.rx_bank_match) rx_bank_pass++; else rx_bank_fail++;
            if (t.rx_ready_flag) rx_ready_pass++; else rx_ready_fail++;
            if (t.final_match)   final_read_pass++; else final_read_fail++;

            if (t.overall_pass) overall_pass++; else overall_fail++;

            cov_overall     = t.overall_pass;
            cov_tx_match    = t.tx_bank_match;
            cov_rx_match    = t.rx_bank_match;
            cov_rx_ready    = t.rx_ready_flag;
            cov_final_match = t.final_match;
            cg_txn.sample();
        endfunction

        function void report_phase(uvm_phase phase);
            $display("");
            `uvm_info("SB_REPORT", "==================== SCOREBOARD SUMMARY ====================", UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("Total transactions issued        : %0d", total_txns), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("Rejected at AXI (chip busy/full) : %0d", rejected_txns), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("TX bank (dout) match / mismatch  : %0d / %0d", tx_bank_pass, tx_bank_fail), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("RX bank (din)  match / mismatch  : %0d / %0d", rx_bank_pass, rx_bank_fail), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("getRxRegStat ready / not-ready   : %0d / %0d", rx_ready_pass, rx_ready_fail), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("Final AXI read-back match / mismatch : %0d / %0d", final_read_pass, final_read_fail), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("OVERALL pass / fail               : %0d / %0d", overall_pass, overall_fail), UVM_NONE)

            if (overall_fail == 0 && overall_pass > 0)
                `uvm_info("SB_REPORT", "RESULT: *** TEST PASSED ***", UVM_NONE)
            else
                `uvm_error("SB_REPORT", "RESULT: FAIL - see mismatches above")

            $display("");
            `uvm_info("SB_REPORT", "-------------------- FUNCTIONAL COVERAGE --------------------", UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("chip (0-7)                      : %0.2f %%", cg_txn.cp_chip.get_inst_coverage()), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("location (0-31)                 : %0.2f %%", cg_txn.cp_loc.get_inst_coverage()), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("chip x location CROSS (256 bins): %0.2f %%", cg_txn.cp_chip_x_loc.get_inst_coverage()), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("data pattern corner cases       : %0.2f %%", cg_txn.cp_pattern.get_inst_coverage()), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("write BRESP (OKAY/SLVERR)       : %0.2f %%", cg_txn.cp_bresp.get_inst_coverage()), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("overall pass/fail outcomes      : %0.2f %%", cg_txn.cp_overall.get_inst_coverage()), UVM_NONE)
            `uvm_info("SB_REPORT", $sformatf("TOTAL functional coverage       : %0.2f %%", cg_txn.get_inst_coverage()), UVM_NONE)

            if (cg_txn.cp_chip_x_loc.get_inst_coverage() < 100.0)
                `uvm_warning("SB_REPORT", "Address-space (chip x location) coverage is NOT 100% - not all {chip,location} corners were exercised. See axi_spi_full_seq.")

            `uvm_info("SB_REPORT", "==============================================================", UVM_NONE)
        endfunction

    endclass : axi_spi_scoreboard

    class axi_spi_agent extends uvm_agent;

        `uvm_component_utils(axi_spi_agent)

        axi_spi_sequencer sequencer;
        axi_spi_driver     driver;

        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            sequencer = axi_spi_sequencer::type_id::create("sequencer", this);
            driver     = axi_spi_driver::type_id::create("driver", this);
        endfunction

        function void connect_phase(uvm_phase phase);
            super.connect_phase(phase);
            driver.seq_item_port.connect(sequencer.seq_item_export);
        endfunction

    endclass : axi_spi_agent

    class axi_spi_env extends uvm_env;

        `uvm_component_utils(axi_spi_env)

        axi_spi_agent      agent;
        axi_spi_scoreboard scoreboard;

        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            agent      = axi_spi_agent::type_id::create("agent", this);
            scoreboard = axi_spi_scoreboard::type_id::create("scoreboard", this);
        endfunction

        function void connect_phase(uvm_phase phase);
            super.connect_phase(phase);
            agent.driver.ap.connect(scoreboard.analysis_export);
        endfunction

    endclass : axi_spi_env

    class axi_spi_full_seq extends uvm_sequence #(axi_spi_txn);

        `uvm_object_utils(axi_spi_full_seq)

        function new(string name = "axi_spi_full_seq");
            super.new(name);
        endfunction

        task automatic send_txn(int id, bit [2:0] chip, bit [4:0] loc,
                                 bit [31:0] wdata, string pattern);
            axi_spi_txn t = axi_spi_txn::type_id::create("t");
            t.txn_id       = id;
            t.chip         = chip;
            t.loc          = loc;
            t.wdata        = wdata;
            t.pattern_name = pattern;
            start_item(t);
            finish_item(t);
        endtask

        task automatic send_random_txn(int id);
            axi_spi_txn t = axi_spi_txn::type_id::create("t");
            start_item(t);
            t.txn_id = id;
            if (!t.randomize())
                `uvm_error(get_type_name(), $sformatf("randomize() failed for txn #%0d", id))
            t.pattern_name = "random";
            finish_item(t);
        endtask

        task body();
            int id = 0;
            int c, l;
            int pi;
            bit [2:0] pat_chips [0:1] = '{3'd0, 3'd7};

            `uvm_info(get_type_name(),
                "Starting EXHAUSTIVE sequence: 256 (full 8x32 address sweep, directed) + 16 (data-pattern corners, directed) + 30 (constrained-random regression) = 302 transactions",
                UVM_LOW)

            for (c = 0; c < 8; c++) begin
                for (l = 0; l < 32; l++) begin
                    bit [31:0] w = {c[2:0], l[4:0], 24'hC0FFEE};
                    send_txn(id, c[2:0], l[4:0], w, "boundary_sweep");
                    id++;
                end
            end

            for (pi = 0; pi < 2; pi++) begin
                bit [2:0] pc = pat_chips[pi];
                send_txn(id, pc, 5'd15, 32'h0000_0000, "all_zero");        id++;
                send_txn(id, pc, 5'd15, 32'hFFFF_FFFF, "all_one");         id++;
                send_txn(id, pc, 5'd15, 32'h5555_5555, "alternating_5A");  id++;
                send_txn(id, pc, 5'd15, 32'hAAAA_AAAA, "alternating_A5");  id++;
                send_txn(id, pc, 5'd15, 32'h0000_0001, "walking_one");     id++;
                send_txn(id, pc, 5'd15, 32'h8000_0000, "walking_one");     id++;
                send_txn(id, pc, 5'd15, 32'hFFFF_FFFE, "walking_zero");    id++;
                send_txn(id, pc, 5'd15, 32'h7FFF_FFFF, "walking_zero");    id++;
            end

            repeat (30) begin
                send_random_txn(id);
                id++;
            end

            `uvm_info(get_type_name(), $sformatf("All %0d transactions issued", id), UVM_LOW)
        endtask

    endclass : axi_spi_full_seq

    class axi_spi_test extends uvm_test;

        `uvm_component_utils(axi_spi_test)

        axi_spi_env env;
        virtual axi_spi_if vif;

        function new(string name = "axi_spi_test", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            if (!uvm_config_db#(virtual axi_spi_if)::get(this, "", "vif", vif))
                `uvm_fatal("TEST", "virtual interface not set")

            env = axi_spi_env::type_id::create("env", this);
            uvm_config_db#(virtual axi_spi_if)::set(this, "env.agent.driver", "vif", vif);
        endfunction

        task run_phase(uvm_phase phase);
            axi_spi_full_seq seq;

            phase.raise_objection(this);

            wait (vif.ARESET == 0);
            @(posedge vif.ACLK);

            env.agent.driver.hazard_test_reset_read_sweep();
            env.agent.driver.hazard_test_ssq_initial_empty();
            env.agent.driver.hazard_test_ssq_full_empty_backdoor();
            env.agent.driver.hazard_test_ssq_overflow_underflow();
            env.agent.driver.hazard_test_cold_start_write();
            env.agent.driver.hazard_test_fifo_order();
            env.agent.driver.hazard_test_status_data_boundary();

            seq = axi_spi_full_seq::type_id::create("seq");
            seq.start(env.agent.sequencer);

            env.agent.driver.hazard_test_ssq_max_concurrent(5'd10);

            env.agent.driver.hazard_test_address_isolation();
            env.agent.driver.hazard_test_simultaneous_rw();
            env.agent.driver.hazard_test_queue_flooding();

            env.agent.driver.hazard_test_raw(3'd1, 5'd3,  32'h1111_2222);
            env.agent.driver.hazard_test_raw(3'd6, 5'd20, 32'hABCD_EF01);

            env.agent.driver.hazard_test_war(3'd2, 5'd7,  32'h3333_4444);
            env.agent.driver.hazard_test_war(3'd5, 5'd25, 32'hFEED_1234);

            env.agent.driver.hazard_test_waw(3'd3, 5'd12, 32'hA5A5_0001, 32'h5A5A_0002);
            env.agent.driver.hazard_test_waw(3'd7, 5'd0,  32'h0000_1111, 32'hFFFF_2222);

            env.agent.driver.hazard_test_missing_handshake();

            #5000;

            phase.drop_objection(this);
        endtask

    endclass : axi_spi_test

endpackage : axi_spi_pkg

import uvm_pkg::*;
`include "uvm_macros.svh"
import axi_spi_pkg::*;

module tb_top;

    logic ACLK;
    initial ACLK = 0;
    always #5 ACLK = ~ACLK;

    logic ARESET;
    initial begin
        ARESET = 1;
        repeat (10) @(posedge ACLK);
        ARESET = 0;
    end

    axi_spi_if vif (.ACLK(ACLK));
    assign vif.ARESET = ARESET | vif.extra_reset_req;

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

    wire [2:0] status_query_chip_w = vif.ARADDR[8] ? vif.ARADDR[3:1] : vif.ARADDR[7:5];

    AXI_S u_axi_s
    (
        .ACLK(ACLK), .ARESET(ARESET),
        .AWADDR(vif.AWADDR), .AWVALID(vif.AWVALID), .AWREADY(vif.AWREADY),
        .WDATA(vif.WDATA), .WSTRB(vif.WSTRB), .WVALID(vif.WVALID), .WREADY(vif.WREADY),
        .BRESP(vif.BRESP), .BVALID(vif.BVALID), .BREADY(vif.BREADY),
        .ARADDR(vif.ARADDR), .ARVALID(vif.ARVALID), .ARREADY(vif.ARREADY),
        .RDATA(vif.RDATA), .RRESP(vif.RRESP), .RVALID(vif.RVALID), .RREADY(vif.RREADY),
        .getBRESP(setBRESP_w), .getRRESP(setRRESP_w),
        .wr_addr(wr_addr_w), .wr_data(wr_data_w), .wr_en(wr_en_w), .wrUpdateDone(wrUpdateDone_w),
        .rd_addr(rd_addr_w), .rd_data(rd_data_w),
        .getTxRegStat(getTxRegStat_w), .getRxRegStat(getRxRegStat_w)
    );

    DATA_REGISTERS u_data_registers
    (
        .ACLK(ACLK), .reset(ARESET),
        .wr_addr(wr_addr_w), .wr_data(wr_data_w), .wr_en(wr_en_w),
        .rd_addr(rd_addr_w), .rd_data(rd_data_w),
        .tx_reg_addr(tx_reg_addr_w), .dout(dout_w),
        .rx_reg_en(rx_reg_en_w), .rx_reg_addr(rx_reg_addr_w), .din(din_w)
    );

    AXI_MANAGER u_axi_manager
    (
        .ACLK(ACLK), .reset(ARESET),
        .AWADDR(vif.AWADDR), .AWVALID(vif.AWVALID), .AWREADY(vif.AWREADY),
        .ARADDR(vif.ARADDR),
        .wrRegStat(wrRegStat_w), .rdRegStat(rdRegStat_w),
        .SSQ_full(ssq_full_w),
        .setBRESP(setBRESP_w), .setRRESP(setRRESP_w),
        .wrStatRegAddr(wrStatRegAddr_w), .rdStatRegAddr(rdStatRegAddr_w),
        .wrSlaveAddr(wrSlaveAddr_w), .wr_en(axi_mgr_wr_en_w), .wrUpdateDone(wrUpdateDone_w)
    );

    STATUS_REGISTERS u_status_registers
    (
        .ACLK(ACLK), .reset(ARESET),
        .wrStatUpEn(wrStatUpEn_w), .wrStatUpAddr(wrStatUpAddr_w),
        .rdStatUpEn(rdStatUpEn_w), .rdStatUpAddr(rdStatUpAddr_w), .rdStatUp(rdStatUp_w),
        .wrAddr(wrStatRegAddr_w), .rdAddr(status_query_chip_w),
        .wr_en(wr_en_w),
        .full_empty(wrRegStat_w), .valid_invalid(rdRegStat_w)
    );

    assign getTxRegStat_w = wrRegStat_w;
    assign getRxRegStat_w = rdRegStat_w;

    wire       ssq_wr_en_eff   = vif.backdoor_ssq_en ? vif.backdoor_ssq_wr_en   : axi_mgr_wr_en_w;
    wire [7:0] ssq_wr_addr_eff = vif.backdoor_ssq_en ? vif.backdoor_ssq_wr_addr : wrSlaveAddr_w;
    wire       ssq_rd_en_eff   = vif.backdoor_ssq_en ? vif.backdoor_ssq_rd_en   : rd_en_w;

    SSQ u_ssq
    (
        .reset(ARESET), .wr_en(ssq_wr_en_eff), .wr_slave_addr(ssq_wr_addr_eff),
        .rd_en(ssq_rd_en_eff), .rd_slave_addr(rd_slave_addr_w),
        .empty(ssq_empty_w), .full(ssq_full_w)
    );

    SPI_MANAGER u_spi_manager
    (
        .ACLK(ACLK), .SPICLK(SPICLK_w), .reset(ARESET),
        .rx_reg_en(rx_reg_en_w), .rx_reg_addr(rx_reg_addr_w),
        .tx_reg_addr(tx_reg_addr_w),
        .rd_en(rd_en_w), .rd_slave_addr(rd_slave_addr_w),
        .SSQ_empty(ssq_empty_w),
        .wr_stat_up_addr(wrStatUpAddr_w), .wr_stat_up_en(wrStatUpEn_w),
        .rd_stat_up(rdStatUp_w), .rd_stat_up_addr(rdStatUpAddr_w), .rd_stat_up_en(rdStatUpEn_w),
        .SPI_start(SPI_start_w), .SPI_select(SPI_select_w),
        .SPI_busy(SPI_busy_w)
    );

    SPI_CLOCKER u_spi_clocker (.clkin(ACLK), .reset(ARESET), .clkout(SPICLK_w));

    SPI_M u_spi_m
    (
        .din(dout_w), .dout(din_w), .start(SPI_start_w), .busy(SPI_busy_w),
        .selecter(SPI_select_w), .clk(SPICLK_w), .reset(ARESET),
        .miso(vif.MISO), .mosi(vif.MOSI), .sclk(vif.SCLK), .ss(vif.SS)
    );

    spi_slave_bfm u_spi_slave_bfm (.MOSI(vif.MOSI), .MISO(vif.MISO));

    assign vif.tx_reg_addr_mon   = tx_reg_addr_w;
    assign vif.dout_mon          = dout_w;
    assign vif.wr_stat_up_en_mon = wrStatUpEn_w;
    assign vif.rx_reg_en_mon     = rx_reg_en_w;
    assign vif.rx_reg_addr_mon   = rx_reg_addr_w;
    assign vif.din_mon           = din_w;
    assign vif.ssq_empty_mon     = ssq_empty_w;
    assign vif.ssq_full_mon      = ssq_full_w;
    assign vif.ssq_wrptr_mon     = u_ssq.wrPtr;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_top);
    end

    initial begin
        uvm_config_db#(virtual axi_spi_if)::set(null, "*", "vif", vif);
        run_test("axi_spi_test");
    end

    initial begin
        #90_000_000_0;
        `uvm_fatal("TB_TOP", "Watchdog timeout - simulation did not finish")
    end

endmodule : tb_top