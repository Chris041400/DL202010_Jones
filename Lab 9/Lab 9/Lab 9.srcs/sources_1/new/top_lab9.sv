module top_lab9(
    input clk, btnC, btnD, btnU,
    input [11:0] sw,
    output reg[15:0] led
    );
    wire [7:0] A1;
    wire [7:0] R1;
    
    
    register #(. N (8) ) r1 (. D(sw[7:0]),. clk(clk) ,. en(btnD),.rst(btnC),.Q(R1));
    
    alu #(.N(8)) a(.in1(R1),.in0(sw[7:0]),.op(sw[11:8]),.out(A1));
    
    register #(.N(8))r2(.D(A1),. clk(clk) ,. en(btnU) ,. rst(btnC),. Q(led[15:8]));
    
    assign led[7:0] = R1;
endmodule
