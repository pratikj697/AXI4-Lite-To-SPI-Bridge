module ssq (
    input wire reset,

    input wire rd_en,
    input wire wr_en,

    input wire [7:0] wr_slave_addr,
    output reg [7:0] rd_slave_addr,

    output reg empty,
    output reg full
);

reg [7:0] buffer [0:15];
reg [3:0] rptr, wptr;
reg [3:0] next_rptr, next_wptr;
reg next_empty, next_full;

always @(*) begin
    next_rptr = rptr;
    next_wptr = wptr;

    if (wr_en && !full) begin
        next_wptr = wptr + 1'b1;
    end

    if (rd_en && !empty) begin
        next_rptr = rptr + 1'b1;
    end

    next_empty = (next_rptr == next_wptr);
    next_full = ((next_wptr + 1'b1) == next_rptr);
end

always @(posedge wr_en or posedge rd_en or posedge reset) begin
    if(reset) begin
        rptr <= 0;
        wptr <= 0;
        rd_slave_addr <= 0;
        empty <= 1;
        full <= 0;
    end else begin
        if(wr_en && !full) begin
            buffer[wptr] <= wr_slave_addr;
        end

        if(rd_en && !empty) begin
            rd_slave_addr <= buffer[rptr];
        end

        rptr <= next_rptr;
        wptr <= next_wptr;
        empty <= next_empty;
        full <= next_full;
    end
end


endmodule