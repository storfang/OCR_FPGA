`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2020 12:11:22
// Design Name: 
// Module Name: single_neuron_test_tb
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


module single_neuron_test_tb;
    reg [3:0] x;
    reg z;
    wire [3:0] y;
    reg clk;
    reg rst;
    single_neuron_test singleneuron(
    .x(x) ,.z(z), .rst(rst) , .clk(clk), .y(y));
    
    int i = 0;
  //  wire [3:0] x_nxt[3:0]= {1, 0, 1, 0};
initial
     clk <= 1'b1;
    always
     #5 clk <= ~clk;
     
initial
begin
rst <= 1'b1;
#10;
rst <= 1'b0;
x[0] <= 0;
x[1] <= 0;
x[2] <= 0;
x[3] <= 0;
z <=0;
end  
  
     always@(posedge clk)begin
   //  x[3:0] <= x_nxt[0:3];
   
        if(i<4) begin
            x[i] <= 1;
            x[i+1] <= 0;
            i = i+1;end
        else  i=0;
            
     end
    
endmodule
