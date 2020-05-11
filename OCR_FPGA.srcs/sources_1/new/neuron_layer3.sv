module neuron_layer3    # ( parameter LAYER3 = 32, parameter FXP_SCALE = 1, parameter LEARNING_RATE = 0.1*FXP_SCALE )(
    input real  x[LAYER3-1:0],
    input wire  z,
    input wire rst,
    input wire clk,
    input wire mode,
    output real g_delta[LAYER3-1:0],
    output real  y
    );

    real w[LAYER3:0] ={0.48*FXP_SCALE, 0.25794*FXP_SCALE, 0.48*FXP_SCALE, 0.31*FXP_SCALE, -0.3*FXP_SCALE,
                     0.1*FXP_SCALE, 0.3597*FXP_SCALE, 0.11*FXP_SCALE, 0.4*FXP_SCALE, -0.151*FXP_SCALE,
                      0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, 0.32*FXP_SCALE, 0.486*FXP_SCALE,
                      -0.31*FXP_SCALE,0.48*FXP_SCALE, -0.5794*FXP_SCALE, 0.97*FXP_SCALE, 0.35*FXP_SCALE, 0.39*FXP_SCALE,
                                           -0.08*FXP_SCALE, 0.597*FXP_SCALE, -0.1*FXP_SCALE, 0.498*FXP_SCALE, 1.098*FXP_SCALE,
                                            0.6*FXP_SCALE, 0.588*FXP_SCALE, 0.4*FXP_SCALE, -0.2*FXP_SCALE, 0.486*FXP_SCALE,
                                            -0.31*FXP_SCALE, 1*FXP_SCALE};
    real w_nxt[LAYER3:0] ={0.48*FXP_SCALE, 0.25794*FXP_SCALE, 0.48*FXP_SCALE, 0.31*FXP_SCALE, -0.3*FXP_SCALE,
                       0.1*FXP_SCALE, 0.3597*FXP_SCALE, 0.11*FXP_SCALE, 0.4*FXP_SCALE, -0.151*FXP_SCALE,
                        0.6*FXP_SCALE, 1*FXP_SCALE, 0.4*FXP_SCALE, 0.32*FXP_SCALE, 0.486*FXP_SCALE,
                        -0.31*FXP_SCALE,0.48*FXP_SCALE, -0.5794*FXP_SCALE, 0.97*FXP_SCALE, 0.35*FXP_SCALE, 0.39*FXP_SCALE,
                                             -0.08*FXP_SCALE, 0.597*FXP_SCALE, -0.1*FXP_SCALE, 0.498*FXP_SCALE, 1.098*FXP_SCALE,
                                              0.6*FXP_SCALE, 0.588*FXP_SCALE, 0.4*FXP_SCALE, -0.2*FXP_SCALE, 0.486*FXP_SCALE,
                                              -0.31*FXP_SCALE, 1*FXP_SCALE};
    real sum = 0;
    real delta = 0;
    real komparator = 0;
    integer i =0;
    real xbias=1;
   // reg [15:0] y_nxt;


    always@(posedge clk || rst) begin
        if(rst) y = 0;
        else
         begin
         assign sum = x[0]*w[0]+x[1]*w[1]+x[2]*w[2]+x[3]*w[3]+x[4]*w[4]+x[5]*w[5]+x[6]*w[6]+x[7]*w[7]+
                      x[8]*w[8]+x[9]*w[9]+x[10]*w[10]+x[11]*w[11]+x[12]*w[12]+x[13]*w[13]+x[14]*w[14]+x[15]*w[15]+
                      x[16]*w[16]+x[17]*w[17]+x[18]*w[18]+x[19]*w[19]+x[20]*w[20]+x[21]*w[21]+x[22]*w[22]+x[23]*w[23]+
                      x[24]*w[24]+x[25]*w[25]+x[26]*w[26]+x[27]*w[27]+x[28]*w[28]+x[29]*w[29]+x[30]*w[30]+x[31]*w[31]+xbias*w[32];
             if(sum<0) y=0;
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
         //$display(" y3 = %f" , sum);    
     end
    always@*
    if (mode == 1) begin
    begin
    assign komparator = z - sum;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    for(i=0;i<LAYER3;i++)begin w_nxt[i] = x[i]*delta+w[i];
    g_delta[i] = delta*w[i]; end          
    w_nxt[LAYER3] = xbias*w[LAYER3]; end
    end
endmodule
