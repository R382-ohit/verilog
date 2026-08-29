module tesbench;
    // s cout x y cin
    reg [3:0] x,y;
    wire [3:0] s;
    wire cout;
    reg cin;
    cla DUT(s,cout,x,y,cin);

    initial begin
    $dumpfile("cla.vcd");
    $dumpvars(0,tesbench);

    $monitor($time," X=%h Y=%h cin=%b S=%h cout=%b",
             x,y,cin,s,cout);

    x = 4'b0000; y = 4'b0000; cin = 0;
    #10 x = 4'b0011; y = 4'b0101; cin = 0;  // 3 + 5 = 8
    #10 x = 4'b0111; y = 4'b0001; cin = 0;  // 7 + 1 = 8
    #10 x = 4'b1111; y = 4'b0001; cin = 0;  // 15 + 1 = 16
    #10 x = 4'b1010; y = 4'b0101; cin = 0;  // 10 + 5 = 15
    #10 x = 4'b1111; y = 4'b1111; cin = 0;  // 15 + 15 = 30
    #10 x = 4'b1111; y = 4'b1111; cin = 1;  // 15 + 15 + 1 = 31

    #10 $finish;
    end
    
endmodule