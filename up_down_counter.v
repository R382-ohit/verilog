module up_down_counter(mode,clr,ld,d_in,clk,count);
    input mode,clr,clk,ld;
    parameter N = 7;
    input [0:N] d_in;
    output reg [0:N]count;
    always @(posedge clk) begin
        if(ld) count <= d_in;
        else if(clr) count <= 0;
        else if(mode) count <= count + 1;
        else count <= count - 1;
    end
endmodule