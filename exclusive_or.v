`timescale 10ns/1ns
// this too has some proper pattern into it
// it goes like ------------>>>>>
// `timescale <reference_time_unit>/<time_precision>

// it is better to have the delay declaration at the beginning
//  of the module as when working with large projects we need 
// to have varying delays for different modules so define then at the top itself 

module exclusive_or(f,a,b);
    input a,b;
    output f;
    wire t1,t2,t3;
    nand #5 m1(t1,a,b);
    and #5 m2(t2,t1,a);
    ans #5 m3(t3,t1,b);
    nor #5 m4(f,t3,t2);
endmodule