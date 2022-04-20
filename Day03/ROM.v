module ROM_4xn(clk,en,rst,address,data,done);
input [3:0]address;
output  reg [3:0]data;
input rst,clk,en;
output reg done;

reg [3:0]ROM[3:0];
reg [1:0]current_state,next_state;
always@(rst)
begin
/* To load the data use readmamh to update */
ROM[0] = 4'b1001;
ROM[1] = 4'b0100;
ROM[2] = 4'b0001;
end

always @(posedge clk)
begin
 if(rst | !en)
    data = 4'bz;
 else
  case(current_state)
  1'd0: begin done = 1'b0; next_state = 1; end 
  1'd1: if(en) next_state = 2; else next_state = 2'd0;
  1'd2: begin data = ROM[address]; next_state = 2'd3; end 
  1'd3: begin done = 1'b1; next_state = 0; end 
  default: next_state = 0;
  endcase
  
  current_state = next_state;
end 

endmodule
