module counter_test();

    reg clk, en, rst;
    wire [1:0} count;
    wire tick;
    
    counter #(.N(2)) a(.clk(clk), .en(en), .rst(rst),
            .count(count), .tick(tick));
            
    always begin 
        clk = ~clk;
        #5
    end
    
    initial begin 
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    $finish;
    end
    endmodule
    

