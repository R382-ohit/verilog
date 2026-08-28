// this is the example where we'll be looking on modelling the 16-bit adder
// and also learn about the "Generation of the Status Flags"
/*Sign Zero Carry Parity Overflow*/

// TOPIC - 16-bit adder

// Version 1 -->> Behavioural description
module ALU(X,Y,Z,Sign,Zero,Carry,Parity,Overflow);
    input [15:0] X,Y;
    output [15:0] Z;
    output Sign,Zero,Carry,Parity,Overflow;

    // using concatenation operation
    assign{Carry,Z} = X + Y; // 16-bit addition
    assign Sign = Z[15]; // numbers are represented in 2's complement form so the very first bit indicates the sign bit 
    assign Zero = ~|Z;
    assign Parity = ~^Z;
    assign Overflow = (X[15] & Y[15] & ~Z[15]) | (~X[15] & ~Y[15] & Z[15]);
endmodule