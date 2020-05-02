`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2020 11:54:36
// Design Name: 
// Module Name: single_neuron_test
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


module single_neuron_test(
    input real   x [3:0],
    input wire  z,
    input wire rst,
    input wire clk,
    input wire mode,
    output reg [13:0] y
    );
    parameter integer FXP_SCALE = 1;
    parameter LEARNING_RATE = 0.1*FXP_SCALE;
    real w[3:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE};
    real w_nxt[3:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE};
    real sum = 0;
    real temp = 0;
    real delta = 0;
    real komparator = 0;
    real y_nxt;
    integer i =0;

    always@(posedge clk || rst) begin
        if(rst) y = 0;
        else
         begin
         assign sum = x[0]*w[0]+x[1]*w[1]+x[2]*w[2]+x[3]*w[3];
                 /* for(i=0;i<4;i++) begin
         assign temp = x[i]*w[i]+temp;
                end
                sum = temp;
                temp=0;*/
             if(sum<0) y=12'b0;
            else y=sum;
         end
         w[0] <= w_nxt[0];
         w[1] <= w_nxt[1];
         w[2] <= w_nxt[2];
         w[3] <= w_nxt[3];
         //y<=y_nxt;
         y_nxt = real'(y)/FXP_SCALE;
         $display(" sum = %f y = %f" , sum, y_nxt);    
     end
    always@*
    if (mode == 1) begin
    begin
    assign komparator = z - sum;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    /*w_nxt[0] = x[0]*delta+w[0];
    w_nxt[1] = x[1]*delta+w[1];
    w_nxt[2] = x[2]*delta+w[2];
    w_nxt[3] = x[3]*delta+w[3];*/
    for(i=0;i<4;i++) w_nxt[i] = x[i]*delta+w[i];        
    end end
    
endmodule
