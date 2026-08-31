module testbench;

    reg mode;
    reg clr;
    reg ld;
    reg clk;
    reg [7:0] d_in;
    wire [7:0] count;

    up_down_counter DUT (
        .mode(mode),
        .clr(clr),
        .ld(ld),
        .d_in(d_in),
        .clk(clk),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, testbench);

        $monitor("Time=%0t | mode=%b clr=%b ld=%b d_in=%d | count=%d",
                 $time, mode, clr, ld, d_in, count);

        // Initial values
        clk  = 0;
        mode = 0;
        clr  = 0;
        ld   = 0;
        d_in = 8'd0;

        
        #2;
        d_in = 8'd10;
        ld = 1;
        #8;
        ld = 0;

        // Count UP
        mode = 1;
        #40;

        // Count DOWN
        mode = 0;
        #40;

        // Clear
        clr = 1;
        #10;
        clr = 0;

        // Load 250
        d_in = 8'd250;
        ld = 1;
        #10;
        ld = 0;

        // Count UP to demonstrate overflow
        mode = 1;
        #70;

        // Count DOWN
        mode = 0;
        #30;

        $finish;
    end

endmodule