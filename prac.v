// this is my go to practice workspace file 
// in this I will be updating my practiced examples and this file might keep on changing frequently 
module mux21(in1,in0,s,f);
    input in1,in0,s;
    output reg f;
    always @(in1 or in0 or s)
    begin
        if(s)
            f = in1;
        else 
            f = in0; 
    end
endmodule