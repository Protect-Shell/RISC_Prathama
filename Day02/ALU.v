
/*

 This file is the part of STTP workshop Conducted at
  St Joseph Engineering College 
  
  Created By P.C. Vijay Ganesh


*/
/*

 The operations are 
 
 Function   F3  f2  f1  f0
 add        1   0   0   0
 sub        1   0   0   1
 AND        0   0   0   0
 OR         0   0   0   1
 NAND       0   0   1   0
 NOR        0   0   1   1
 EXOR       0   1   0   0
 NOT        0   1   0   1
 RES        1   x   x   0
 RES        0   1   1   x

*/
`timescale 1ns/1ps
module ALU(in_a,in_b,fun,out_alu,out_carry);

input [3:0]in_a,in_b;
input [3:0]fun;
output [3:0]out_alu;
output out_carry;

wire [3:0]w_b;
wire w_cin;
wire [3:0] w_sum;
wire [3:0] w_logical;

assign w_cin = (fun[3] & fun[0])?1'b1:1'b0;
assign w_b   = (fun[3] & fun[0])?~in_b:in_b;


adder A0(in_a,w_b,w_cin,w_sum,out_carry);
LogicalUnit L0(in_a,w_b,fun[2:0],w_logical);

assign out_alu = fun[3]?w_sum:w_logical;


endmodule
