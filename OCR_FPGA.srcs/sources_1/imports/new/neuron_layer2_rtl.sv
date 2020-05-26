module neuron_layer2_rtl    # ( parameter LAYER2 = 16, parameter FXP_SCALE = 1, parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE, parameter m =1,
parameter FXP_SHIFT = 14 )(
    input wire signed [17:0]  x[LAYER2-1:0],
    input wire signed [17:0] d,
    input wire rst,
    input wire clk,
    input wire [1:0] mode,
    output reg [1:0] ctrl,
    output reg signed [17:0] g_delta[LAYER2-1:0],
    output reg signed [17:0]  y
    );
    reg signed [17:0] w[LAYER2-1:0] ={-0.5*FXP_SCALE*m, 0.24*FXP_SCALE*m, 0.43*FXP_SCALE*m, 0.16*FXP_SCALE*m, -0.4*FXP_SCALE*m,
                     0.21*FXP_SCALE*m, 0.3942*FXP_SCALE*m, -0.5*FXP_SCALE*m, -0.2*FXP_SCALE*m, 0.583*FXP_SCALE*m, 0.23*FXP_SCALE*m,
                      -0.1*FXP_SCALE*m, 0.579*FXP_SCALE*m, -0.41*FXP_SCALE*m, 0.468*FXP_SCALE*m, 1*FXP_SCALE*m};
    reg signed [17:0] w_nxt[LAYER2-1:0] ={-0.5*FXP_SCALE*m,0.24*FXP_SCALE*m, 0.43*FXP_SCALE*m, 0.16*FXP_SCALE*m, -0.4*FXP_SCALE*m,
                     0.21*FXP_SCALE*m, 0.3942*FXP_SCALE*m, -0.5*FXP_SCALE*m,-0.2*FXP_SCALE*m, 0.583*FXP_SCALE*m, 0.23*FXP_SCALE*m,
                      -0.1*FXP_SCALE*m, 0.579*FXP_SCALE*m, -0.41*FXP_SCALE*m, 0.468*FXP_SCALE*m, 1*FXP_SCALE*m};
    reg signed [32:0] sum = 0; reg signed [32:0] sum_nxt = 0; reg signed [32:0] temp = 0;
    reg signed [32:0] delta = 0;
    reg signed [17:0] komparator = 0;
    integer i =0; int j=0; int k=0;
    enum {ST_IN, ST_FORWARD, ST_BP, ST_STOP, ST_WAIT} state = ST_STOP;
    /*always@(posedge clk) begin
        if(rst==1) y <= 0;
        else
         begin
      //       sum = ((x[0]*w[0])>>>FXP_SHIFT)+((x[1]*w[1])>>>FXP_SHIFT)+((x[2]*w[2])>>>FXP_SHIFT)+((x[3]*w[3])>>>FXP_SHIFT)+((x[4]*w[4])>>>FXP_SHIFT)+
      //    ((x[5]*w[5])>>>FXP_SHIFT)+((x[6]*w[6])>>>FXP_SHIFT)+((x[7]*w[7])>>>FXP_SHIFT)/*+((x[8]*w[8])>>>FXP_SHIFT)+((x[9]*w[9])>>>FXP_SHIFT)+((x[10]*w[10])>>>FXP_SHIFT)
       //   +((x[11]*w[11])>>>FXP_SHIFT)+((x[12]*w[12])>>>FXP_SHIFT)+((x[13]*w[13])>>>FXP_SHIFT)+((x[14]*w[14])>>>FXP_SHIFT)+((x[15]*w[15])>>>FXP_SHIFT)*/;
    /*         if(sum<0) y<=0;
            else y<=sum;
         end                                                  
         w[7:0] <= w_nxt[7:0];  
     end
    always@(posedge clk)
    if (mode == 1) begin
    begin
    komparator = d;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    if(k<7)begin
    for(i=0;i<4;i++)begin w_nxt[i+k] = ((x[i]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i+k]; 
    g_delta[i+k] = ((delta>>>FXP_SHIFT)*w[i+k])>>>FXP_SHIFT;   end 
    k = k+4;
        end
        else k=0;;       
    end end
    
    always@(posedge clk) begin
   // if(|x==1) begin
    if(j<7)begin
    temp<=x[j]*w[j]+x[j+1]*w[j+1]+x[j+2]*w[j+2]+x[j+3]*w[j+3];
    sum_nxt <=sum_nxt+temp;j=j+4; 
    end
    else begin j<=0; sum <= sum_nxt; temp <= 0; sum_nxt<=0;end
    end //end
    */
    
    always@(posedge clk) begin
            if(rst==1) y <= 0;
            else begin
                case(state)
                    ST_IN:begin
                            if(j<17)begin
                            temp<=((x[j]*w[j])>>>FXP_SHIFT)/*+((x[j+1]*w[j+1])>>>FXP_SHIFT)+((x[j+2]*w[j+2])>>>FXP_SHIFT)+((x[j+3]*w[j+3])>>>FXP_SHIFT)*/;
                            sum_nxt <=sum_nxt+temp;j=j+1; 
                            end
                            else begin j<=0; sum <= sum_nxt; temp <= 0; sum_nxt<=0; state<= ST_FORWARD; end
                    end 
            
                    ST_FORWARD: begin     
                    begin        
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
                        //if (mode == 1) begin
                         begin
                         komparator <= d;
                            if(sum < 0) delta <= 0;
                            else delta <= komparator * LEARNING_RATE;
                            if(k<17)begin
                                for(i=0;i<4;i++)begin w_nxt[i+k] <= ((x[i+k]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i+k]; 
                                g_delta[i+k] <= ((delta>>>FXP_SHIFT)*w[i+k])>>>FXP_SHIFT;   end 
                            k <= k+4;
                            end
                            else begin k<=0; state <= ST_STOP;  ctrl <= 2'b10;   end          
                    end end// end
                    
                    ST_STOP: begin
                        if(mode == 2'b01) state<=ST_IN;
                        else if(mode==4'b10) state<=ST_BP;
                        else state<=ST_STOP;
                    end
                endcase
         end 
         end

    
    
endmodule
