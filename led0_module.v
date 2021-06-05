module led0_module
(
    CLK, RSTn, LED_Out
);

    input CLK;
    input RSTn;
    output LED_Out;
    
    /*************************************/
    
    parameter T100MS = 10'd500;
    
    /*************************************/
    
    reg [9:0]Count1;
    
    always @ ( posedge CLK or negedge RSTn )// counter
	    if( !RSTn )	
	        Count1 <= 10'd0;
	    else if( Count1 == T100MS )
	        Count1 <= 10'd0;
	    else
	        Count1 <= Count1 + 1'b1;
	        
	/*************************************/
	
	reg rLED_Out;
	
	always @ ( posedge CLK or negedge RSTn )
        if( !RSTn ) 
            rLED_Out <= 1'b0;
        else if( Count1 >= 10'd0 && Count1 < 10'd250 )// the half period of counter is 250
            rLED_Out <= 1'b1;
        else 
            rLED_Out <= 1'b0;
            
     /***************************************/
     
     assign LED_Out = rLED_Out;
     
     /***************************************/
              
    
endmodule
