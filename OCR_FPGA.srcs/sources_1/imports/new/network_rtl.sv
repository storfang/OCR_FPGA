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


module network_rtl(

 //input logic start,
 //output logic ready,

    input wire [15:0] x1,
    input wire [3:0] z,
    input wire rst,
    input wire clk,
    input wire mode,
    input wire start,
    output reg ready,
    output reg [79:0] y4
    );
    
    parameter LAYER0 = 16;
    parameter LAYER1 = 16;
    parameter LAYER2 = 8;
    parameter LAYER3 = 8;
    parameter LAYER4 = 4;
    parameter ALL_LAYERS = LAYER0+LAYER1+LAYER2+LAYER3+LAYER4;
    parameter FXP_SCALE = 16384;
    parameter FXP_SHIFT = 14;
    parameter signed [15:0] LEARNING_RATE = 0.2*FXP_SCALE; 
    
    reg mode1; reg mode2; reg mode3; reg mode4;
    
    reg [LAYER0-1:0] x1_prev;
    reg [LAYER4-1:0] z_prev;
    
    reg signed [19:0]  y1 [LAYER1-1:0] ; reg signed [19:0]  y1_nxt [LAYER1-1:0] ;
    
    reg signed [19:0] delta21 [LAYER1-1:0]; reg signed [19:0] delta22 [LAYER1-1:0];
    reg signed [19:0] delta23 [LAYER1-1:0]; reg signed [19:0] delta24 [LAYER1-1:0];
    reg signed [19:0] delta25 [LAYER1-1:0]; reg signed [19:0] delta26 [LAYER1-1:0];
    reg signed [19:0] delta27 [LAYER1-1:0]; reg signed [19:0] delta20 [LAYER1-1:0];    
    
    reg signed [19:0]  y2 [LAYER2-1:0] ; reg signed [19:0]  y2_nxt [LAYER2-1:0] ;

    reg signed [19:0] delta31 [LAYER2-1:0]; reg signed [19:0] delta35 [LAYER2-1:0];
    reg signed [19:0] delta32 [LAYER2-1:0]; reg signed [19:0] delta36 [LAYER2-1:0];
    reg signed [19:0] delta33 [LAYER2-1:0]; reg signed [19:0] delta37 [LAYER2-1:0];
    reg signed [19:0] delta34 [LAYER2-1:0]; reg signed [19:0] delta38 [LAYER2-1:0];
           
    reg signed [19:0] y3_nxt[LAYER3-1:0]; reg signed [19:0] y3[LAYER3-1:0];
    reg signed [19:0] delta41 [LAYER3-1:0];
    reg signed [19:0] delta42 [LAYER3-1:0];
    reg signed [19:0] delta43 [LAYER3-1:0];
    reg signed [19:0] delta44 [LAYER3-1:0];
        
    reg signed [79:0] y4_nxt;
    real y43; real y42; real y41; real y40;

    reg signed [19:0] d3 [LAYER3-1:0]; reg signed [19:0] d2 [LAYER2-1:0]; reg signed [19:0] d1 [LAYER1-1:0];
    reg signed [19:0] d3_nxt [LAYER3-1:0]; reg signed [19:0] d2_nxt [LAYER2-1:0]; reg signed [19:0] d1_nxt [LAYER1-1:0];    

    int i;
    //genvar g;


        
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

                
           typedef enum {ST_START, ST_FORWARD, ST_L1IN,  ST_L2IN, ST_L3IN, ST_L4IN, ST_L1BP, ST_L2BP, ST_L3BP, ST_L4BP, ST_STOP} state_td;
            state_td state = ST_STOP; state_td  state_nxt = ST_L2IN;
                
                
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
                state_nxt <= ST_L3IN; // cont. waiting
                state <=state_nxt;
                end
                
                ST_L3IN: begin/////////
                y3[LAYER3-1:0] = y3_nxt[LAYER3-1:0];
                state_nxt <= ST_L4IN; // cont. waiting
                state <=state_nxt;
                end
                
                ST_L4IN: begin/////////
                y4[79:0] = y4_nxt[79:0];
                //y43 = real'(y4[79:60])/FXP_SCALE; y42 = real'(y4[59:40])/FXP_SCALE; 
                //y41 = real'(y4[39:20])/FXP_SCALE; y40 = real'(y4[19:0])/FXP_SCALE;
                //$display("in y43 = %f y42 = %f y41 = %f y40 = %f z = %b" ,  y43,y42,y41,y40,z_prev);
                if ( mode == 1'b1 ) begin
                state_nxt <= ST_L4BP;
                state <=state_nxt;
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
                state_nxt <= ST_L2IN;
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
          
          
          end
          ST_L2IN: begin

          
          end
          ST_L3IN: begin
          
          
          end
          
          ST_L3BP: begin
          d3 = d3_nxt;
          end
          
          ST_L2BP: begin

          d2 = d2_nxt;
          end
          
          ST_L1BP: begin

          d1 = d1_nxt;
          end
          
          ST_STOP: begin
          
          mode1 <= 0;
          end                    

         // end
          default: begin

          end
          endcase
          end           
  always @* begin
         
  for(i=0;i<LAYER2;i++) d2_nxt[i] = delta31[i]+delta32[i]+delta33[i]+delta34[i]+delta35[i]+delta36[i]+delta37[i]+delta38[i];
  for(i=0;i<LAYER1;i++) d1_nxt[i] = delta21[i]+delta22[i]+delta23[i]+delta24[i]+delta25[i]+delta26[i]+delta27[i]+delta20[i];
  for(i=0;i<LAYER3;i++) d3_nxt[i] = delta41[i]+delta42[i]+delta43[i]+delta44[i];

  
  
  end
  //1 layer
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.16), .LEARNING_RATE(LEARNING_RATE) ) n1_0(.x(x1_prev) ,.d(d1_nxt[0]), .rst(rst) , .clk(clk), .y(y1_nxt[0]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.8), .LEARNING_RATE(LEARNING_RATE) ) n1_1(.x(x1_prev) ,.d(d1_nxt[1]), .rst(rst) , .clk(clk), .y(y1_nxt[1]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.84), .LEARNING_RATE(LEARNING_RATE) ) n1_2(.x(x1_prev) ,.d(d1_nxt[2]), .rst(rst) , .clk(clk), .y(y1_nxt[2]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.64), .LEARNING_RATE(LEARNING_RATE) ) n1_3(.x(x1_prev) ,.d(d1_nxt[3]), .rst(rst) , .clk(clk), .y(y1_nxt[3]), .mode(mode1));  
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.72), .LEARNING_RATE(LEARNING_RATE) ) n1_4(.x(x1_prev) ,.d(d1_nxt[4]), .rst(rst) , .clk(clk), .y(y1_nxt[4]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.3), .LEARNING_RATE(LEARNING_RATE) ) n1_5(.x(x1_prev) ,.d(d1_nxt[5]), .rst(rst) , .clk(clk), .y(y1_nxt[5]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.9), .LEARNING_RATE(LEARNING_RATE) ) n1_6(.x(x1_prev) ,.d(d1_nxt[6]), .rst(rst) , .clk(clk), .y(y1_nxt[6]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.4), .LEARNING_RATE(LEARNING_RATE) ) n1_7(.x(x1_prev) ,.d(d1_nxt[7]), .rst(rst) , .clk(clk), .y(y1_nxt[7]), .mode(mode1)); 
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.34), .LEARNING_RATE(LEARNING_RATE) ) n1_8(.x(x1_prev) ,.d(d1_nxt[8]), .rst(rst) , .clk(clk), .y(y1_nxt[8]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.757), .LEARNING_RATE(LEARNING_RATE) ) n1_9(.x(x1_prev) ,.d(d1_nxt[9]), .rst(rst) , .clk(clk), .y(y1_nxt[9]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.48), .LEARNING_RATE(LEARNING_RATE) ) n1_10(.x(x1_prev) ,.d(d1_nxt[10]), .rst(rst) , .clk(clk), .y(y1_nxt[10]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.53), .LEARNING_RATE(LEARNING_RATE) ) n1_11(.x(x1_prev) ,.d(d1_nxt[11]), .rst(rst) , .clk(clk), .y(y1_nxt[11]), .mode(mode1));  
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.174), .LEARNING_RATE(LEARNING_RATE) ) n1_12(.x(x1_prev) ,.d(d1_nxt[12]), .rst(rst) , .clk(clk), .y(y1_nxt[12]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.83), .LEARNING_RATE(LEARNING_RATE) ) n1_13(.x(x1_prev) ,.d(d1_nxt[13]), .rst(rst) , .clk(clk), .y(y1_nxt[13]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.13), .LEARNING_RATE(LEARNING_RATE) ) n1_14(.x(x1_prev) ,.d(d1_nxt[14]), .rst(rst) , .clk(clk), .y(y1_nxt[14]), .mode(mode1));
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.912), .LEARNING_RATE(LEARNING_RATE) ) n1_15(.x(x1_prev) ,.d(d1_nxt[15]), .rst(rst) , .clk(clk), .y(y1_nxt[15]), .mode(mode1));         
        
// 2 layer               
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.89), .LEARNING_RATE(LEARNING_RATE) ) n2_0(.x(y1) ,.d(d2_nxt[0]), .rst(rst) , .clk(clk), .y(y2_nxt[0]), .mode(mode2), .g_delta(delta20));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(1), .LEARNING_RATE(LEARNING_RATE) ) n2_1(.x(y1) ,.d(d2_nxt[1]), .rst(rst) , .clk(clk), .y(y2_nxt[1]), .mode(mode2), .g_delta(delta21));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.46), .LEARNING_RATE(LEARNING_RATE) ) n2_2(.x(y1) ,.d(d2_nxt[2]), .rst(rst) , .clk(clk), .y(y2_nxt[2]), .mode(mode2), .g_delta(delta22));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.73), .LEARNING_RATE(LEARNING_RATE) ) n2_3(.x(y1) ,.d(d2_nxt[3]), .rst(rst) , .clk(clk), .y(y2_nxt[3]), .mode(mode2), .g_delta(delta23));  
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.257), .LEARNING_RATE(LEARNING_RATE) ) n2_4(.x(y1) ,.d(d2_nxt[4]), .rst(rst) , .clk(clk), .y(y2_nxt[4]), .mode(mode2), .g_delta(delta24));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.95), .LEARNING_RATE(LEARNING_RATE) ) n2_5(.x(y1) ,.d(d2_nxt[5]), .rst(rst) , .clk(clk), .y(y2_nxt[5]), .mode(mode2), .g_delta(delta25));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.75), .LEARNING_RATE(LEARNING_RATE) ) n2_6(.x(y1) ,.d(d2_nxt[6]), .rst(rst) , .clk(clk), .y(y2_nxt[6]), .mode(mode2), .g_delta(delta26));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.384), .LEARNING_RATE(LEARNING_RATE) ) n2_7(.x(y1) ,.d(d2_nxt[7]), .rst(rst) , .clk(clk), .y(y2_nxt[7]), .mode(mode2), .g_delta(delta27)); 

//3 layer    
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.89), .LEARNING_RATE(LEARNING_RATE) )n3_0(.x(y2) ,.d(d3_nxt[0]), .rst(rst) , .clk(clk), .y(y3_nxt[0]), .mode(mode3), .g_delta(delta31));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.97), .LEARNING_RATE(LEARNING_RATE) )n3_1(.x(y2) ,.d(d3_nxt[1]), .rst(rst) , .clk(clk), .y(y3_nxt[1]), .mode(mode3), .g_delta(delta32));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.77), .LEARNING_RATE(LEARNING_RATE) )n3_2(.x(y2) ,.d(d3_nxt[2]), .rst(rst) , .clk(clk), .y(y3_nxt[2]), .mode(mode3), .g_delta(delta33));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.66), .LEARNING_RATE(LEARNING_RATE) )n3_3(.x(y2) ,.d(d3_nxt[3]), .rst(rst) , .clk(clk), .y(y3_nxt[3]), .mode(mode3), .g_delta(delta34));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.69), .LEARNING_RATE(LEARNING_RATE) )n3_4(.x(y2) ,.d(d3_nxt[4]), .rst(rst) , .clk(clk), .y(y3_nxt[4]), .mode(mode3), .g_delta(delta35));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.597), .LEARNING_RATE(LEARNING_RATE) )n3_5(.x(y2) ,.d(d3_nxt[5]), .rst(rst) , .clk(clk), .y(y3_nxt[5]), .mode(mode3), .g_delta(delta36));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.877), .LEARNING_RATE(LEARNING_RATE) )n3_6(.x(y2) ,.d(d3_nxt[6]), .rst(rst) , .clk(clk), .y(y3_nxt[6]), .mode(mode3), .g_delta(delta37));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.366), .LEARNING_RATE(LEARNING_RATE) )n3_7(.x(y2) ,.d(d3_nxt[7]), .rst(rst) , .clk(clk), .y(y3_nxt[7]), .mode(mode3), .g_delta(delta38));
               
//layer4                 
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.59), .LEARNING_RATE(LEARNING_RATE) )n4_0(.x(y3) ,.z(z_prev[0]), .rst(rst) , .clk(clk), .y(y4_nxt[19:0]), .mode(mode4), .g_delta(delta41));
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.67), .LEARNING_RATE(LEARNING_RATE) )n4_1(.x(y3) ,.z(z_prev[1]), .rst(rst) , .clk(clk), .y(y4_nxt[39:20]), .mode(mode4), .g_delta(delta42));
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.57), .LEARNING_RATE(LEARNING_RATE) )n4_2(.x(y3) ,.z(z_prev[2]), .rst(rst) , .clk(clk), .y(y4_nxt[59:40]), .mode(mode4), .g_delta(delta43));
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.76), .LEARNING_RATE(LEARNING_RATE) )n4_3(.x(y3) ,.z(z_prev[3]), .rst(rst) , .clk(clk), .y(y4_nxt[79:60]), .mode(mode4), .g_delta(delta44));         
          
          
          
               
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
