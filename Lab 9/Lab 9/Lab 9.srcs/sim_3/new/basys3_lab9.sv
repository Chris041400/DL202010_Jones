module basys3_lab9 ();
    reg btnU, btnD, clk, btnC;
    reg [11:0] sw;
    wire [15:0] led;
    
    top_lab9 top_lab9_inst (.btnU(btnU), .btnD(btnD), .sw(sw), .clk(clk),
        .btnC(btnC), .led(led));
        
    always
        begin
            #5;
            clk = ~clk;
        end
        
    initial
        begin
            btnU = 0;
            btnD = 0;
            clk = 0;
            btnC = 1;
            sw = 16'h0014;
            #10;
            btnD = 1;
            btnC = 0;
            #10;
            sw[7:0] = 0;
            btnU = 1;
            btnD = 0;
            #10;
            btnU = 0;
            btnC = 1;
            #10;
            sw[7:0] = 8'h14;
            btnU = 0;
            btnD = 1;
            btnC = 0;
            #10;
            sw[7:0] = 8'h7A;
            btnU = 1;
            btnD = 0;
            #10;
            sw[11:8] = 1;
            #10;
            sw[11:8] = 2;
            #10;
            sw[11:8] = 3;
            #10;
            sw[11:8] = 4;
            #10;
            $finish;
        end
endmodule
