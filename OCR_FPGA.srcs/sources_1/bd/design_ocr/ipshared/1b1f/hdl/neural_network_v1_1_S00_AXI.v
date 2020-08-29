
`timescale 1 ns / 1 ps

	module neural_network_v1_1_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 5
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 2;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 7
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	reg	 aw_en;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      aw_en <= 1'b1;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (S_AXI_BREADY && axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	     // slv_reg2 <= 0;
	     // slv_reg3 <= 0;
	     // slv_reg4 <= 0;
	     // slv_reg5 <= 0;
	     // slv_reg6 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          3'h0:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h1:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h2:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	             //   slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h3:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	             //   slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h4:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 4
	             //   slv_reg4[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h5:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 5
	              //  slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          3'h6:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 6
	              //  slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                  //    slv_reg2 <= slv_reg2;
	                  //    slv_reg3 <= slv_reg3;
	                   //   slv_reg4 <= slv_reg4;
	                  //    slv_reg5 <= slv_reg5;
	                  //    slv_reg6 <= slv_reg6;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        3'h0   : reg_data_out <= slv_reg0;
	        3'h1   : reg_data_out <= slv_reg1;
	        3'h2   : reg_data_out <= slv_reg2;
	        3'h3   : reg_data_out <= slv_reg3;
	        3'h4   : reg_data_out <= slv_reg4;
	        3'h5   : reg_data_out <= slv_reg5;
	        3'h6   : reg_data_out <= slv_reg6;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

	// Add user logic here
	
		//Reset signal for cordic processor
            wire ARESET;
            assign ARESET = ~S_AXI_ARESETN;
            
            //Transfer output from cordic processor to output registers
            wire [C_S_AXI_DATA_WIDTH-1:0]    slv_wire2;
            wire [C_S_AXI_DATA_WIDTH-1:0]    slv_wire3;
            wire [C_S_AXI_DATA_WIDTH-1:0]    slv_wire4;
            wire [C_S_AXI_DATA_WIDTH-1:0]    slv_wire5;
            wire [C_S_AXI_DATA_WIDTH-1:0]    slv_wire6;
            always @( posedge S_AXI_ACLK )
            begin
               slv_reg2 <= slv_wire2; 
               slv_reg3 <= slv_wire3;
               slv_reg4 <= slv_wire4;
               slv_reg5 <= slv_wire5;
               slv_reg6 <= slv_wire6; 
            end
            
            //Assign zeros to unused bits
            assign slv_wire2[31:1] = 31'b0;
            assign slv_wire3[31:18] = 13'b0;
            assign slv_wire4[31:18] = 13'b0;
            assign slv_wire5[31:18] = 13'b0;  
            assign slv_wire6[31:18] = 13'b0;
             
network_rtl network_rtl_int(
            slv_reg0[15:0], //x
            slv_reg0[19:16], //z
            ARESET, //rst
            S_AXI_ACLK, //clk 
            slv_reg1[1], //mode
            slv_reg1[0], //start
            slv_wire2[0], //ready o
            {slv_wire3[17:0],slv_wire4[17:0],slv_wire5[17:0],slv_wire6[17:0]}); //y o); 

	// User logic ends


	endmodule


//******************************************************************//

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
            
            if(rst==1) begin state <= ST_STOP; y4<=0; end
            else begin
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
             end   
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
        if(rst==1) begin y <= 0; state<=ST_STOP; end
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
                        else if(mode==2'b10) state<=ST_BP;
                        else state<=ST_STOP;
                    end
                endcase
         end 
         end

    
    
endmodule





module neuron_layer3_rtl    # ( parameter LAYER3 = 8, parameter FXP_SCALE = 1, parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE , parameter m =1,
parameter FXP_SHIFT = 14)(
    input wire signed [17:0]  x[LAYER3-1:0],
    input wire signed [17:0] d,
    input wire rst,
    input wire clk,
    input wire [1:0] mode,
    output reg [1:0] ctrl,
    output reg signed [17:0] g_delta[LAYER3-1:0],
    output reg signed [17:0]  y
    );

    reg signed [17:0] w[LAYER3-1:0] ={0.48*FXP_SCALE*m, 0.25794*FXP_SCALE*m, 0.41*FXP_SCALE*m, 0.31*FXP_SCALE*m, -0.3*FXP_SCALE*m,
                     -0.1*FXP_SCALE*m, 0.3597*FXP_SCALE*m, 0.11*FXP_SCALE*m};
    reg signed [17:0] w_nxt[LAYER3-1:0] ={0.48*FXP_SCALE*m, 0.25794*FXP_SCALE*m, 0.41*FXP_SCALE*m, 0.31*FXP_SCALE*m, -0.3*FXP_SCALE*m,
                       -0.1*FXP_SCALE*m, 0.3597*FXP_SCALE*m, 0.11*FXP_SCALE*m};
    reg signed [32:0] sum = 0; reg signed [32:0] sum_nxt = 0; reg signed [32:0] temp = 0;
    reg signed [32:0] delta = 0;
    reg signed [17:0] komparator = 0;
    integer i =0;int j=0; int k=0;
  enum {ST_IN, ST_FORWARD, ST_BP, ST_STOP, ST_WAIT} state = ST_STOP;
   /* always@(posedge clk) begin
        if(rst==1) y <= 0;
        else
         begin
         
      //       sum = ((x[0]*w[0])>>>FXP_SHIFT)+((x[1]*w[1])>>>FXP_SHIFT)+((x[2]*w[2])>>>FXP_SHIFT)+((x[3]*w[3])>>>FXP_SHIFT)+((x[4]*w[4])>>>FXP_SHIFT)+
      //    ((x[5]*w[5])>>>FXP_SHIFT)+((x[6]*w[6])>>>FXP_SHIFT)+((x[7]*w[7])>>>FXP_SHIFT);
             if(sum<0) y<=0;
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
    for(i=0;i<2;i++)begin w_nxt[i+k] = ((x[i+k]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i+k];
    g_delta[i+k] = ((delta>>>FXP_SHIFT)*w[i+k])>>>FXP_SHIFT; end
    k = k+2;
    end
    else k=0;;         
    end
    end
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
        if(rst==1) begin y <= 0; state<=ST_STOP; end
        else begin
            case(state)
                ST_IN:begin
                        if(j<9)begin
                        temp<=((x[j]*w[j])>>>FXP_SHIFT)+((x[j+1]*w[j+1])>>>FXP_SHIFT)/*+((x[j+2]*w[j+2])>>>FXP_SHIFT)+((x[j+3]*w[j+3])>>>FXP_SHIFT)*/;
                        sum_nxt <=sum_nxt+temp;j=j+2; 
                        end
                        else begin j<=0; sum <= sum_nxt; temp <= 0; sum_nxt<=0; state<= ST_FORWARD; end
                end 
        
                ST_FORWARD: begin     
                begin        
                if(sum<0) y<=0;
                else y<=sum;
                end                                           
                w[7:0] <= w_nxt[7:0];
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
                        if(k<9)begin
                            for(i=0;i<4;i++)begin w_nxt[i+k] <= ((x[i+k]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i+k]; 
                            g_delta[i+k] <= ((delta>>>FXP_SHIFT)*w[i+k])>>>FXP_SHIFT;   end 
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





module neuron_layer4_rtl    # ( parameter LAYER4 = 8, parameter FXP_SCALE = 1, parameter signed [15:0] LEARNING_RATE = 0.1*FXP_SCALE, parameter m =1,
parameter FXP_SHIFT = 14 )(
    input wire signed [17:0] x[LAYER4-1:0],
    input wire  z,
    input wire rst,
    input wire clk,
    input wire [1:0] mode,
    output reg [1:0] ctrl,
    output reg signed [17:0] g_delta[LAYER4-1:0],
    output reg signed [17:0]  y
    );
    reg signed [17:0] w[LAYER4-1:0] ={ 0.4*FXP_SCALE*m, 0.32*FXP_SCALE*m, 0.486*FXP_SCALE*m,
                      -0.31*FXP_SCALE*m,-0.18*FXP_SCALE*m, -0.5794*FXP_SCALE*m, 0.37*FXP_SCALE*m, 0.35*FXP_SCALE*m};
    reg signed [17:0] w_nxt[LAYER4-1:0] ={0.4*FXP_SCALE*m, 0.32*FXP_SCALE*m, 0.486*FXP_SCALE*m,
                        -0.31*FXP_SCALE*m,-0.18*FXP_SCALE*m, -0.5794*FXP_SCALE*m, 0.37*FXP_SCALE*m, 0.35*FXP_SCALE*m};
    reg signed [32:0] sum = 0; reg signed [32:0] sum_nxt = 0; reg signed [32:0] temp = 0;
    reg signed [32:0] delta = 0;
    reg signed [17:0] komparator = 0;
    integer i =0;int j=0;  int k=0;
      enum {ST_IN, ST_FORWARD, ST_BP, ST_STOP, ST_WAIT} state = ST_STOP;
/*
    always@(posedge clk) begin
        if(rst==1) y = 0;
        else
         begin
      //       sum = ((x[0]*w[0])>>>FXP_SHIFT)+((x[1]*w[1])>>>FXP_SHIFT)+((x[2]*w[2])>>>FXP_SHIFT)+((x[3]*w[3])>>>FXP_SHIFT)+((x[4]*w[4])>>>FXP_SHIFT)+
      //    ((x[5]*w[5])>>>FXP_SHIFT)+((x[6]*w[6])>>>FXP_SHIFT)+((x[7]*w[7])>>>FXP_SHIFT);
             if(sum<0) y=0;
            else y=sum;
         end                                        
         w[7:0] <= w_nxt[7:0];  
     end
    always@(posedge clk)
    if (mode == 1) begin
    begin
     komparator = (z*FXP_SCALE) - sum;
    if(sum < 0) delta = 0;
    else delta = komparator * LEARNING_RATE;
    if(k<7)begin
    for(i=0;i<2;i++)begin w_nxt[i+k] = ((x[i+k]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i+k];
    g_delta[i+k] = ((delta>>>FXP_SHIFT)*w[i+k])>>>FXP_SHIFT; end
    k = k+2;
    end
    else k=0;;          
    end
    end
    
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
        if(rst==1) begin y <= 0; state<=ST_STOP; end
            else begin
                case(state)
                    ST_IN:begin
                            if(j<9)begin
                            temp<=((x[j]*w[j])>>>FXP_SHIFT)+((x[j+1]*w[j+1])>>>FXP_SHIFT)/*+((x[j+2]*w[j+2])>>>FXP_SHIFT)+((x[j+3]*w[j+3])>>>FXP_SHIFT)*/;
                            sum_nxt <=sum_nxt+temp;j<=j+2; 
                            end
                            else begin j<=0; sum <= sum_nxt; temp <= 0; sum_nxt<=0; state<= ST_FORWARD; end
                    end 
            
                    ST_FORWARD: begin     
                    begin        
                    if(sum<0) y<=0;
                    else y<=sum;
                    end                                           
                    w[7:0] <= w_nxt[7:0];
                    ctrl <= 2'b01;
                    state<=ST_STOP;
                    //if(mode==1)state <= ST_BP;
                    //else state <= ST_IN;
                    end
             
                    ST_BP: begin
                        //if (mode == 1) begin
                         begin
                         komparator <= (z*FXP_SCALE) - sum;
                            if(sum < 0) delta <= 0;
                            else delta <= komparator * LEARNING_RATE;
                            if(k<9)begin
                                for(i=0;i<4;i++)begin w_nxt[i+k] <= ((x[i+k]*(delta>>>FXP_SHIFT))>>>FXP_SHIFT)+w[i+k]; 
                                g_delta[i+k] <= ((delta>>>FXP_SHIFT)*w[i+k])>>>FXP_SHIFT;   end 
                            k <= k+4;
                            end
                            else begin k<=0; state <= ST_STOP;  ctrl <= 2'b10; end          
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