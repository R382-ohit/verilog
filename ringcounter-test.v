module ringcounter_tb;

    reg clk;
    reg init;
    wire [7:0] count;

    ringcounter DUT (
        .clk(clk),
        .init(init),
        .count(count)
    );

    always #5 clk = ~clk;

    initial
    begin
        $dumpfile("ringcounter.vcd");
        $dumpvars(0, ringcounter_tb);

        clk  = 0;
        init = 0;

        #10;
        init = 1;

        #10;
        init = 0;

        #100;

        $finish;
    end

    // Display output
    initial
    begin
        $monitor("Time = %0t | clk = %b | init = %b | count = %b",
                 $time, clk, init, count);
    end

endmodule