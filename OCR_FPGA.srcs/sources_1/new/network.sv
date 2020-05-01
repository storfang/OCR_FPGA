`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2020 19:17:36
// Design Name: 
// Module Name: network
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


module network(


    input wire [15:0] x1,
    input wire [3:0] z,
    input wire rst,
    input wire clk,
    output reg [3:0] y3
    );
        wire [11:0] y2;
        wire [11:0] x3;
        wire [7:0] y1;
  
  //1 layer
        neuron_layer1 n1_0(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[0]));
        neuron_layer1 n1_1(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[1]));
        neuron_layer1 n1_2(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[2]));
        neuron_layer1 n1_3(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[3]));  
        neuron_layer1 n1_4(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[4]));
        neuron_layer1 n1_5(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[5]));
        neuron_layer1 n1_6(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[6]));
        neuron_layer1 n1_7(.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[7])); 
        
// 2 layer        
        
        neuron_layer2 n2_0(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[0]));
        neuron_layer2 n2_1(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[1]));
        neuron_layer2 n2_2(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[2]));
        neuron_layer2 n2_3(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[3]));  
        neuron_layer2 n2_4(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[4]));
        neuron_layer2 n2_5(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[5]));
        neuron_layer2 n2_6(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[6]));
        neuron_layer2 n2_7(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[7])); 
        neuron_layer2 n2_8(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[0]));
        neuron_layer2 n2_9(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[1]));
        neuron_layer2 n2_10(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[2]));
        neuron_layer2 n2_11(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[3]));  
        neuron_layer2 n2_12(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[4]));
        neuron_layer1 n2_13(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[5]));
        neuron_layer1 n2_14(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[6]));
        neuron_layer1 n2_15(.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[7])); 
        
 
//3 layer    
        neuron_layer3 n3_0(.x(x3[2:0]) ,.z(z), .rst(rst) , .clk(clk), .y(y3[0]));
        neuron_layer3 n3_1(.x(x3[5:3]) ,.z(z), .rst(rst) , .clk(clk), .y(y3[1]));
        neuron_layer3 n3_2(.x(x3[8:6]) ,.z(z), .rst(rst) , .clk(clk), .y(y3[2]));
        neuron_layer3 n3_3(.x(x3[11:9]) ,.z(z), .rst(rst) , .clk(clk), .y(y3[3]));
endmodule
