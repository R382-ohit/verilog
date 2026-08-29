module testbench;

    reg in1, in0, s;
    wire f;

    // Instantiate DUT
    mux21 M1(
        .in1(in1),
        .in0(in0),
        .s(s),
        .f(f)
    );

    initial begin
        $dumpfile("prac.vcd");
        $dumpvars(0,testbench);   
        // Display values whenever they change
        $monitor("Time=%0t | in1=%b in0=%b s=%b | f=%b",
                 $time, in1, in0, s, f);

        // Test 1
        in1 = 0;
        in0 = 0;
        s = 0;
        #10;

        // Test 2
        in1 = 0;
        in0 = 1;
        s = 0;
        #10;

        // Test 3
        in1 = 1;
        in0 = 0;
        s = 0;
        #10;

        // Test 4
        in1 = 1;
        in0 = 1;
        s = 0;
        #10;

        // Test 5
        in1 = 0;
        in0 = 0;
        s = 1;
        #10;

        // Test 6
        in1 = 0;
        in0 = 1;
        s = 1;
        #10;

        // Test 7
        in1 = 1;
        in0 = 0;
        s = 1;
        #10;

        // Test 8
        in1 = 1;
        in0 = 1;
        s = 1;
        #10;

        $finish;

    end

endmodule