module mux4 #(parameter N =4)(
    input [N-1:0] in0, in1, in2, in3,
    input [1:0] sel,
    output reg [3:0] out
     );
     
     always @*
        case(sel)
        0: out = in0;
        1: out = in1;
        2: out = in2;
        default: out = in3;
        endcase 
endmodule
