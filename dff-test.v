module testbench;
    reg d,set,reset,clk;
    wire q,qbar;
    dff DUT(q,qbar,d,set,reset,clk);

    always #5 clk = ~ clk;
    initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0,testbench);
        clk = 0; d = 0; set = 1; reset = 1;
        $monitor("Time=%0t | clk=%b reset=%b set=%b d=%b | q=%b qbar=%b",$time,clk,reset,set,d,q,qbar);

        #2 d = 1;
        #8;

        #2 d = 0;
        #8;

        #2 set = 1;

        #2 reset = 0;
        #8;

        #2 reset = 1;

        #2 set = 0; reset = 0;
        #8;

        #2 set = 1; reset = 1; d = 1;
        #8

        $finish;

    end
endmodule