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


module single_neuron_test_rtl(
    input wire  [3:0] x ,
    input wire  z,
    input wire rst,
    input wire clk,
    input wire mode,
    output reg signed [15:0] g_delta[4:0],
    output reg signed [15:0] y
    );
    parameter integer FXP_SCALE = 1024;
    parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE;
    reg signed [15:0] w[3:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE};
    reg signed [15:0] w_nxt[3:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE};
    reg signed [15:0] sum = 0;
    reg signed [15:0] temp [3:0] = {0,0,0,0};
    reg signed [31:0] delta = 0; //reg signed [15:0] delta2 = 0;
    reg signed [15:0] komparator = 0;
    real y_nxt;real sumo;
    integer i =0; integer j =0;

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
             if(sum<0) y=15'b0;
            else y=sum;
         end
         w[0] <= w_nxt[0];
         w[1] <= w_nxt[1];
         w[2] <= w_nxt[2];
         w[3] <= w_nxt[3];
         //y<=y_nxt;
         y_nxt = real'(y)/FXP_SCALE; sumo = real'(sum)/FXP_SCALE;
         $display(" sum = %f y = %f" , sumo, y_nxt);    
     end
  /*  always@*
    for(j=0;j<4;j++)begin
    if(x[j]==0) temp[j]=15'b0;
    else temp[j]=15'b1;
    end*/
    
    always@*
    
    if (mode == 1) begin
    begin
    komparator = z*FXP_SCALE - sum;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    //delta2 = delta[23:7]/FXP_SCALE;
    /*w_nxt[0] = x[0]*delta+w[0];
    w_nxt[1] = x[1]*delta+w[1];
    w_nxt[2] = x[2]*delta+w[2];
    w_nxt[3] = x[3]*delta+w[3];*/;
    for(i=0;i<4;i++)begin w_nxt[i] = x[i]*delta/FXP_SCALE+w[i]; 
    g_delta[i] = delta/FXP_SCALE*w[i]; end       
    end end
    
endmodule
