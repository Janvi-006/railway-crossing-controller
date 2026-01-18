module railway_tb;

reg clk = 0;
reg reset;
reg train_detect;
wire gate;
wire signal;

railway uut (
    .clk(clk),
    .reset(reset),
    .train_detect(train_detect),
    .gate(gate),
    .signal(signal)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // THESE TWO LINES ARE CRITICAL
    $dumpfile("railway.vcd");
    $dumpvars(0, railway_tb);

    reset = 1;
    train_detect = 0;
    #10 reset = 0;

    #20 train_detect = 1;
    #20 train_detect = 0;

    #100 $finish;
end

endmodule

