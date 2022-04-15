/*

 This file is the part of STTP workshop Conducted at
  St Joseph Engineering College 
  
  Created By P.C. Vijay Ganesh

/*

 The operations are 
 
 Function   F3  f2  f1  f0
 
 AND        0   0   0   0
 OR         0   0   0   1
 NAND       0   0   1   0
 NOR        0   0   1   1
 EXOR       0   1   0   0
 NOT        0   1   0   1
 
 RES        0   1   1   x


  
*/

module LogicalUnit(in_a,in_b,fun,out_logical);

input [3:0]in_a,in_b;
input [2:0]fun;
output reg [3:0]out_logical;

always @(*)
begin

case(fun)
3'd0: out_logical = in_a & in_b;
3'd1: out_logical = in_a | in_b;
3'd2: out_logical = ~(in_a & in_b);
3'd3: out_logical = ~(in_a | in_b);
3'd4: out_logical = in_a ^ in_b;
3'd5: out_logical = ~in_a;
default: out_logical = 3'd0;
endcase

end
endmodule
