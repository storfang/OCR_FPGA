`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2020 14:48:22
// Design Name: 
// Module Name: network_tb
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


module network_tb();
        reg [3:0] x;
        reg [3:0] z;
        real  y[3:0];
        reg clk;
        reg rst;
        reg mode;
        reg [255:0] temp ;
        reg [255:0] temp2 ;
        reg ready;
        reg start;
        localparam
        A = 16'b0110100111111001,
        C = 16'b1111000000001111,
        D = 16'b0111100110011111,
        F = 16'b1111000111110001,
        H = 16'b1001111111111001,
        I = 16'b1111011001101111,
        J = 16'b1111100010011110,
        L = 16'b0001000100011111,
        N = 16'b1001101111011001,
        O = 16'b1111100110011111,
        P = 16'b1111100111110001,
        T = 16'b1111011001100110,
        U = 16'b1001100110010110,
        X = 16'b1001011001101001,
        Y = 16'b1001011001100110,
        Z = 16'b1111010000101111;
        
        /*single_neuron_test singleneuron(
        .x(x) ,.z(z), .rst(rst) , .clk(clk), .y(y), .mode(mode));*/
        network network1(
        .x1(x) ,.z(z), .rst(rst) , .clk(clk), .y3(y), .mode(mode), .start(start), .ready(ready));
        
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
    /*x[15:0] <= 0;
    x[1] <= 0;
    x[2] <= 0;
    x[3] <= 0;*/
    z <=4'b0000;
    mode <=0;
    start <=0;
    temp[255:255-(16*1)+1] <= A;
    temp[255-(16*1):255-(16*2)+1] <= C;
    temp[255-(16*2):255-(16*3)+1] <= D;
    temp[255-(16*3):255-(16*4)+1] <= F;
    temp[255-(16*4):255-(16*5)+1] <= H;
    temp[255-(16*5):255-(16*6)+1] <= I;
    temp[255-(16*6):255-(16*7)+1] <= J;
    temp[255-(16*7):255-(16*8)+1] <= L;
    temp[255-(16*8):255-(16*9)+1] <= N;
    temp[255-(16*9):255-(16*10)+1] <= O;
    temp[255-(16*10):255-(16*11)+1] <= P;
    temp[255-(16*11):255-(16*12)+1] <= T;
    temp[255-(16*12):255-(16*13)+1] <= U;
    temp[255-(16*13):255-(16*14)+1] <= X;
    temp[255-(16*14):255-(16*15)+1] <= Y;
    temp[255-(16*15):255-(16*16)+1] <= Z;
    temp2 <= temp;
    #300;
    mode <=1;
    start <=1;
    #15; start <= 0;
    end  
      
         always@(posedge clk)begin
       //  x[3:0] <= x_nxt[0:3];
            x[3] <=1;
            if(i<2) begin
                x[i] <= 1;
                x[i+1] <= 0;
                i = i+1;
                z <= 1;           
                end
            else  i=0; temp2 = temp; start = 1;
       /*if(ready==1)begin
       //start = 1;
         if(i<16)begin
         start = 0;
         x[15:0] <= temp2[255:255-15];
         temp2 <= (temp2 << 16);
         z <= i/4;
         i = i+1;
         end
         else 
         i=0; temp2 = temp; start = 1; end*/
       end
        
endmodule
