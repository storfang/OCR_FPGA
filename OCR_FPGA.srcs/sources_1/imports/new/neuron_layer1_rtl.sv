module neuron_layer1_rtl    # ( parameter LAYER1 = 16, parameter FXP_SCALE = 1, parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE , parameter m =1,
parameter FXP_SHIFT = 14)(
    input wire  [LAYER1-1:0]x,
    input wire signed [17:0]  d,
    input wire rst,
    input wire clk,
    input wire mode,
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
    integer i =0; int j=0;

    always@(posedge clk) begin
        if(rst==1) y <= 0;
        else
         begin        
            sum = x[0]*w[0]+x[1]*w[1]+x[2]*w[2]+x[3]*w[3]+x[4]*w[4]+x[5]*w[5]+x[6]*w[6]+x[7]*w[7]+
             x[8]*w[8]+x[9]*w[9]+x[10]*w[10]+x[11]*w[11]+x[12]*w[12]+x[13]*w[13]+x[14]*w[14]+x[15]*w[15];
             if(sum<0) y<=0;
            else y<=sum;
         end                                           
         w[15:0] <= w_nxt[15:0];
     end
    always@*
    if (mode == 1) begin
    begin
     komparator = d;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    for(i=0;i<LAYER1;i++) w_nxt[i] = x[i]*(delta>>>FXP_SHIFT)+w[i];         
    end end 
      
  /*  always@(posedge clk) begin
    if(|x==1) begin
    if(j<15)begin
    temp<=x[j]*w[j]+x[j+1]*w[j+1]+x[j+2]*w[j+2]+x[j+3]*w[j+3];
    sum_nxt <=sum_nxt+temp;j=j+4; 
    end
    else begin j<=0; sum <= sum_nxt; temp <= 0; sum_nxt<=0;end
    end end
    */
endmodule
