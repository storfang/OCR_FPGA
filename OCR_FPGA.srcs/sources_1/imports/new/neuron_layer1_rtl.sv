module neuron_layer1_rtl    # ( parameter LAYER1 = 16, parameter FXP_SCALE = 1, parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE , parameter m =1,
parameter FXP_SHIFT = 14)(
    input wire  [LAYER1-1:0]x,
    input wire signed [17:0]  d,
    input wire rst,
    input wire clk,
    input wire [1:0] mode,
    output reg [1:0] ctrl,
    output reg signed [17:0]  y
    );

    reg signed [17:0] w[LAYER1-1:0] ={-0.24*FXP_SCALE*m, 0.5*FXP_SCALE*m, -0.73*FXP_SCALE*m, 0.11*FXP_SCALE*m, 0.4*FXP_SCALE*m,
                     -0.05*FXP_SCALE*m, 0.68*FXP_SCALE*m, -0.64*FXP_SCALE*m, -0.4*FXP_SCALE*m, 0.7*FXP_SCALE*m,
                      0.6*FXP_SCALE*m,- 0.4687*FXP_SCALE*m, 0.346*FXP_SCALE*m, 0.25*FXP_SCALE*m, -0.648*FXP_SCALE*m,
                      0.77*FXP_SCALE*m};
    reg signed [17:0] w_nxt[LAYER1-1:0] ={-0.24*FXP_SCALE*m, 0.5*FXP_SCALE*m, -0.73*FXP_SCALE*m, 0.11*FXP_SCALE*m, 0.4*FXP_SCALE*m,
                     -0.05*FXP_SCALE*m, 0.68*FXP_SCALE*m, -0.64*FXP_SCALE*m, -0.4*FXP_SCALE*m, 0.7*FXP_SCALE*m,
                      0.6*FXP_SCALE*m, -0.4687*FXP_SCALE*m, 0.346*FXP_SCALE*m, 0.25*FXP_SCALE*m, -0.648*FXP_SCALE*m,
                      0.77*FXP_SCALE*m};
                      
    reg signed [17:0] sum = 0; reg signed [17:0] sum_nxt = 0; reg signed [17:0] temp = 0;
    reg signed [32:0] delta = 0; 
    reg signed [17:0] komparator = 0;
    integer i =0; int j=0; int k=0;
    enum {ST_IN, ST_FORWARD, ST_BP, ST_STOP, ST_WAIT} state = ST_STOP;
    always@(posedge clk) begin
        if(rst==1) begin y <= 0; state<=ST_STOP; end
        else begin
            case(state)
                ST_IN:begin
                     if(j<17)begin
                        temp<=x[j]*w[j]+x[j+1]*w[j+1]/*+x[j+2]*w[j+2]+x[j+3]*w[j+3]*/;
                        sum_nxt <=sum_nxt+temp;j=j+2; 
                     end
                     else begin j<=0; sum <= sum_nxt; temp <= 0; sum_nxt<=0; state<= ST_FORWARD; end
                end 
        
                ST_FORWARD: begin     
                begin        
           // sum = x[0]*w[0]+x[1]*w[1]+x[2]*w[2]+x[3]*w[3]+x[4]*w[4]+x[5]*w[5]+x[6]*w[6]+x[7]*w[7]+
           //  x[8]*w[8]+x[9]*w[9]+x[10]*w[10]+x[11]*w[11]+x[12]*w[12]+x[13]*w[13]+x[14]*w[14]+x[15]*w[15];
                if(sum<0) y<=0;
                else y<=sum;
                end                                           
                w[15:0] <= w_nxt[15:0];
                ctrl <= 2'b01;
                state<=ST_STOP;
                //if(mode==1)state <= ST_BP;
                //else state <= ST_IN;
                end
         
                ST_BP: begin
                   // if (mode == 1) begin
                     begin
                     komparator <= d;
                        if(sum < 0) delta <= 0;
                        else delta <= komparator * LEARNING_RATE;
                        if(k<17)begin
                            for(i=0;i<4;i++) w_nxt[i+k] <= x[i+k]*(delta>>>FXP_SHIFT)+w[i+k];
                            k <= k+4;
                            end
                        else begin k<=0; state <= ST_STOP;  ctrl <= 2'b10;   end          
                end end //end
                
                ST_STOP: begin
                    if(mode == 2'b01) state<=ST_IN;
                    else if(mode==2'b10) state<=ST_BP;
                    else state<=ST_STOP;
                end
            endcase
     end 
     end


    
endmodule
