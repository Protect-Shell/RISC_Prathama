`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 10:48:59
// Design Name: 
// Module Name: ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//random access memory
module ram(clk,data,read,address,cs_ram,ready_ram);
parameter data_width=4;
parameter address_width=4;
parameter memory_depth=16; // Modified according to 2022 Workshop
inout  [data_width-1:0]data;
input[address_width-1:0] address;
input cs_ram,read,clk ;
output reg ready_ram ;
reg [data_width-1:0] RAM[memory_depth-1:0];
reg [data_width-1:0] data_1;
integer state=0;

always@(posedge clk)
begin
case(state)
0: begin
if(cs_ram)
state=1;
else
state=0;
end
1:begin
if(~read)//write
state=2;
else//read
state=3;
end
2:state=0;
3:state=0;
endcase
end

always@(state)
case(state)
0:begin
ready_ram=1;
data_1=16'bZ;
end
1:ready_ram=0;
//write
2:begin
RAM[address[13:0]]=data;
ready_ram=1;
end
//read
3:begin
data_1=RAM[address[13:0]];
ready_ram=1;
end
endcase

assign data=(cs_ram&read)?data_1:16'bZ;
endmodule
