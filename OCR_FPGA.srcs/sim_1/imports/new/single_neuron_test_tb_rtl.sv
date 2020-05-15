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


module single_neuron_test_tb_rtl;
    reg [3:0] x;
    //real  x [3:0];
    reg z;
    wire [15:0] y;
    reg clk;
    reg rst;
    reg mode;
    single_neuron_test_rtl singleneuron(
    .x(x) ,.z(z), .rst(rst) , .clk(clk), .y(y), .mode(mode));
    /*neuron_layer3 neuron3(
    .x(x) ,.z(z), .rst(rst) , .clk(clk), .y(y), .mode(mode));*/
    
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
x <= 0;
x[1] <= 0;
x[2] <= 0;
x[3] <= 0;
z <=0;
mode <=0;
#105
mode <=1;
#100;
//mode <=1;
end  
  
     always@(posedge clk)begin
   //  x[3:0] <= x_nxt[0:3];
   
        if(i<4) begin
            x[i] <= 1;
            x[i+1] <= 0;
            i = i+1;
            z <= ~z;           
            end
        else  i=0;
            
     end
    
endmodule
