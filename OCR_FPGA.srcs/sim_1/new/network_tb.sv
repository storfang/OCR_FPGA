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
        reg [15:0] x;
        reg [3:0] z;
        reg [3:0] y;
        reg clk;
        reg rst;
        reg mode;
        reg [255:0] temp ;
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
        .x1(x) ,.z(z), .rst(rst) , .clk(clk), .y3(y), .mode(mode));
        
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
 //   z <=0;
    mode <=1;
    temp[255:255-(16*1)] <= A;
    temp[255-(16*1):255-(16*2)] <= C;
    temp[255-(16*2):255-(16*3)] <= D;
    temp[255-(16*3):255-(16*4)] <= F;
    temp[255-(16*4):255-(16*5)] <= H;
    temp[255-(16*5):255-(16*6)] <= I;
    temp[255-(16*6):255-(16*7)] <= J;
    temp[255-(16*7):255-(16*8)] <= L;
    temp[255-(16*8):255-(16*9)] <= N;
    temp[255-(16*9):255-(16*10)] <= O;
    temp[255-(16*10):255-(16*11)] <= P;
    temp[255-(16*11):255-(16*12)] <= T;
    temp[255-(16*12):255-(16*13)] <= U;
    temp[255-(16*13):255-(16*14)] <= X;
    temp[255-(16*14):255-(16*15)] <= Y;
    temp[255-(16*15):255-(16*16)] <= Z;
    end  
      
         always@(posedge clk)begin
       //  x[3:0] <= x_nxt[0:3];
       /*
            if(i<4) begin
                x[i] <= 1;
                x[i+1] <= 0;
                i = i+1;
                z <= ~z;           
                end
            else  i=0;*/
         //for(i=0;i<1000;i++)begin
         x[15:0] <= A;
         z <= 4'b0000;
         
         
                
         end// end
        
endmodule
