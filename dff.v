// active-low set and resets 
// D - Flip Flops
// Non - Blocking assignments 
module dff(q,qbar,d,set,reset,clk);
    input d,set,reset,clk;
    output reg q;
    output qbar;
    assign qbar = ~q;

    always @(posedge clk)
        begin
            if(!reset) q<=0;
            else if(!set) q<=1;
            else q<=d;
        end
    
endmodule