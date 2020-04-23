module sseg4_TDM(
    input [15:0] data,
    input hex_dec, sign,
    input reset,
    input clock,
    output [6:0] seg, 
    output dp,
    output[3:0] an
    );
    
    wire [15:0] ebout, mux2out;
    wire [3:0] mux4out;
    wire [6:0] decout;
    wire andecout;
    wire m2sel;
    wire [1:0] digit_sel;
    wire tickout;
    
    counter #(.N(18)) c1(.clk(clock), .rst(reset), .en(1), .tick(tickout));
    counter #(.N(18)) c2(.clk(clock), .on(tickout), .count(digit_sel), .rst(reset));
    BCD11_2 e0(.in(data[10:0]), .out(ebout));
    mux2 #(.N(16)) mux2A(.in0(data), .in1(ebout), .sel(hex_dec), .out(mux2out));
    mux4 #(.N(4)) mux4A(.in0(mux2out[3:0]), .in1(mux2out[7:4]), .in2(mux2out[11:8]), .in3(mux2out[15:12]), .sel(digit_sel), .out(mux4out));
    sseg_decoder s1(.num(mux4out), .sseg(decout));
    an_decoder an1(.in(digit_sel), .out(an));
    assign m2sel = ~an[3];
    and agate1(andecout, sign, m2sel);
    mux2 #(.N(7)) mux2B(.in0(decout), .in1(7'b01111111), .sel(andecout), .out(seg));
    assign dp = 1;
endmodule
