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


module network_tb_rtl();
        reg [15:0] x;
        reg [3:0] z;
        wire  [71:0]y;
        reg clk;
        reg rst;
        reg mode;
        reg [255:0] temp ;
        reg [255:0] temp2 ;
        reg ready;
        reg start;
       
        localparam
        A = 16'b0110_1001_1111_1001,//0111
        C = 16'b1111_0001_0001_1111,//1000
        D = 16'b0111_1001_1001_0111,//1111
        F = 16'b1111_0001_1111_0001,//1011
        H = 16'b1001_1111_1111_1001,//0110
        I = 16'b0110_0110_0110_0110,//0000    
        J = 16'b1111_1000_1001_1110,//1010
        L = 16'b0001_0001_0001_1111,//0001
        N = 16'b1001_1011_1101_1001,//0101  
        O = 16'b1111_1001_1001_1111,//1101
        P = 16'b1111_1001_1111_0001,//1110
        T = 16'b1111_0110_0110_0110,//1010
        U = 16'b1001_1001_1001_0110,//0100
        X = 16'b1001_0110_0110_1001,//0011
        Y = 16'b1001_0110_0110_0110,//0010
        Z = 16'b1111_0100_0010_1111;//1001

        network_rtl network1(
        .x1(x) ,.z(z), .rst(rst) , .clk(clk), .y4(y), .mode(mode), .start(start), .ready(ready));

        parameter FXP_SCALE = 16384;
        int i = 0;    real y43; real y42; real y41; real y40;
        reg [3:0] z_prev;

    initial
         clk <= 1'b1;
        always
         #5 clk <= ~clk;
         
    initial
    begin
    rst <= 1'b1;
    #10;
    rst <= 1'b0;

    x <= L;
    /*x[15:0] <= 0;
    x[1] <= 0;
    x[2] <= 0;
    x[3] <= 0;*/
    z <=4'b0001;
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
    #800;
    mode <=1;
    start <=1;
    #15; start <= 0;
    
    //x <= C; z <= 7; #100;
    //x <= D; z <= 8; #5000;
    //x <= A; z <= 15; #50000;
    //x <= F; z <= 11; #500;
    //x <= H; z <= 6; #5000;
    //x <= I; z <= 0; #5000;
    //x <= J; z <= 12; #500;
    x <= L; z <= 1; #50000;
    //x <= N; z <= 5; #5000;
    //x <= O; z <= 13; #50000;
    //x <= P; z <= 14; #8000;
    //x <= T; z <= 10; #8000;
    x <= U; z <= 4; #8000;
    //x <= X; z <= 3; #8000;
    //x <= Y; z <= 2; #8000;
    x <= Z; z <= 9; #8000
    mode <= 1;

        for(i=0;i<5000;i++)begin
        x <= A; z <= 7; #1000;
        x <= C; z <= 8; #1000;
        x <= D; z <= 15; #1000;
        x <= F; z <= 11; #1000;
        x <= H; z <= 6; #1000;
        x <= I; z <= 0; #1000;
        x <= J; z <= 12; #1000;
        x <= L; z <= 1; #1000;
        x <= N; z <= 5; #1000;
        x <= O; z <= 13; #1000;
        x <= P; z <= 14; #1000;
        x <= T; z <= 10; #1000;
        x <= U; z <= 4; #1000;
        x <= X; z <= 3; #1000;
        x <= Y; z <= 2; #1000;
        x <= Z; z <= 9; #1000;
        end
        mode <= 0;
        $display("mode = 0");

    x <= A; z <= 7; #1000;
    x <= C; z <= 8; #1000;
    x <= D; z <= 15; #1000;
    x <= F; z <= 11; #200;
    x <= H; z <= 6; #200;
    x <= I; z <= 0; #200;
    x <= J; z <= 12; #90;
    x <= L; z <= 1; #90;
    x <= N; z <= 5; #90;
    x <= O; z <= 13; #90;
    x <= P; z <= 14; #90;
    x <= T; z <= 10; #90;
    x <= U; z <= 4; #90;
    x <= X; z <= 3; #90;
    x <= Y; z <= 2; #90;
    x <= Z; z <= 9; #90;
    
    
    $finish;
    end  
      
         always@(posedge clk)begin
       //  x[3:0] <= x_nxt[0:3];
            //x[3] <=1;
           /* if(i==2) begin
                x[i] <= 1;
                x[i+1] <= 0;
              / x <= 4'b1111;
                i = 0;
                z <= 1;           
                end
            else begin i=i+1; x <= 4'b0000; z <= 0; temp2 = temp; start = 1; end*/ 
            
       if(ready==1)begin
       start = 1;
       
       y43 = real'(y[71:54])/FXP_SCALE; y42 = real'(y[53:36])/FXP_SCALE; 
       y41 = real'(y[35:18])/FXP_SCALE; y40 = real'(y[17:0])/FXP_SCALE;
       $display("--- y43 = %f y42 = %f y41 = %f y40 = %f z = %b" ,  y43,y42,y41,y40,z_prev);
       z_prev = z;
         /*if(i<0)begin
         start = 0;
         //x[15:0] <= temp2[255-(16*0):255-(16*1)+1];
         //temp2 <= (temp2 << 16);
         //x[i] <= 1; x[i-1] <= 0;
         //x<=i;
         x<=(x << 4);
         z <= (z << 4);
         //z<=i*3;
        // x[i] = 1'b1;
        // x[i-1] = 1'b0;
         i = i+1;
         end
         else begin
         i=0; temp2 = temp;  z <=4'b0001; x<=C; end start = 1;
       */end end
       // z <=4'b0001;
endmodule
