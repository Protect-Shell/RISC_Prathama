

/*

 This file is the part of STTP workshop Conducted at
  St Joseph Engineering College 
  
  Created By P.C. Vijay Ganesh


*/
/*

 The operations to be tested are
 
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


module ALU_tb();


reg [3:0]in_a,in_b;
reg [3:0]fun;
wire [3:0]out_alu;
wire out_carry;

// DUT
ALU atb0(in_a,in_b,fun,out_alu,out_carry);

initial
begin
$monitor(" in_b = %b, in_a = %b, fun=%b, out_alu = %b, Carry = %b",in_b,in_a,fun,out_alu,out_carry);
in_a = 0;
in_b =0;

fun = 0;

#10;

in_a = 2;
in_b =4;
fun = 9;
#10 $finish;


end 

endmodule
