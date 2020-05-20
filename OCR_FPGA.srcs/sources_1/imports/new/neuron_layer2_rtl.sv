module neuron_layer2_rtl    # ( parameter LAYER2 = 16, parameter FXP_SCALE = 1, parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE, parameter m =1,
parameter FXP_SHIFT = 14 )(
    input wire signed [21:0]  x[LAYER2-1:0],
    input wire signed [21:0] d,
    input wire rst,
    input wire clk,
    input wire mode,
    output reg signed [21:0] g_delta[LAYER2-1:0],
    output reg signed [21:0]  y
    );

    reg signed [21:0] w[LAYER2-1:0] ={-0.5*FXP_SCALE*m, 0.24*FXP_SCALE*m, 0.43*FXP_SCALE*m, 0.16*FXP_SCALE*m, -0.4*FXP_SCALE*m,
                     0.21*FXP_SCALE*m, 0.3942*FXP_SCALE*m, -0.5*FXP_SCALE*m, -0.2*FXP_SCALE*m, 0.583*FXP_SCALE*m, 0.23*FXP_SCALE*m,
                      -0.1*FXP_SCALE*m, 0.579*FXP_SCALE*m, -0.41*FXP_SCALE*m, 0.468*FXP_SCALE*m, 1*FXP_SCALE*m};
    reg signed [21:0] w_nxt[LAYER2-1:0] ={-0.5*FXP_SCALE*m,0.24*FXP_SCALE*m, 0.43*FXP_SCALE*m, 0.16*FXP_SCALE*m, -0.4*FXP_SCALE*m,
                     0.21*FXP_SCALE*m, 0.3942*FXP_SCALE*m, -0.5*FXP_SCALE*m,-0.2*FXP_SCALE*m, 0.583*FXP_SCALE*m, 0.23*FXP_SCALE*m,
                      -0.1*FXP_SCALE*m, 0.579*FXP_SCALE*m, -0.41*FXP_SCALE*m, 0.468*FXP_SCALE*m, 1*FXP_SCALE*m};
    reg signed [43:0] sum = 0; reg signed [21:0] sum_nxt = 0;
    reg signed [43:0] delta = 0;
    reg signed [21:0] komparator = 0;
    integer i =0;
   // reg [15:0] y_nxt;


    always@(posedge clk || rst) begin
        if(rst) y = 0;
        else
         begin
          /*assign sum = (x[0]*w[0])/FXP_SCALE+(x[1]*w[1])/FXP_SCALE+(x[2]*w[2])/FXP_SCALE+(x[3]*w[3])/FXP_SCALE+(x[4]*w[4])/FXP_SCALE+
         (x[5]*w[5])/FXP_SCALE+(x[6]*w[6])/FXP_SCALE+(x[7]*w[7])/FXP_SCALE+(x[8]*w[8])/FXP_SCALE+(x[9]*w[9])/FXP_SCALE+(x[10]*w[10])/FXP_SCALE
         +(x[11]*w[11])/FXP_SCALE+(x[12]*w[12])/FXP_SCALE+(x[13]*w[13])/FXP_SCALE+(x[14]*w[14])/FXP_SCALE+(x[15]*w[15])/FXP_SCALE;*/
           // sum=sum_nxt;
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
        // $display(" y2 = %f" , sum);    
     end
    always@*
    if (mode == 1) begin
    begin
     komparator = d;
 /*   if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    for(i=0;i<LAYER2;i++)begin w_nxt[i] = ((x[i]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i]; 
    g_delta[i] = ((delta>>>FXP_SHIFT)*w[i])>>>FXP_SHIFT;   end       
    end end*/
        if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    for(i=0;i<LAYER2;i++)begin w_nxt[i] = ((x[i]*(delta/FXP_SCALE))/FXP_SCALE)+w[i]; 
    g_delta[i] = (delta/FXP_SCALE*w[i])/FXP_SCALE;   end       
    end end
    always@* begin
    sum = ((x[0]*w[0])>>>FXP_SHIFT)+((x[1]*w[1])>>>FXP_SHIFT)+((x[2]*w[2])>>>FXP_SHIFT)+((x[3]*w[3])>>>FXP_SHIFT)+((x[4]*w[4])>>>FXP_SHIFT)+
     ((x[5]*w[5])>>>FXP_SHIFT)+((x[6]*w[6])>>>FXP_SHIFT)+((x[7]*w[7])>>>FXP_SHIFT)+((x[8]*w[8])>>>FXP_SHIFT)+((x[9]*w[9])>>>FXP_SHIFT)+((x[10]*w[10])>>>FXP_SHIFT)
     +((x[11]*w[11])>>>FXP_SHIFT)+((x[12]*w[12])>>>FXP_SHIFT)+((x[13]*w[13])>>>FXP_SHIFT)+((x[14]*w[14])>>>FXP_SHIFT)+((x[15]*w[15])>>>FXP_SHIFT);
    
    
       /*    sum = (x[0]*w[0])/FXP_SCALE+(x[1]*w[1])/FXP_SCALE+(x[2]*w[2])/FXP_SCALE+(x[3]*w[3])/FXP_SCALE+(x[4]*w[4])/FXP_SCALE+
    (x[5]*w[5])/FXP_SCALE+(x[6]*w[6])/FXP_SCALE+(x[7]*w[7])/FXP_SCALE+(x[8]*w[8])/FXP_SCALE+(x[9]*w[9])/FXP_SCALE+(x[10]*w[10])/FXP_SCALE
    +(x[11]*w[11])/FXP_SCALE+(x[12]*w[12])/FXP_SCALE+(x[13]*w[13])/FXP_SCALE+(x[14]*w[14])/FXP_SCALE+(x[15]*w[15])/FXP_SCALE;*/
    end
endmodule
