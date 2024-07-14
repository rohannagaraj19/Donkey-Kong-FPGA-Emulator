//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf     03-01-2006                           --
//                                  03-12-2007                           --
//    Translated by Joe Meng        07-07-2013                           --
//    Modified by Zuofu Cheng       08-19-2023                           --
//    Modified by Satvik Yellanki   12-17-2023                           --
//    Fall 2024 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI Lab                                --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  player 
( 
    input  logic        Reset, 
    input  logic        frame_clk,
    input  logic [7:0]  keycode,

    output logic [9:0]  BallX, 
    output logic [9:0]  BallY, 
    output logic [9:0]  BallS 
);
    

	 
    parameter [9:0] Ball_X_Center=50;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=414;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    logic [9:0] Ball_X_Motion;
    logic [9:0] Ball_X_Motion_next;
    logic [9:0] Ball_Y_Motion;
    logic [9:0] Ball_Y_Motion_next;

    logic [9:0] Ball_X_next;
    logic [9:0] Ball_Y_next;

    always_comb begin
        Ball_Y_Motion_next = Ball_Y_Motion; // set default motion to be same as prev clock cycle 
        Ball_X_Motion_next = Ball_X_Motion;

        //modify to control ball motion with the keycode
        if (keycode == 8'h1A) begin //the W key
        
            //first level ladders
        if((BallX > 300 && BallX < 315) || (BallX > 535 && BallX < 550)) begin
            if(BallY <= 415 && BallY > 354) begin
                Ball_Y_Motion_next = -10'd1;
                Ball_X_Motion_next = 10'd0;
            end else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //second level ladder
        else if(BallX > 100 && BallX < 115) begin
            if(BallY <= 355 && BallY > 294) begin
                Ball_Y_Motion_next = -10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //third level ladders
        else if((BallX > 250 && BallX < 265) || (BallX > 500 && BallX < 515)) begin
            if(BallY <= 295 && BallY > 234) begin
                Ball_Y_Motion_next = -10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //fourth level ladders
        else if((BallX > 120 && BallX < 135)||(BallX > 320 && BallX < 335)) begin
            if(BallY <= 235 && BallY > 174) begin
                Ball_Y_Motion_next = -10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //fifth level ladder
        else if(BallX > 535 && BallX < 550) begin
            if(BallY <= 190 && BallY > 114) begin
                Ball_Y_Motion_next = -10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
        end
            

        if (keycode == 8'h16) begin //the S key
        
            //first level ladder
        if((BallX > 300 && BallX < 315) || (BallX > 535 && BallX < 550)) begin
            if(BallY < 414 && BallY > 354) begin
                Ball_Y_Motion_next = 10'd1;
                Ball_X_Motion_next = 10'd0;
            end else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //second level ladder
        else if(BallX > 100 && BallX < 115) begin
            if(BallY < 354 && BallY > 294) begin
                Ball_Y_Motion_next = 10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //third level ladders
        else if((BallX > 250 && BallX < 265) || (BallX > 500 && BallX < 515)) begin
            if(BallY < 294 && BallY > 234) begin
                Ball_Y_Motion_next = 10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //fourth level ladders
        else if((BallX > 120 && BallX < 135)||(BallX > 320 && BallX < 335)) begin
            if(BallY < 234 && BallY > 174) begin
                Ball_Y_Motion_next = 10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
            
            //fifth level ladder
        else if(BallX > 535 && BallX < 550) begin
            if(BallY < 174 && BallY > 114) begin
                Ball_Y_Motion_next = 10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
        end
        
        
        if(keycode == 8'h04) begin //the A key
            if(BallY == 414 || BallY == 294 || BallY == 234 || BallY == 354 || BallY == 174 || BallY == 114) begin
            
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = -10'd2; end
            
            else if(BallY == 413 || BallY == 293 || BallY == 233 || BallY == 353 || BallY == 173 || BallY == 113) begin
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = -10'd2; end
            
            else if(BallY == 415 || BallY == 295 || BallY == 235 || BallY == 355 || BallY == 175 || BallY == 115)begin
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = -10'd2; end

        end
        
        
            
        if(keycode == 8'h07) begin//the D key
            if(BallY == 414 || BallY == 294 || BallY == 234 || BallY == 354 || BallY == 174 || BallY == 114) begin
            
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = 10'd2; end
            
            else if(BallY == 413 || BallY == 293 || BallY == 233 || BallY == 353 || BallY == 173 || BallY == 113) begin
            Ball_Y_Motion_next = 10'd1;
            Ball_X_Motion_next = 10'd2; end
            
            else if(BallY == 415 || BallY == 295 || BallY == 235 || BallY == 355 || BallY == 175 || BallY == 115)begin
            Ball_Y_Motion_next = -10'd1;
            Ball_X_Motion_next = 10'd2; end
        end
            
        if(keycode != 8'h04 && keycode != 8'h07) begin
            Ball_X_Motion_next = 10'd0;
        end
        
        if(keycode != 8'h1A && keycode != 8'h16) begin
            Ball_Y_Motion_next = 10'd0;
        end
       

       else
            Ball_Y_Motion = Ball_Y_Motion; //redundant last case to avoid inferred latches

    end

    assign BallS = 16;  // default ball size
    assign Ball_X_next = (BallX + Ball_X_Motion_next);
    assign Ball_Y_next = (BallY + Ball_Y_Motion_next);
   
    always_ff @(posedge frame_clk) //make sure the frame clock is instantiated correctly
    begin: Move_Ball
        if (Reset)
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
            
			BallY <= 414;
			BallX <= 50;
        end
        else 
        begin 

			Ball_Y_Motion <= Ball_Y_Motion_next; 
			Ball_X_Motion <= Ball_X_Motion_next; 

            BallY <= BallY + Ball_Y_Motion;  // Update ball position
            BallX <= BallX + Ball_X_Motion;
			
		end  
    end
    
    endmodule
