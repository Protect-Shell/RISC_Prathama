/*

 This file is the part of STTP workshop Conducted at
  St Joseph Engineering College 
  
  Created By P.C. Vijay Ganesh

  Day 02: 
  Adding Control signal to validate the results 
  Use of Melay or moore method 

*/

module ALUwithReg(clk,en,rst,in_a,in_b,fun,out_alu,out_carry);

input clk,en,rst;
input [3:0]in_a;
input [3:0]in_b;
input [3:0]fun;
output out_carry;
output reg [3:0] out_alu;

reg [3:0]temp_a,temp_b,temp_fun;
wire [3:0]w_alu_value;
reg [3:0]current_state,next_state;

ALU AL0(temp_a,temp_b,temp_fun,w_alu_value,out_carry);

//assign current_state = rst?0:next_state;

/*
always @(posedge clk)
begin
if(en)
begin
temp_a = in_a;
temp_b = in_b;
temp_fun = fun;
end 
else
 begin
 temp_a = temp_a;
 temp_b = temp_b;
 temp_fun =temp_fun;
 end 
end

*/


always @(posedge clk)
begin
 case (current_state)
 0: begin
        if(en)
            next_state = 1;
        else
            next_state = current_state;
    end
1: begin
        temp_a = in_a;
        temp_b = in_b;
        temp_fun = fun;
        next_state = 2;
    end 
2: begin
    out_alu = w_alu_value;
    next_state = 0;
    end 
default: next_state = 0;
endcase
current_state = next_state;

end 
endmodule
