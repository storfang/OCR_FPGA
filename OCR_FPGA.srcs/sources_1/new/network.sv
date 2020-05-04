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

    input wire [3:0] x1,
    input wire [3:0] z,
    input wire rst,
    input wire clk,
    input wire mode,
    input wire start,
    output reg ready,
    output real  y3[3:0]
    );
    reg [3:0] z_prev;
    reg [3:0] x1_prev;
        real  y2 [15:0] ;
        real  y1 [7:0] ;
        real  y2_nxt [15:0] ;
        real  y1_nxt [7:0] ;
        wire [11:0] x3;
reg [15:0] x1_nxt;
    real delta31 [15:0];
    real delta32 [15:0];
    real delta33 [15:0];
    real delta34 [15:0];
    real d2 [15:0];
    real d1 [3:0];
    real d2_nxt [15:0];
    real d1_nxt [3:0];    
    
    real delta21 [7:0];
    real delta22 [7:0];
    real delta23 [7:0];
    real delta24 [7:0];
    real delta25 [7:0];
    real delta26 [7:0];
    real delta27 [7:0];
    real delta28 [7:0];
    real delta29 [7:0];
    real delta210 [7:0];
    real delta211 [7:0];
    real delta212 [7:0];
    real delta213 [7:0];
    real delta214 [7:0];
    real delta215 [7:0];
    real delta20 [7:0];
    int i;

        parameter LAYER0 = 16;
        parameter LAYER1 = 8;
        parameter LAYER2 = 16;
        parameter LAYER3 = 4;
        parameter ALL_LAYERS = LAYER0+LAYER1+LAYER2+LAYER3;
        parameter integer FXP_SCALE = 1;
        parameter LEARNING_RATE = 0.0001*FXP_SCALE; 
        
    real w_global[ALL_LAYERS-1:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE,
                    0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,
                      -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,//22
                       0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE,
                       0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,
                       -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE}; //44       
        
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

                
           enum {ST_START, ST_FORWARD, ST_L1IN,  ST_L2IN, ST_L3IN, ST_L1BP, ST_L2BP, ST_L3BP, ST_STOP} state = ST_STOP;
  
                
                
        always_ff @(posedge clk) begin: fsm
        
                case(state)
                
                ST_START: begin
                ready <= 1'b0;
                if (start == 1'b0) state <= ST_STOP;
                else state <= ST_L1IN;/*begin
                if (mode == 1) state <= ST_L1IN;
                else state <= ST_FORWARD;
                end */end
                
                ST_L1IN: begin////// 
                state <= ST_L2IN;
                end
                
                ST_L2IN: begin/////////
                state <= ST_L3IN; // cont. waiting
                end
                
                ST_L3IN: begin/////////
                if ( mode == 1'b1 ) begin
                state <= ST_L3BP;
                end else begin
                state <= ST_STOP; // cont. waiting
                end end

                ST_FORWARD: begin/////////////
                /*if ( mode == 1'b1 ) begin
                
                state <= ST_L3BP;
                end else begin*/
                state <= ST_STOP; // cont. waiting
                end// end


                ST_L3BP: begin

                state <= ST_L2BP;
                end
                
                ST_L2BP: begin

                state <= ST_L1BP;
                end
                
                ST_L1BP: begin

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
          z_prev <= z;
          x1_prev <= x1;
          end
          ST_L1IN: begin
          //x1_nxt <= x1;
          
          y1[7:0] = y1_nxt[7:0];
          end
          ST_L2IN: begin
          //mul_start <= ~mul_ready;
          //mul_input0 <= scaling;
          //mul_input1 <= approxVal;
          y2[7:0] = y2_nxt[7:0];
          end
          ST_L3IN: begin

          end
          
          ST_L3BP: begin
          d2[15:0] = d2_nxt[15:0];
          end
          
          ST_L2BP: begin
          d1[15:0] = d1_nxt[15:0];
          end
          
          ST_L1BP: begin
          
          end
          
          ST_STOP: begin
          $display(" y3 = %f" , y3[0]);
          //mul_input1 <= ?????;
          end                    

         // end
          default: begin
          //mul_start <= 1'b0;
          end
          endcase
          end           
  always @* begin
         
  for(i=0;i<LAYER2;i++) d2[i] = delta31[i]+delta32[i]+delta33[i]+delta34[i];
  for(i=0;i<LAYER1;i++) d1[i] = delta21[i]+delta22[i]+delta23[i]+delta24[i]+delta25[i]+delta26[i]+delta27[i]+delta28[i]+delta29[i]+delta210[i]+delta211[i]+delta212[i]+delta213[i]+delta214[i]+delta215[i];
  //for(i=0;i<LAYER0;i++) d2[i] = delta31[i]+delta32[i]+delta33[i]+delta34[i];

  
  
  end
  //1 layer
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_0(.x(x1_prev) ,.d(d1_nxt[0]), .rst(rst) , .clk(clk), .y(y1_nxt[0]), .mode(mode));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_1(.x(x1_prev) ,.d(d1_nxt[1]), .rst(rst) , .clk(clk), .y(y1_nxt[1]), .mode(mode));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_2(.x(x1_prev) ,.d(d1_nxt[2]), .rst(rst) , .clk(clk), .y(y1_nxt[2]), .mode(mode));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_3(.x(x1_prev) ,.d(d1_nxt[3]), .rst(rst) , .clk(clk), .y(y1_nxt[3]), .mode(mode));  
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_4(.x(x1_prev) ,.d(d1_nxt[4]), .rst(rst) , .clk(clk), .y(y1_nxt[4]), .mode(mode));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_5(.x(x1_prev) ,.d(d1_nxt[5]), .rst(rst) , .clk(clk), .y(y1_nxt[5]), .mode(mode));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_6(.x(x1_prev) ,.d(d1_nxt[6]), .rst(rst) , .clk(clk), .y(y1_nxt[6]), .mode(mode));
        neuron_layer1 # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n1_7(.x(x1_prev) ,.d(d1_nxt[7]), .rst(rst) , .clk(clk), .y(y1_nxt[7]), .mode(mode)); 
        

        
// 2 layer        
        
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_0(.x(y1) ,.d(d2_nxt[0]), .rst(rst) , .clk(clk), .y(y2_nxt[0]), .mode(mode), .g_delta(delta20));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_1(.x(y1) ,.d(d2_nxt[1]), .rst(rst) , .clk(clk), .y(y2_nxt[1]), .mode(mode), .g_delta(delta21));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_2(.x(y1) ,.d(d2_nxt[2]), .rst(rst) , .clk(clk), .y(y2_nxt[2]), .mode(mode), .g_delta(delta22));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_3(.x(y1) ,.d(d2_nxt[3]), .rst(rst) , .clk(clk), .y(y2_nxt[3]), .mode(mode), .g_delta(delta23));  
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_4(.x(y1) ,.d(d2_nxt[4]), .rst(rst) , .clk(clk), .y(y2_nxt[4]), .mode(mode), .g_delta(delta24));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_5(.x(y1) ,.d(d2_nxt[5]), .rst(rst) , .clk(clk), .y(y2_nxt[5]), .mode(mode), .g_delta(delta25));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_6(.x(y1) ,.d(d2_nxt[6]), .rst(rst) , .clk(clk), .y(y2_nxt[6]), .mode(mode), .g_delta(delta26));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_7(.x(y1) ,.d(d2_nxt[7]), .rst(rst) , .clk(clk), .y(y2_nxt[7]), .mode(mode), .g_delta(delta27)); 
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_8(.x(y1) ,.d(d2_nxt[8]), .rst(rst) , .clk(clk), .y(y2_nxt[8]), .mode(mode), .g_delta(delta28));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_9(.x(y1) ,.d(d2_nxt[9]), .rst(rst) , .clk(clk), .y(y2_nxt[9]), .mode(mode), .g_delta(delta29));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_10(.x(y1) ,.d(d2_nxt[10]), .rst(rst) , .clk(clk), .y(y2_nxt[10]), .mode(mode), .g_delta(delta210));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_11(.x(y1) ,.d(d2_nxt[11]), .rst(rst) , .clk(clk), .y(y2_nxt[11]), .mode(mode), .g_delta(delta211));  
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_12(.x(y1) ,.d(d2_nxt[12]), .rst(rst) , .clk(clk), .y(y2_nxt[12]), .mode(mode), .g_delta(delta212));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_13(.x(y1) ,.d(d2_nxt[13]), .rst(rst) , .clk(clk), .y(y2_nxt[13]), .mode(mode), .g_delta(delta213));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_14(.x(y1) ,.d(d2_nxt[14]), .rst(rst) , .clk(clk), .y(y2_nxt[14]), .mode(mode), .g_delta(delta214));
        neuron_layer2 # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) ) n2_15(.x(y1) ,.d(d2_nxt[15]), .rst(rst) , .clk(clk), .y(y2_nxt[15]), .mode(mode), .g_delta(delta215)); 
        
 
//3 layer    
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) )n3_0(.x(y2) ,.z(z_prev), .rst(rst) , .clk(clk), .y(y3[0]), .mode(mode), .g_delta(delta31));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) )n3_1(.x(y2) ,.z(z_prev), .rst(rst) , .clk(clk), .y(y3[1]), .mode(mode), .g_delta(delta32));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) )n3_2(.x(y2) ,.z(z_prev), .rst(rst) , .clk(clk), .y(y3[2]), .mode(mode), .g_delta(delta33));
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) )n3_3(.x(y2) ,.z(z_prev), .rst(rst) , .clk(clk), .y(y3[3]), .mode(mode), .g_delta(delta34));

        
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
        
        //generate
        for(i=0;i<LAYER3;i++)begin
        neuron_layer3 # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .LEARNING_RATE(LEARNING_RATE) )n3_[i](.x(y2) ,.z(z), .rst(rst) , .clk(clk), .y(y3[i]), .mode(mode), .w_l3(w_global[ALL_LAYERS-LAYER0-LAYER1-1:ALL_LAYERS-LAYER0-LAYER1-LAYER2]));
        end
        //endgenerate  
        
        */
        
                      
endmodule
