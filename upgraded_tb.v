module adaptive_tb;

reg clk = 0;
reg reset;
reg sensor_A;
reg sensor_B;

wire gate;
wire signal;

adaptive_railway uut (
    .clk(clk),
    .reset(reset),
    .sensor_A(sensor_A),
    .sensor_B(sensor_B),
    .gate(gate),
    .signal(signal)
);

// clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("adaptive.vcd");
    $dumpvars(0, adaptive_tb);

    reset = 1;
    sensor_A = 0;
    sensor_B = 0;

    #10 reset = 0;

    // Train approaches
    #20 sensor_A = 1;

    // Train passes
    #20 sensor_A = 0;
    sensor_B = 1;

    #20 sensor_B = 0;

    #200 $finish;
end

endmodule
