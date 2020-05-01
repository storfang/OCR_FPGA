module neuron_layer2(
    input wire [3:0] x,
    input wire  z,
    input wire rst,
    input wire clk,
    output reg  y
    );
    parameter integer FXP_SCALE = 1024;
    parameter LEARNING_RATE = 0.1*FXP_SCALE;
    real w[3:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE};
    real w_nxt[3:0] ={0.4*FXP_SCALE, -1*FXP_SCALE, 0.6*FXP_SCALE, 1*FXP_SCALE};
    reg [3:0] yx;
    reg [3:0] delta;
    reg [3:0] komparator;


    always@(posedge clk || rst) begin
        if(rst) y = 0;
        else
         begin
         assign yx = x[0]*w[0]+x[1]*w[1]+x[2]*w[2]+x[3]*w[3];
             if(yx<0) y=0;
            else y=yx;
         end
         w[0] = w_nxt[0];
         w[1] = w_nxt[1];
         w[2] = w_nxt[2];
         w[3] = w_nxt[3];    
     end
    always@*
    begin
    assign komparator = z - y;
    if(y == 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    w_nxt[0] = x[0]*delta+w[0];
    w_nxt[1] = x[1]*delta+w[1];
    w_nxt[2] = x[2]*delta+w[2];
    w_nxt[3] = x[3]*delta+w[3];        
    end
    
endmodule
