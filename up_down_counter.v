module up_down_counter(mode,clr,ld,d_in,clk,count);
    input mode,clr,clk,ld;
    input [0:7] d_in;
    output reg [0:7]count;
    always @(posedge clk) begin
        if(ld) count <= d_in;
        else if(clr) count <= 0;
        else if(mode) count <= count + 1;
        else count <= count - 1;
    end
endmodule