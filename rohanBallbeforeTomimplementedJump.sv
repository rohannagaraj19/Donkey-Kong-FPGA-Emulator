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
    
    //State machine states
    typedef enum logic { ON_GROUND, IN_AIR} state_t;
    state_t state, next_state;
    logic [6:0] counter;
    logic [9:0] floor;
    always_comb begin
        case(BallY)
        414: floor <= 414;
        354: floor <=354;
        294: floor <=294;
        234: floor<= 234;
        174: floor<= 174;
        114: floor<= 114;
        endcase 
    end

    always_comb begin
        Ball_Y_Motion_next = Ball_Y_Motion; // set default motion to be same as prev clock cycle 
        Ball_X_Motion_next = Ball_X_Motion;

        //modify to control ball motion with the keycode
        if (keycode == 8'h1A || keycode == 8'h52) begin //the W key or up arrow
        
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
        else if(BallX > 505 && BallX < 550) begin
            if(BallY <= 174 && BallY > 114) begin
                Ball_Y_Motion_next = -10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
        
 end //final end
            

        if (keycode == 8'h16 || keycode == 8'h51) begin //the S key or the down arrow
        
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
        else if(BallX > 515 && BallX < 530) begin
            if(BallY < 190 && BallY > 140) begin
                Ball_Y_Motion_next = 10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0;
            end
        end
        //peach ladder
        else if(BallX >(130+30+40-15) && BallX < 200) begin
            if(BallY < 180 && BallY > 100) begin
                Ball_Y_Motion_next = 10'd1;
                Ball_X_Motion_next = 10'd0; end
            else begin
                Ball_Y_Motion_next = 10'd0; end 
        
            end
        end
        
        
        if(keycode == 8'h04 || keycode == 8'h50) begin //the A key or the left arrow
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
        
        
            
        if(keycode == 8'h07 || keycode == 8'h4F) begin//the D key or the right arrow
            if(BallY == 414 || BallY == 294 || BallY == 234 || BallY == 354 || BallY == 174 || BallY == 114) begin //we should broaden the range of this
            
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
   
    always_ff @(posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
    begin 
        if (Reset)
        begin 
            state <= ON_GROUND;
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
            
			BallY <= Ball_Y_Center;
			BallX <= Ball_X_Center;
        end
        else 
        begin 

			//Ball_Y_Motion <= Ball_Y_Motion_next; 
			//Ball_X_Motion <= Ball_X_Motion_next; 

            BallY <= Ball_Y_next;  // Update ball position
            BallX <= Ball_X_next;
            unique case (state)
                ON_GROUND: begin
                BallY <= floor;
                    if(keycode[7:0] == 8'h1A) begin
                        state<= IN_AIR;
                        Ball_Y_Motion = -1;
                        counter = 0;
                    end
                  end
                IN_AIR: begin
                    if(counter != 10) begin
                    counter = counter +1; end
                    else begin 
                    Ball_Y_Motion = Ball_Y_Motion + 1;
                    if(BallY >= floor) begin
                        state = ON_GROUND;
                        BallY= floor;
                    end
                  end
               end 
            endcase    
                    
			
		end  
    end
    
    endmodule
    
    
    
    
    
   

   

