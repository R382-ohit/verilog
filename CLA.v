module cla(s, cout, x, y, cin);
    // these are the 2 4-bit inputs
    input [3:0] x, y;
    input cin;
    // these are the ones which will store the outputs 
    output [3:0] s;
    output cout;
    // for intermediate calculations
    wire [3:1] c;
    wire [3:0] p, g;
    // assign the propagate and generate alltogether 
    assign p = x ^ y;
    assign g = x & y;
    // we write it in simplified form as this speeds up the things and also avoids the extra loopings 
    assign c[1] = g[0] | (p[0] & cin);

    assign c[2] = g[1] |
                  (p[1] & g[0]) |
                  (p[1] & p[0] & cin);

    assign c[3] = g[2] |
                  (p[2] & g[1]) |
                  (p[2] & p[1] & g[0]) |
                  (p[2] & p[1] & p[0] & cin);

    assign cout = g[3] |
                  (p[3] & g[2]) |
                  (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & cin);

    assign s[0] = p[0] ^ cin;
    assign s[1] = p[1] ^ c[1];
    assign s[2] = p[2] ^ c[2];
    assign s[3] = p[3] ^ c[3];

endmodule