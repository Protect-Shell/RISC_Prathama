/*

 This file is the part of STTP workshop Conducted at
  St Joseph Engineering College 
  
  Created By P.C. Vijay Ganesh


*/
module adder(in_a,in_b,in_cin,out_sum,out_carry);

input [3:0]in_a,in_b;
input in_cin;
output [3:0]out_sum;
output out_carry;

assign {out_carry,out_sum} = in_a+in_b+in_cin;

endmodule
