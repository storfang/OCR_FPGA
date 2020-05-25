module neuron_layer3_rtl    # ( parameter LAYER3 = 8, parameter FXP_SCALE = 1, parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE , parameter m =1,
parameter FXP_SHIFT = 14)(
    input wire signed [17:0]  x[LAYER3-1:0],
    input wire signed [17:0] d,
    input wire rst,
    input wire clk,
    input wire mode,
    output reg signed [17:0] g_delta[LAYER3-1:0],
    output reg signed [17:0]  y
    );

    reg signed [17:0] w[LAYER3-1:0] ={0.48*FXP_SCALE*m, 0.25794*FXP_SCALE*m, 0.41*FXP_SCALE*m, 0.31*FXP_SCALE*m, -0.3*FXP_SCALE*m,
                     -0.1*FXP_SCALE*m, 0.3597*FXP_SCALE*m, 0.11*FXP_SCALE*m};
    reg signed [17:0] w_nxt[LAYER3-1:0] ={0.48*FXP_SCALE*m, 0.25794*FXP_SCALE*m, 0.41*FXP_SCALE*m, 0.31*FXP_SCALE*m, -0.3*FXP_SCALE*m,
                       -0.1*FXP_SCALE*m, 0.3597*FXP_SCALE*m, 0.11*FXP_SCALE*m};
    reg signed [32:0] sum = 0;
    reg signed [32:0] delta = 0;
    reg signed [17:0] komparator = 0;
    integer i =0;

    always@(posedge clk) begin
        if(rst==1) y <= 0;
        else
         begin
         
             sum = ((x[0]*w[0])>>>FXP_SHIFT)+((x[1]*w[1])>>>FXP_SHIFT)+((x[2]*w[2])>>>FXP_SHIFT)+((x[3]*w[3])>>>FXP_SHIFT)+((x[4]*w[4])>>>FXP_SHIFT)+
          ((x[5]*w[5])>>>FXP_SHIFT)+((x[6]*w[6])>>>FXP_SHIFT)+((x[7]*w[7])>>>FXP_SHIFT);
             if(sum<0) y<=0;
            else y<=sum;
         end                                      
         w[7:0] <= w_nxt[7:0]; 
     end
    always@*
    if (mode == 1) begin
    begin
     komparator = d;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    for(i=0;i<LAYER3;i++)begin w_nxt[i] = ((x[i]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i];
    g_delta[i] = ((delta>>>FXP_SHIFT)*w[i])>>>FXP_SHIFT; end          
    end
    end

endmodule
