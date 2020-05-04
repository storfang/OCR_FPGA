module neuron_layer1    # ( parameter LAYER1 = 4, parameter integer FXP_SCALE = 1, parameter LEARNING_RATE = 0.1*FXP_SCALE )(
    input wire  [LAYER1-1:0]x,
    input wire  d,
    input wire rst,
    input wire clk,
    input wire mode,
    //output real g_delta[LAYER1-1:0],
    output real  y
    );

    real w[LAYER1-1:0] ={0.8*FXP_SCALE, -1*FXP_SCALE, 0.23*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,
                  -1*FXP_SCALE, 0.6*FXP_SCALE, -0.64*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE,
                      0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE,
                      1*FXP_SCALE};
    real w_nxt[LAYER1-1:0] ={0.8*FXP_SCALE, -1*FXP_SCALE, 0.23*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE,
                     -1*FXP_SCALE, 0.6*FXP_SCALE, -0.64*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE,
                      0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE,
                      1*FXP_SCALE};
    real sum = 0;
    real delta = 0;
    real komparator = 0;
    integer i =0;
   // reg [15:0] y_nxt;


    always@(posedge clk || rst) begin
        if(rst) y = 0;
        else
         begin
         assign sum = x[0]*w[0]+x[1]*w[1]+x[2]*w[2]+x[3]*w[3]+x[4]*w[4]+x[5]*w[5]+x[6]*w[6]+x[7]*w[7]+
                      x[8]*w[8]+x[9]*w[9]+x[10]*w[10]+x[11]*w[11]+x[12]*w[12]+x[13]*w[13]+x[14]*w[14]+x[15]*w[15];
             if(sum<0) y=1'b0;
            else y=sum;
         end
         w[0] <= w_nxt[0];
         w[1] <= w_nxt[1];
         w[2] <= w_nxt[2];
         w[3] <= w_nxt[3];
         w[4] <= w_nxt[4];
         w[5] <= w_nxt[5];
         w[6] <= w_nxt[6];
         w[7] <= w_nxt[7];
         w[8] <= w_nxt[8];
         w[9] <= w_nxt[9];
         w[10] <= w_nxt[10];
         w[11] <= w_nxt[11];
         w[12] <= w_nxt[12];
         w[13] <= w_nxt[13];
         w[14] <= w_nxt[14];
         w[15] <= w_nxt[15];                                             
         //w[15:0] <= w_nxt[15:0];
        // $display(" y2 = %f" , sum);    
     end
    always@*
    if (mode == 1) begin
    begin
    assign komparator = d;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    for(i=0;i<LAYER1;i++) w_nxt[i] = x[i]*delta+w[i]; 
    //g_delta[i] = delta*w[i];          
    end end
endmodule
