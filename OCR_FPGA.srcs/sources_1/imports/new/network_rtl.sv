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
    output reg [71:0] y4
    );
    
    parameter LAYER0 = 16;
    parameter LAYER1 = 16;
    parameter LAYER2 = 8;
    parameter LAYER3 = 8;
    parameter LAYER4 = 4;
    parameter ALL_LAYERS = LAYER0+LAYER1+LAYER2+LAYER3+LAYER4;
    parameter FXP_SCALE = 8192*2;
    parameter FXP_SHIFT = 14;
    parameter signed [15:0] LEARNING_RATE = 0.25*FXP_SCALE; 
    
    reg[1:0] mode1=2'b00; reg[1:0] mode2=2'b00; reg[1:0] mode3=2'b00; reg[1:0] mode4=2'b00;
    reg [1:0] ctrl1; reg[1:0] ctrl2; reg[1:0] ctrl3; reg[1:0] ctrl4;
    
    reg [LAYER0-1:0] x1_prev;
    reg [LAYER4-1:0] z_prev;
    
    reg signed [17:0]  y1 [LAYER1-1:0] ; reg signed [17:0]  y1_nxt [LAYER1-1:0] ;
    
    reg signed [17:0] delta21 [LAYER1-1:0]; reg signed [17:0] delta22 [LAYER1-1:0];
    reg signed [17:0] delta23 [LAYER1-1:0]; reg signed [17:0] delta24 [LAYER1-1:0];
    reg signed [17:0] delta25 [LAYER1-1:0]; reg signed [17:0] delta26 [LAYER1-1:0];
    reg signed [17:0] delta27 [LAYER1-1:0]; reg signed [17:0] delta20 [LAYER1-1:0];    
    
    reg signed [17:0]  y2 [LAYER2-1:0] ; reg signed [17:0]  y2_nxt [LAYER2-1:0] ;

    reg signed [17:0] delta31 [LAYER2-1:0]; reg signed [17:0] delta35 [LAYER2-1:0];
    reg signed [17:0] delta32 [LAYER2-1:0]; reg signed [17:0] delta36 [LAYER2-1:0];
    reg signed [17:0] delta33 [LAYER2-1:0]; reg signed [17:0] delta37 [LAYER2-1:0];
    reg signed [17:0] delta34 [LAYER2-1:0]; reg signed [17:0] delta38 [LAYER2-1:0];
           
    reg signed [17:0] y3_nxt[LAYER3-1:0]; reg signed [17:0] y3[LAYER3-1:0];
    reg signed [17:0] delta41 [LAYER3-1:0];
    reg signed [17:0] delta42 [LAYER3-1:0];
    reg signed [17:0] delta43 [LAYER3-1:0];
    reg signed [17:0] delta44 [LAYER3-1:0];
        
    reg signed [71:0] y4_nxt;
    real y43; real y42; real y41; real y40;

    reg signed [17:0] d3 [LAYER3-1:0]; reg signed [17:0] d2 [LAYER2-1:0]; reg signed [17:0] d1 [LAYER1-1:0];
    reg signed [17:0] d3_nxt [LAYER3-1:0]; reg signed [17:0] d2_nxt [LAYER2-1:0]; reg signed [17:0] d1_nxt [LAYER1-1:0];    

    int i; reg[4:0] p; int ic;
    
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

                
           typedef enum {ST_START, ST_FORWARD, ST_L1IN,  ST_L2IN, ST_L3IN, ST_L4IN, ST_L1BP, ST_L2BP, ST_L3BP, ST_L4BP, ST_STOP, ST_WAIT} state_td;
            state_td state = ST_STOP; state_td  state_nxt = ST_L2IN;
                
                
        always_ff @(posedge clk) begin: fsm
        
            
        
                case(state)
                
                ST_START: begin
                ready <= 1'b0;
                if (start == 1'b0) state <= ST_STOP;
                else begin state <= ST_L1IN;
                //state_nxt <= ST_L2IN;
                /*begin
                if (mode == 1) state <= ST_L1IN;
                else state <= ST_FORWARD;
                end */ //p<=0;
                mode1<=2'b01;
                //ic=30; 
                end end
                
                ST_WAIT:begin
                if(p==ic) begin state <=state_nxt; end
                else state <= ST_WAIT;
                p<=p+1;
                end
                
                ST_L1IN: begin//////
                if(ctrl1==2'b01)begin state <= ST_L2IN; 
                y1[LAYER1-1:0] <= y1_nxt[LAYER1-1:0]; mode2 <=2'b01;mode1 <=2'b00;end
                else state <= ST_L1IN;
                end
                
                ST_L2IN: begin/////////
                if(ctrl2==2'b01)begin state <= ST_L3IN; 
                y2[LAYER2-1:0] <= y2_nxt[LAYER2-1:0]; mode3 <=2'b01;mode2 <=2'b00;end
                else state <= ST_L2IN;
                end
                
                ST_L3IN: begin/////////
                if(ctrl3==2'b01)begin state <= ST_L4IN; 
                y3[LAYER3-1:0] <= y3_nxt[LAYER3-1:0]; mode4 <=2'b01;mode3 <=2'b00;end
                else state <= ST_L3IN;
                end
                
                ST_L4IN: begin/////////
                if(ctrl4==2'b01)begin 
                    if(mode==1) begin state <= ST_L4BP; mode4 <=2'b10;end
                    else begin state <= ST_STOP; mode4 <=2'b00;end
                y4[71:0] <= y4_nxt[71:0]; end
                else state <= ST_L4IN;
                end

                ST_FORWARD: begin/////////////
                /*if ( mode == 1'b1 ) begin
                
                state <= ST_L3BP;
                end else begin*/
                state <= ST_STOP; // cont. waiting
                end// end

                ST_L4BP: begin
                if(ctrl4==2'b10)begin state <= ST_L3BP; 
                mode4 <=2'b00;mode3 <=2'b10;end
                else state <= ST_L4BP;                
                end
                
                
                ST_L3BP: begin
                if(ctrl3==2'b10)begin state <= ST_L2BP; 
                mode3 <=2'b00;mode2 <=2'b10;end
                else state <= ST_L3BP;
                end
                
                ST_L2BP: begin
                if(ctrl2==2'b10)begin state <= ST_L1BP; 
                mode2 <=2'b00;mode1 <=2'b10;end
                else state <= ST_L2BP;
                end
                
                ST_L1BP: begin
                if(ctrl1==2'b10)begin state <= ST_STOP; 
                mode1 <=2'b00;end
                else state <= ST_L1BP;
                end
                                
                ST_STOP: begin  
                //y43 = real'(y4[71:54])/FXP_SCALE; y42 = real'(y4[53:36])/FXP_SCALE; 
                //y41 = real'(y4[35:18])/FXP_SCALE; y40 = real'(y4[17:0])/FXP_SCALE;
                //$display("in y43 = %f y42 = %f y41 = %f y40 = %f z = %b x=%h" ,  y43,y42,y41,y40,z_prev,x1_prev);               
                 
                ready <= 1'b1;
                //mode1 <= 0;
                //state_nxt <= ST_L2IN;
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
          
          ST_L4IN: begin
 
          end
          
          ST_L4BP: begin
 
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
        neuron_layer1_rtl # (.LAYER1(LAYER0), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.16), .LEARNING_RATE(LEARNING_RATE) ) n1_0(.x(x1_prev) ,.d(d1_nxt[0]), .rst(rst) , .clk(clk), .y(y1_nxt[0]), .mode(mode1), .ctrl(ctrl1));
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
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.89), .LEARNING_RATE(LEARNING_RATE) ) n2_0(.x(y1) ,.d(d2_nxt[0]), .rst(rst) , .clk(clk), .y(y2_nxt[0]), .mode(mode2), .g_delta(delta20), .ctrl(ctrl2));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(1), .LEARNING_RATE(LEARNING_RATE) ) n2_1(.x(y1) ,.d(d2_nxt[1]), .rst(rst) , .clk(clk), .y(y2_nxt[1]), .mode(mode2), .g_delta(delta21));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.46), .LEARNING_RATE(LEARNING_RATE) ) n2_2(.x(y1) ,.d(d2_nxt[2]), .rst(rst) , .clk(clk), .y(y2_nxt[2]), .mode(mode2), .g_delta(delta22));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.73), .LEARNING_RATE(LEARNING_RATE) ) n2_3(.x(y1) ,.d(d2_nxt[3]), .rst(rst) , .clk(clk), .y(y2_nxt[3]), .mode(mode2), .g_delta(delta23));  
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.257), .LEARNING_RATE(LEARNING_RATE) ) n2_4(.x(y1) ,.d(d2_nxt[4]), .rst(rst) , .clk(clk), .y(y2_nxt[4]), .mode(mode2), .g_delta(delta24));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.95), .LEARNING_RATE(LEARNING_RATE) ) n2_5(.x(y1) ,.d(d2_nxt[5]), .rst(rst) , .clk(clk), .y(y2_nxt[5]), .mode(mode2), .g_delta(delta25));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.75), .LEARNING_RATE(LEARNING_RATE) ) n2_6(.x(y1) ,.d(d2_nxt[6]), .rst(rst) , .clk(clk), .y(y2_nxt[6]), .mode(mode2), .g_delta(delta26));
        neuron_layer2_rtl # (.LAYER2(LAYER1), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(-0.384), .LEARNING_RATE(LEARNING_RATE) ) n2_7(.x(y1) ,.d(d2_nxt[7]), .rst(rst) , .clk(clk), .y(y2_nxt[7]), .mode(mode2), .g_delta(delta27)); 

//3 layer    
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.89), .LEARNING_RATE(LEARNING_RATE) )n3_0(.x(y2) ,.d(d3_nxt[0]), .rst(rst) , .clk(clk), .y(y3_nxt[0]), .mode(mode3), .g_delta(delta31), .ctrl(ctrl3));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.97), .LEARNING_RATE(LEARNING_RATE) )n3_1(.x(y2) ,.d(d3_nxt[1]), .rst(rst) , .clk(clk), .y(y3_nxt[1]), .mode(mode3), .g_delta(delta32));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.77), .LEARNING_RATE(LEARNING_RATE) )n3_2(.x(y2) ,.d(d3_nxt[2]), .rst(rst) , .clk(clk), .y(y3_nxt[2]), .mode(mode3), .g_delta(delta33));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.66), .LEARNING_RATE(LEARNING_RATE) )n3_3(.x(y2) ,.d(d3_nxt[3]), .rst(rst) , .clk(clk), .y(y3_nxt[3]), .mode(mode3), .g_delta(delta34));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.69), .LEARNING_RATE(LEARNING_RATE) )n3_4(.x(y2) ,.d(d3_nxt[4]), .rst(rst) , .clk(clk), .y(y3_nxt[4]), .mode(mode3), .g_delta(delta35));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.597), .LEARNING_RATE(LEARNING_RATE) )n3_5(.x(y2) ,.d(d3_nxt[5]), .rst(rst) , .clk(clk), .y(y3_nxt[5]), .mode(mode3), .g_delta(delta36));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.877), .LEARNING_RATE(LEARNING_RATE) )n3_6(.x(y2) ,.d(d3_nxt[6]), .rst(rst) , .clk(clk), .y(y3_nxt[6]), .mode(mode3), .g_delta(delta37));
        neuron_layer3_rtl # (.LAYER3(LAYER2), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.366), .LEARNING_RATE(LEARNING_RATE) )n3_7(.x(y2) ,.d(d3_nxt[7]), .rst(rst) , .clk(clk), .y(y3_nxt[7]), .mode(mode3), .g_delta(delta38));
               
//layer4                 
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.59), .LEARNING_RATE(LEARNING_RATE) )n4_0(.x(y3) ,.z(z_prev[0]), .rst(rst) , .clk(clk), .y(y4_nxt[17:0]), .mode(mode4), .g_delta(delta41), .ctrl(ctrl4));
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.67), .LEARNING_RATE(LEARNING_RATE) )n4_1(.x(y3) ,.z(z_prev[1]), .rst(rst) , .clk(clk), .y(y4_nxt[35:18]), .mode(mode4), .g_delta(delta42));
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.57), .LEARNING_RATE(LEARNING_RATE) )n4_2(.x(y3) ,.z(z_prev[2]), .rst(rst) , .clk(clk), .y(y4_nxt[53:36]), .mode(mode4), .g_delta(delta43));
        neuron_layer4_rtl # (.LAYER4(LAYER3), .FXP_SCALE(FXP_SCALE), .FXP_SHIFT(FXP_SHIFT), .m(0.76), .LEARNING_RATE(LEARNING_RATE) )n4_3(.x(y3) ,.z(z_prev[3]), .rst(rst) , .clk(clk), .y(y4_nxt[71:54]), .mode(mode4), .g_delta(delta44));         
          

        
        
        
                      
endmodule
