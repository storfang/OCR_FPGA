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

 //input logic start,
 //output logic ready,

    input wire [15:0] x1,
    input wire [3:0] z,
    input wire rst,
    input wire clk,
    input wire mode,
    input wire start,
    output reg ready,
    output real  y4[3:0]
    );
    
    parameter LAYER0 = 16;
    parameter LAYER1 = 8;
    parameter LAYER2 = 8;
    parameter LAYER3 = 8;
    parameter LAYER4 = 4;
    parameter ALL_LAYERS = LAYER0+LAYER1+LAYER2+LAYER3+LAYER4;
    parameter FXP_SCALE = 1;
    parameter LEARNING_RATE = 0.02*FXP_SCALE; 
    
    reg mode1; reg mode2; reg mode3; reg mode4;
    
    reg [LAYER0-1:0] x1_prev;
    reg [LAYER4-1:0] z_prev;
    
    real  y1 [LAYER1-1:0] ; real  y1_nxt [LAYER1-1:0] ;
    
    real delta21 [LAYER1-1:0]; real delta22 [LAYER1-1:0]; real delta23 [LAYER1-1:0]; real delta24 [LAYER1-1:0]; real delta25 [LAYER1-1:0];
    real delta26 [LAYER1-1:0]; real delta27 [LAYER1-1:0]; /*real delta28 [LAYER1-1:0]; real delta29 [LAYER1-1:0]; real delta210 [LAYER1-1:0];
    real delta211 [LAYER1-1:0]; real delta212 [LAYER1-1:0]; real delta213 [LAYER1-1:0]; real delta214 [LAYER1-1:0]; real delta215 [LAYER1-1:0];
    real delta216 [LAYER1-1:0]; real delta217 [LAYER1-1:0]; real delta218 [LAYER1-1:0]; real delta219 [LAYER1-1:0]; real delta220 [LAYER1-1:0];
    real delta221 [LAYER1-1:0]; real delta222 [LAYER1-1:0]; real delta223 [LAYER1-1:0]; real delta224 [LAYER1-1:0]; real delta225 [LAYER1-1:0];
    real delta226 [LAYER1-1:0]; real delta227 [LAYER1-1:0]; real delta228 [LAYER1-1:0]; real delta229 [LAYER1-1:0]; real delta230 [LAYER1-1:0];
    real delta231 [LAYER1-1:0];*/ real delta20 [LAYER1-1:0];    
    
    real  y2 [LAYER2-1:0] ; real  y2_nxt [LAYER2-1:0] ;
    
    //real delta3 [63:0];
    real delta31 [LAYER2-1:0]; real delta35 [LAYER2-1:0];
    real delta32 [LAYER2-1:0]; real delta36 [LAYER2-1:0];
    real delta33 [LAYER2-1:0]; real delta37 [LAYER2-1:0];
    real delta34 [LAYER2-1:0]; real delta38 [LAYER2-1:0];
           
    real y3_nxt[LAYER3-1:0]; real y3[LAYER3-1:0];
    real delta41 [LAYER2-1:0];
    real delta42 [LAYER2-1:0];
    real delta43 [LAYER2-1:0];
    real delta44 [LAYER2-1:0];
        
    real y4_nxt[LAYER3-1:0];

    real d3 [LAYER3-1:0]; real d2 [LAYER2-1:0]; real d1 [LAYER1-1:0];
    real d3_nxt [LAYER3-1:0]; real d2_nxt [LAYER2-1:0]; real d1_nxt [LAYER1-1:0];    

    int i;
    genvar g;


        
  /*  real w_global[ALL_LAYERS-1:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE,
                    0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,
                      -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,//22
                       0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE,
                       0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,
                       -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE}; //44       
        */
   /* 	localparam STATE_BITS = 4, // number of bits used for state register
                    ST_START = 4'b0001,
                    ST_L1IN = 4'b0000,
                    ST_L2IN = 4'b0010,
                    ST_L3IN = 4'b0011,
                    ST_L1BP = 4'b0111,
                    ST_L2BP = 4'b0101,
                    ST_L3BP = 4'b1001,
                    ST_STOP = 4'b1011;                   
                    
                reg [ STATE_BITS-1 : 0 ] state;
                reg [ STATE_BITS-1 : 0 ] state_nxt;*/

                
           enum {ST_START, ST_FORWARD, ST_L1IN,  ST_L2IN, ST_L3IN, ST_L4IN, ST_L1BP, ST_L2BP, ST_L3BP, ST_L4BP, ST_STOP} state = ST_STOP;
  
                
                
        always_ff @(posedge clk) begin: fsm
        
                case(state)
                
                ST_START: begin
                ready <= 1'b0;
                if (start == 1'b0) state <= ST_STOP;
                else begin state <= ST_L1IN;/*begin
                if (mode == 1) state <= ST_L1IN;
                else state <= ST_FORWARD;
                end */

                end end
                
                ST_L1IN: begin////// 
                state <= ST_L2IN;
                y1[LAYER1-1:0] = y1_nxt[LAYER1-1:0];
                end
                
                ST_L2IN: begin/////////
                y2[LAYER2-1:0] = y2_nxt[LAYER2-1:0];
                state <= ST_L3IN; // cont. waiting
                end
                
                ST_L3IN: begin/////////
                y3[LAYER3-1:0] = y3_nxt[LAYER3-1:0];
                state <= ST_L4IN; // cont. waiting
                end
                
                ST_L4IN: begin/////////
                y4[LAYER4-1:0] = y4_nxt[LAYER4-1:0];
                $display(" y43 = %f y42 = %f y41 = %f y40 = %f z = %b" ,  y4[3],y4[2],y4[1],y4[0],z_prev);
                if ( mode == 1'b1 ) begin
                state <= ST_L4BP;
                end else begin
                state <= ST_STOP; // cont. waiting
                end end

                ST_FORWARD: begin/////////////
                /*if ( mode == 1'b1 ) begin
                
                state <= ST_L3BP;
                end else begin*/
                state <= ST_STOP; // cont. waiting
                end// end

                ST_L4BP: begin
                mode4 <= 1;
                state <= ST_L3BP;
                end
                
                
                ST_L3BP: begin
                mode4 <= 0;
                mode3 <= 1;
                state <= ST_L2BP;
                end
                
                ST_L2BP: begin
                mode3<=0;
                mode2<=1;
                state <= ST_L1BP;
                end
                
                ST_L1BP: begin
                mode2<=0;
                mode1<=1;
                state <= ST_STOP;
                end
                                
                ST_STOP: begin   
                ready <= 1'b1;
                if(start == 1) state <= ST_START;
                else state <= ST_STOP;
                end
                endcase
                
         end: fsm
          
          
          
        always_comb begin
          case(state)
          ST_START:begin
          z_prev[3:0] = z[3:0];
          x1_prev[15:0] = x1[15:0];          
          end
          ST_L1IN: begin
          //x1_nxt <= x1;
          
          
          end
          ST_L2IN: begin
          //mul_start <= ~mul_ready;
          //mul_input0 <= scaling;
          //mul_input1 <= approxVal;
          
          end
          ST_L3IN: begin
          
          
          end
          
          ST_L3BP: begin
          d3[LAYER3-1] = d3_nxt[LAYER3-1];
          end
          
          ST_L2BP: begin

          d2[LAYER2-1] = d2_nxt[LAYER2-1];
          end
          
          ST_L1BP: begin

          d1[LAYER1-1] = d1_nxt[LAYER1-1];
          end
          
          ST_STOP: begin
          
          mode1 <= 0;
          end                    

         // end
          default: begin
          //mul_start <= 1'b0;
          end
          endcase
          end           
  always @* begin
         
  for(i=0;i<LAYER2;i++) d2_nxt[i] = delta31[i]+delta32[i]+delta33[i]+delta34[i]+delta35[i]+delta36[i]+delta37[i]+delta38[i];
  for(i=0;i<LAYER1;i++) d1_nxt[i] = delta21[i]+delta22[i]+delta23[i]+delta24[i]+delta25[i]+delta26[i]+delta27[i]+delta20[i]/*+delta29[i]+delta210[i]+delta211[i]+delta212[i]+delta213[i]
  +delta214[i]+delta215[i]+delta216[i]+delta217[i]+delta218[i]+delta219[i]+delta220[i]+delta221[i]+delta222[i]+delta223[i]+delta224[i]+delta225[i]+delta226[i]+delta227[i]
  +delta228[i]+delta229[i]+delta230[i]+delta231[i]*/;
  for(i=0;i<LAYER3;i++) d3_nxt[i] = delta41[i]+delta42[i]+delta43[i]+delta44[i];

  
  
  end
  //1 layer
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(-0.6), .LEARNING_RATE(LEARNING_RATE) ) n1_0(.x(x1_prev) ,.d(d1_nxt[0]), .rst(rst) , .clk(clk), .y(y1_nxt[0]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.8), .LEARNING_RATE(LEARNING_RATE) ) n1_1(.x(x1_prev) ,.d(d1_nxt[1]), .rst(rst) , .clk(clk), .y(y1_nxt[1]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.84), .LEARNING_RATE(LEARNING_RATE) ) n1_2(.x(x1_prev) ,.d(d1_nxt[2]), .rst(rst) , .clk(clk), .y(y1_nxt[2]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.64), .LEARNING_RATE(LEARNING_RATE) ) n1_3(.x(x1_prev) ,.d(d1_nxt[3]), .rst(rst) , .clk(clk), .y(y1_nxt[3]), .mode(mode1));  
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.72), .LEARNING_RATE(LEARNING_RATE) ) n1_4(.x(x1_prev) ,.d(d1_nxt[4]), .rst(rst) , .clk(clk), .y(y1_nxt[4]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(-0.3), .LEARNING_RATE(LEARNING_RATE) ) n1_5(.x(x1_prev) ,.d(d1_nxt[5]), .rst(rst) , .clk(clk), .y(y1_nxt[5]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.9), .LEARNING_RATE(LEARNING_RATE) ) n1_6(.x(x1_prev) ,.d(d1_nxt[6]), .rst(rst) , .clk(clk), .y(y1_nxt[6]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.4), .LEARNING_RATE(LEARNING_RATE) ) n1_7(.x(x1_prev) ,.d(d1_nxt[7]), .rst(rst) , .clk(clk), .y(y1_nxt[7]), .mode(mode1)); 
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.34), .LEARNING_RATE(LEARNING_RATE) ) n1_8(.x(x1_prev) ,.d(d1_nxt[8]), .rst(rst) , .clk(clk), .y(y1_nxt[8]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.757), .LEARNING_RATE(LEARNING_RATE) ) n1_9(.x(x1_prev) ,.d(d1_nxt[9]), .rst(rst) , .clk(clk), .y(y1_nxt[9]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.48), .LEARNING_RATE(LEARNING_RATE) ) n1_10(.x(x1_prev) ,.d(d1_nxt[10]), .rst(rst) , .clk(clk), .y(y1_nxt[10]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.53), .LEARNING_RATE(LEARNING_RATE) ) n1_11(.x(x1_prev) ,.d(d1_nxt[11]), .rst(rst) , .clk(clk), .y(y1_nxt[11]), .mode(mode1));  
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(-0.74), .LEARNING_RATE(LEARNING_RATE) ) n1_12(.x(x1_prev) ,.d(d1_nxt[12]), .rst(rst) , .clk(clk), .y(y1_nxt[12]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.83), .LEARNING_RATE(LEARNING_RATE) ) n1_13(.x(x1_prev) ,.d(d1_nxt[13]), .rst(rst) , .clk(clk), .y(y1_nxt[13]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(-0.93), .LEARNING_RATE(LEARNING_RATE) ) n1_14(.x(x1_prev) ,.d(d1_nxt[14]), .rst(rst) , .clk(clk), .y(y1_nxt[14]), .mode(mode1));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(0.912), .LEARNING_RATE(LEARNING_RATE) ) n1_15(.x(x1_prev) ,.d(d1_nxt[15]), .rst(rst) , .clk(clk), .y(y1_nxt[15]), .mode(mode1));         

        
// 2 layer        
        
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.89), .LEARNING_RATE(LEARNING_RATE) ) n2_0(.x(y1) ,.d(d2_nxt[0]), .rst(rst) , .clk(clk), .y(y2_nxt[0]), .mode(mode2), .g_delta(delta20));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_1(.x(y1) ,.d(d2_nxt[1]), .rst(rst) , .clk(clk), .y(y2_nxt[1]), .mode(mode2), .g_delta(delta21));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.46), .LEARNING_RATE(LEARNING_RATE) ) n2_2(.x(y1) ,.d(d2_nxt[2]), .rst(rst) , .clk(clk), .y(y2_nxt[2]), .mode(mode2), .g_delta(delta22));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.73), .LEARNING_RATE(LEARNING_RATE) ) n2_3(.x(y1) ,.d(d2_nxt[3]), .rst(rst) , .clk(clk), .y(y2_nxt[3]), .mode(mode2), .g_delta(delta23));  
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(-0.57), .LEARNING_RATE(LEARNING_RATE) ) n2_4(.x(y1) ,.d(d2_nxt[4]), .rst(rst) , .clk(clk), .y(y2_nxt[4]), .mode(mode2), .g_delta(delta24));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.95), .LEARNING_RATE(LEARNING_RATE) ) n2_5(.x(y1) ,.d(d2_nxt[5]), .rst(rst) , .clk(clk), .y(y2_nxt[5]), .mode(mode2), .g_delta(delta25));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.75), .LEARNING_RATE(LEARNING_RATE) ) n2_6(.x(y1) ,.d(d2_nxt[6]), .rst(rst) , .clk(clk), .y(y2_nxt[6]), .mode(mode2), .g_delta(delta26));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(-0.84), .LEARNING_RATE(LEARNING_RATE) ) n2_7(.x(y1) ,.d(d2_nxt[7]), .rst(rst) , .clk(clk), .y(y2_nxt[7]), .mode(mode2), .g_delta(delta27)); 
       /* neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.078), .LEARNING_RATE(LEARNING_RATE) ) n2_8(.x(y1) ,.d(d2_nxt[8]), .rst(rst) , .clk(clk), .y(y2_nxt[8]), .mode(mode2), .g_delta(delta28));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.8), .LEARNING_RATE(LEARNING_RATE) ) n2_9(.x(y1) ,.d(d2_nxt[9]), .rst(rst) , .clk(clk), .y(y2_nxt[9]), .mode(mode2), .g_delta(delta29));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.24), .LEARNING_RATE(LEARNING_RATE) ) n2_10(.x(y1) ,.d(d2_nxt[10]), .rst(rst) , .clk(clk), .y(y2_nxt[10]), .mode(mode2), .g_delta(delta210));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.74), .LEARNING_RATE(LEARNING_RATE) ) n2_11(.x(y1) ,.d(d2_nxt[11]), .rst(rst) , .clk(clk), .y(y2_nxt[11]), .mode(mode2), .g_delta(delta211));  
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.41), .LEARNING_RATE(LEARNING_RATE) ) n2_12(.x(y1) ,.d(d2_nxt[12]), .rst(rst) , .clk(clk), .y(y2_nxt[12]), .mode(mode2), .g_delta(delta212));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.35), .LEARNING_RATE(LEARNING_RATE) ) n2_13(.x(y1) ,.d(d2_nxt[13]), .rst(rst) , .clk(clk), .y(y2_nxt[13]), .mode(mode2), .g_delta(delta213));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.09), .LEARNING_RATE(LEARNING_RATE) ) n2_14(.x(y1) ,.d(d2_nxt[14]), .rst(rst) , .clk(clk), .y(y2_nxt[14]), .mode(mode2), .g_delta(delta214));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.081), .LEARNING_RATE(LEARNING_RATE) ) n2_15(.x(y1) ,.d(d2_nxt[15]), .rst(rst) , .clk(clk), .y(y2_nxt[15]), .mode(mode2), .g_delta(delta215)); 

      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.03), .LEARNING_RATE(LEARNING_RATE) ) n2_16(.x(y1) ,.d(d2_nxt[16]), .rst(rst) , .clk(clk), .y(y2_nxt[16]), .mode(mode2), .g_delta(delta216));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.18), .LEARNING_RATE(LEARNING_RATE) ) n2_17(.x(y1) ,.d(d2_nxt[17]), .rst(rst) , .clk(clk), .y(y2_nxt[17]), .mode(mode2), .g_delta(delta217));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.076), .LEARNING_RATE(LEARNING_RATE) ) n2_18(.x(y1) ,.d(d2_nxt[18]), .rst(rst) , .clk(clk), .y(y2_nxt[18]), .mode(mode2), .g_delta(delta218));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.56), .LEARNING_RATE(LEARNING_RATE) ) n2_19(.x(y1) ,.d(d2_nxt[19]), .rst(rst) , .clk(clk), .y(y2_nxt[19]), .mode(mode2), .g_delta(delta219));  
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.3467), .LEARNING_RATE(LEARNING_RATE) ) n2_20(.x(y1) ,.d(d2_nxt[20]), .rst(rst) , .clk(clk), .y(y2_nxt[20]), .mode(mode2), .g_delta(delta220));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.46), .LEARNING_RATE(LEARNING_RATE) ) n2_21(.x(y1) ,.d(d2_nxt[21]), .rst(rst) , .clk(clk), .y(y2_nxt[21]), .mode(mode2), .g_delta(delta221));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.477), .LEARNING_RATE(LEARNING_RATE) ) n2_22(.x(y1) ,.d(d2_nxt[22]), .rst(rst) , .clk(clk), .y(y2_nxt[22]), .mode(mode2), .g_delta(delta222));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.37), .LEARNING_RATE(LEARNING_RATE) ) n2_23(.x(y1) ,.d(d2_nxt[23]), .rst(rst) , .clk(clk), .y(y2_nxt[23]), .mode(mode2), .g_delta(delta223)); 
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.0568), .LEARNING_RATE(LEARNING_RATE) ) n2_24(.x(y1) ,.d(d2_nxt[24]), .rst(rst) , .clk(clk), .y(y2_nxt[24]), .mode(mode2), .g_delta(delta224));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.358), .LEARNING_RATE(LEARNING_RATE) ) n2_25(.x(y1) ,.d(d2_nxt[25]), .rst(rst) , .clk(clk), .y(y2_nxt[25]), .mode(mode2), .g_delta(delta225));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.246), .LEARNING_RATE(LEARNING_RATE) ) n2_26(.x(y1) ,.d(d2_nxt[26]), .rst(rst) , .clk(clk), .y(y2_nxt[26]), .mode(mode2), .g_delta(delta226));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.079), .LEARNING_RATE(LEARNING_RATE) ) n2_27(.x(y1) ,.d(d2_nxt[27]), .rst(rst) , .clk(clk), .y(y2_nxt[27]), .mode(mode2), .g_delta(delta227));  
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.63), .LEARNING_RATE(LEARNING_RATE) ) n2_28(.x(y1) ,.d(d2_nxt[28]), .rst(rst) , .clk(clk), .y(y2_nxt[28]), .mode(mode2), .g_delta(delta228));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.357), .LEARNING_RATE(LEARNING_RATE) ) n2_29(.x(y1) ,.d(d2_nxt[29]), .rst(rst) , .clk(clk), .y(y2_nxt[29]), .mode(mode2), .g_delta(delta229));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.597), .LEARNING_RATE(LEARNING_RATE) ) n2_30(.x(y1) ,.d(d2_nxt[30]), .rst(rst) , .clk(clk), .y(y2_nxt[30]), .mode(mode2), .g_delta(delta230));
      neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(0.22), .LEARNING_RATE(LEARNING_RATE) ) n2_31(.x(y1) ,.d(d2_nxt[31]), .rst(rst) , .clk(clk), .y(y2_nxt[31]), .mode(mode2), .g_delta(delta231));  
 */
//3 layer    
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(-0.89), .LEARNING_RATE(LEARNING_RATE) )n3_0(.x(y2) ,.d(d3_nxt[0]), .rst(rst) , .clk(clk), .y(y3_nxt[0]), .mode(mode3), .g_delta(delta31));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(0.97), .LEARNING_RATE(LEARNING_RATE) )n3_1(.x(y2) ,.d(d3_nxt[1]), .rst(rst) , .clk(clk), .y(y3_nxt[1]), .mode(mode3), .g_delta(delta32));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(0.77), .LEARNING_RATE(LEARNING_RATE) )n3_2(.x(y2) ,.d(d3_nxt[2]), .rst(rst) , .clk(clk), .y(y3_nxt[2]), .mode(mode3), .g_delta(delta33));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(-0.66), .LEARNING_RATE(LEARNING_RATE) )n3_3(.x(y2) ,.d(d3_nxt[3]), .rst(rst) , .clk(clk), .y(y3_nxt[3]), .mode(mode3), .g_delta(delta34));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(0.69), .LEARNING_RATE(LEARNING_RATE) )n3_4(.x(y2) ,.d(d3_nxt[4]), .rst(rst) , .clk(clk), .y(y3_nxt[4]), .mode(mode3), .g_delta(delta35));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(0.597), .LEARNING_RATE(LEARNING_RATE) )n3_5(.x(y2) ,.d(d3_nxt[5]), .rst(rst) , .clk(clk), .y(y3_nxt[5]), .mode(mode3), .g_delta(delta36));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(0.877), .LEARNING_RATE(LEARNING_RATE) )n3_6(.x(y2) ,.d(d3_nxt[6]), .rst(rst) , .clk(clk), .y(y3_nxt[6]), .mode(mode3), .g_delta(delta37));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(0.366), .LEARNING_RATE(LEARNING_RATE) )n3_7(.x(y2) ,.d(d3_nxt[7]), .rst(rst) , .clk(clk), .y(y3_nxt[7]), .mode(mode3), .g_delta(delta38));
        
        
//layer4        
          
        neuron_layer4 # (.LAYER4(LAYER3), .FXP_SCALE(0.59), .LEARNING_RATE(LEARNING_RATE) )n4_0(.x(y3) ,.z(z_prev[0]), .rst(rst) , .clk(clk), .y(y4_nxt[0]), .mode(mode4), .g_delta(delta41));
        neuron_layer4 # (.LAYER4(LAYER3), .FXP_SCALE(0.67), .LEARNING_RATE(LEARNING_RATE) )n4_1(.x(y3) ,.z(z_prev[1]), .rst(rst) , .clk(clk), .y(y4_nxt[1]), .mode(mode4), .g_delta(delta42));
        neuron_layer4 # (.LAYER4(LAYER3), .FXP_SCALE(0.57), .LEARNING_RATE(LEARNING_RATE) )n4_2(.x(y3) ,.z(z_prev[2]), .rst(rst) , .clk(clk), .y(y4_nxt[2]), .mode(mode4), .g_delta(delta43));
        neuron_layer4 # (.LAYER4(LAYER3), .FXP_SCALE(0.76), .LEARNING_RATE(LEARNING_RATE) )n4_3(.x(y3) ,.z(z_prev[3]), .rst(rst) , .clk(clk), .y(y4_nxt[3]), .mode(mode4), .g_delta(delta44));         
          
          
          
               
      /*  
        
        wire [LAYER1-1:0] y1;
        genvar i;
        //generate
        for(i=0;i<LAYER1;i++)begin
        neuron_layer1 # (.LAYER1(LAYER1)) n1_[i](.x(x1) ,.z(z), .rst(rst) , .clk(clk), .y(y1[i]), .mode(mode), .w_l1(w_global[ALL_LAYERS-1:ALL_LAYERS-LAYER0]));
        end
        //endgenerate
        
        //generate
        for(i=0;i<LAYER2;i++)begin
        neuron_layer2 # (.LAYER2(LAYER2))n2_[i](.x(y1) ,.z(z), .rst(rst) , .clk(clk), .y(y2[i]), .mode(mode), .w_l2(w_global[ALL_LAYERS-LAYER0-1:ALL_LAYERS-LAYER0-LAYER1]));
        end
        //endgenerate
        
        
        generate
        for(g=0;g<LAYER3;g++)begin
        neuron_layer3 #( .LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) )n3_0(.x(y2) ,.z(z_prev), .rst(rst) , .clk(clk), .y(y3_nxt[g]), .mode(mode3), .g_delta(delta3[16*g+15:15*g]));
        end
        endgenerate  
        
        */
        
                      
endmodule
