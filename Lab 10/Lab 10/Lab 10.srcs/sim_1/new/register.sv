
module register ( 
);
reg clk, en, rst;
wire [3:0] count;
wire tick;

counter #(.N(4)) c (.clk(clk), .rst(rst), .en(en), .count(count) , .tick(tick));

always begin 
    clk = ~clk; #5;
end

initial begin 
    clk = 0; en = 0; rst = 0; #5;
    rst = 1; #5;
    en = 1; rst = 0; #5;
    en = 1; #5;
    en = 0; #5;
    en = 0; #5;
    en = 1; #5;
    en = 1; #5;
    en = 0; #5;
    en = 0; #5;
    $finish;
    end
endmodule