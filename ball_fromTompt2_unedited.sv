//////-------------------------------------------------------------------------
//////    Ball.sv                                                            --
//////    Viral Mehta                                                        --
//////    Spring 2005                                                        --
//////                                                                       --
//////    Modified by Stephen Kempf     03-01-2006                           --
//////                                  03-12-2007                           --
//////    Translated by Joe Meng        07-07-2013                           --
//////    Modified by Zuofu Cheng       08-19-2023                           --
//////    Modified by Satvik Yellanki   12-17-2023                           --
//////    Fall 2024 Distribution                                             --
//////                                                                       --
//////    For use with ECE 385 USB + HDMI Lab                                --
//////    UIUC ECE Department                                                --
//////-------------------------------------------------------------------------


////module  player 
////( 
////    input  logic        Reset, 
////    input  logic        frame_clk,
////    input  logic [7:0]  keycode,

////    output logic [9:0]  BallX, 
////    output logic [9:0]  BallY, 
////    output logic [9:0]  BallS 
////);
    

	 
////    parameter [9:0] Ball_X_Center=50;  // Center position on the X axis
////    parameter [9:0] Ball_Y_Center=414;  // Center position on the Y axis
////    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
////    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
////    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
////    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
////    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
////    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

////    logic [9:0] Ball_X_Motion;
////    logic [9:0] Ball_X_Motion_next;
////    logic [9:0] Ball_Y_Motion;
////    logic [9:0] Ball_Y_Motion_next;

////    logic [9:0] Ball_X_next;
////    logic [9:0] Ball_Y_next;
////    logic [9:0] ground_Y;
    
////    logic [6:0] counter;
    
////    typedef enum logic {ON_GROUND, IN_AIR} state_t;
////    typedef enum logic {UP, DOWN} dir_t;
////    dir_t state2;
////    state_t state;

////    always_comb begin
        
        
////        Ball_Y_Motion_next = Ball_Y_Motion; // set default motion to be same as prev clock cycle 
////        Ball_X_Motion_next = Ball_X_Motion;

////        //modify to control ball motion with the keycode
        
        
        
        
////        if (keycode == 8'h1A) begin //the W key
        
////            //first level ladders
////        if((BallX > 300 && BallX < 315) || (BallX > 535 && BallX < 550)) begin
////            if(BallY <= 415 && BallY > 354) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0;
////            end else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //second level ladder
////        else if(BallX > 100 && BallX < 115) begin
////            if(BallY <= 355 && BallY > 294) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //third level ladders
////        else if((BallX > 250 && BallX < 265) || (BallX > 500 && BallX < 515)) begin
////            if(BallY <= 295 && BallY > 234) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //fourth level ladders
////        else if((BallX > 120 && BallX < 135)||(BallX > 320 && BallX < 335)) begin
////            if(BallY <= 235 && BallY > 174) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //fifth level ladder
////        else if(BallX > 535 && BallX < 550) begin
////            if(BallY <= 190 && BallY > 114) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
////        end
            

////        if (keycode == 8'h16) begin //the S key
        
////            //first level ladder
////        if((BallX > 300 && BallX < 315) || (BallX > 535 && BallX < 550)) begin
////            if(BallY < 414 && BallY > 354) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0;
////            end else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //second level ladder
////        else if(BallX > 100 && BallX < 115) begin
////            if(BallY < 354 && BallY > 294) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //third level ladders
////        else if((BallX > 250 && BallX < 265) || (BallX > 500 && BallX < 515)) begin
////            if(BallY < 294 && BallY > 234) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //fourth level ladders
////        else if((BallX > 120 && BallX < 135)||(BallX > 320 && BallX < 335)) begin
////            if(BallY < 234 && BallY > 174) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
            
////            //fifth level ladder
////        else if(BallX > 535 && BallX < 550) begin
////            if(BallY < 174 && BallY > 114) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
////        end
        
        
////        if(keycode == 8'h04) begin //the A key
////            if(BallY == 414 || BallY == 294 || BallY == 234 || BallY == 354 || BallY == 174 || BallY == 114) begin
            
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = -10'd2; end
            
////            else if(BallY == 413 || BallY == 293 || BallY == 233 || BallY == 353 || BallY == 173 || BallY == 113) begin
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = -10'd2; end
            
////            else if(BallY == 415 || BallY == 295 || BallY == 235 || BallY == 355 || BallY == 175 || BallY == 115)begin
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = -10'd2; end

////        end
        
        
            
////        if(keycode == 8'h07) begin//the D key
////            if(BallY == 414 || BallY == 294 || BallY == 234 || BallY == 354 || BallY == 174 || BallY == 114) begin
            
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = 10'd2; end
            
////            else if(BallY == 413 || BallY == 293 || BallY == 233 || BallY == 353 || BallY == 173 || BallY == 113) begin
////            Ball_Y_Motion_next = 10'd1;
////            Ball_X_Motion_next = 10'd2; end
            
////            else if(BallY == 415 || BallY == 295 || BallY == 235 || BallY == 355 || BallY == 175 || BallY == 115)begin
////            Ball_Y_Motion_next = -10'd1;
////            Ball_X_Motion_next = 10'd2; end
////        end
            
////        if(keycode != 8'h04 && keycode != 8'h07) begin
////            Ball_X_Motion_next = 10'd0;
////        end
        
////        if(keycode != 8'h1A && keycode != 8'h16 && state == 0) begin
////            Ball_Y_Motion_next = 10'd0;
////        end
        
////        if(BallX < 22 && BallX > 618) begin
////            Ball_Y_Motion_next = 10'd3;
////        end
        
////        if(state == IN_AIR && state2 == UP) begin
////            Ball_Y_Motion_next = -10'd2;
////        end else if(state == IN_AIR && state2 == DOWN) begin
////            Ball_Y_Motion_next = 10'd2;
////        end
        

////       else
////            Ball_Y_Motion = Ball_Y_Motion; //redundant last case to avoid inferred latches
////    end

////    assign BallS = 16;  // default ball size
////    assign Ball_X_next = (BallX + Ball_X_Motion_next);
////    assign Ball_Y_next = (BallY + Ball_Y_Motion_next);
   
    
////    always_ff @(posedge frame_clk) begin
////        case(state) 
////            ON_GROUND: begin
////                counter <= 0;
////                if(keycode == 8'h08) begin
////                    ground_Y <= BallY;
                    
////                    state <= IN_AIR;
////                    state2 <= UP;
////                end 
////                end
            
////            IN_AIR: begin
                
////                if(counter < 16) begin
////                    state2 <= UP;
////                end else if(counter < 32) begin
////                    state2 <= DOWN;
////                end
////                counter = counter + 1;
////                if(counter == 16) begin
////                    state <= ON_GROUND;
////                end
////            end
////            endcase
    
////    end
   
////    always_ff @(posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
////    begin: Move_Ball 
////        begin 

////			Ball_Y_Motion <= Ball_Y_Motion_next; 
////			Ball_X_Motion <= Ball_X_Motion_next; 

////            BallY <= BallY + Ball_Y_Motion;  // Update ball position
////            BallX <= BallX + Ball_X_Motion;
            
////            if(Reset) begin
////                 Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
////			     Ball_X_Motion <= 10'd0; //Ball_X_Step;
            
////			     BallY <= 414;
////			     BallX <= 50;
			
////			     state <= ON_GROUND;
////			     state2 = UP;
////            end
            
            
//////            case(state)
//////                0: begin
//////                    BallY <= ground_Y;
//////                    if(keycode == 8'h2C) begin
//////                        ground_Y <= BallY;
//////                        Ball_Y_Motion_next = -10'd5;
//////                        counter = 0;
//////                        state = 1;
//////                    end
//////                end
//////                1: begin
//////                    if(counter != 8) begin
//////                        counter = counter + 1;
//////                    end else begin
//////                        Ball_Y_Motion_next = Ball_Y_Motion_next + 1;
//////                        if(BallY > ground_Y) begin
//////                            state = 0;
//////                            BallY = ground_Y;
//////                            counter = 0;
//////                        end
//////                    end
                
//////                end
//////            endcase
        
////        end
////    end	  
////endmodule

//module  player
//(
//    input  logic        Reset,
//    input  logic        frame_clk,
//    input  logic [7:0]  keycode,

//    output logic [9:0]  BallX,
//    output logic [9:0]  BallY,
//    output logic [9:0]  BallS,
//    input logic [7:0] keycode2,
//    output logic test,
//    output logic [2:0] stateid,
//    output logic [9:0] floortest
//);
   


//    parameter [9:0] Ball_X_Center=50;  // Center position on the X axis
//    parameter [9:0] Ball_Y_Center=414;  // Center position on the Y axis
//    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
//    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
//    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
//    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
//    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
//    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

//    logic [9:0] Ball_X_Motion;
//    logic [9:0] Ball_Y_Motion;
//    logic [9:0] Ball_X_Motion_next;
//    logic [9:0] Ball_Y_Motion_next;

//    logic [9:0] Ball_X_next;
//    logic [9:0] Ball_Y_next;
   
//    //State machine states
//    typedef enum logic [1:0] { ON_GROUND, IN_AIR, LADDER} state_t;
//    state_t state;
//    logic [6:0] counter;
//    logic [9:0] floor = 10'd414;

    
//    always_comb begin
//        //80 < X < 560 is the middle area where there is always ground
//        //30 to 610 is where there may or may not be a platform
//        if(BallX > 72 && BallX < 568) begin
//            case(BallY)
//                10'd414: floor = 10'd414;
//                10'd413: floor = 10'd414;
//                10'd354: floor = 10'd354;
//                10'd353: floor = 10'd354;
//                10'd294: floor = 10'd294;
//                10'd293: floor = 10'd294;
//                10'd234: floor = 10'd234;
//                10'd233: floor = 10'd234;
//                10'd174: floor = 10'd174;
//                10'd173: floor = 10'd174;
//                10'd114: floor = 10'd114;
//                10'd113: floor = 10'd114;
//            endcase
//        end
//        else if(BallX >= 568 && BallX < 618) begin //right side
//            if(BallY <= 415 && BallY > 295) begin
//                floor = 10'd414;
//            end else if(BallY <= 295 && BallY > 177) begin
//                floor = 10'd294;
//            end else if(BallY <= 175) begin
//                floor = 10'd174;
//            end
//        end 
//        else if(BallX <= 72 && BallX >22) begin
//            if(BallY <= 415 && BallY > 357) begin
//                floor = 10'd414;
//            end else if(BallY <= 355 && BallY > 237) begin
//                floor = 10'd354;
//            end else if(BallY <= 235 && BallY > 117) begin
//                floor = 10'd234;
//            end else if(BallY <= 115) begin
//                floor = 10'd114;
//            end
//        end else begin //outside player boundaries
//            floor = 10'd464;
//        end
//    end
    
//    logic w, a, s, d, space;
    
//    always_comb begin //get keycodes
//        if(keycode == 8'h04 || keycode2 == 8'h04) begin
//            if(keycode != 8'h07 && keycode2 != 8'h07) begin
//                a = 1'b1;
//            end else begin
//                a = 1'b0;
//                d = 1'b0;
//            end
//        end else begin
//            a = 1'b0;
//        end
//        if(keycode == 8'h07 || keycode2 == 8'h07) begin
//            if(keycode != 8'h04 && keycode2 != 8'h04) begin
//                d = 1'b1;
//            end else begin
//                a = 1'b0;
//                d = 1'b0;
//            end
//        end else begin
//            d = 1'b0;
//        end
//        if(keycode == 8'h2c || keycode2 == 8'h2c) begin
//            space = 1'b1;
//        end else begin
//            space = 1'b0;
//        end
//        if(keycode == 8'h1A || keycode2 == 8'h1A) begin
//            if(keycode != 8'h2c && keycode2 != 8'h2c) begin
//                w = 1'b1;
//            end else begin
//                w = 1'b0;
//            end
//        end else begin
//            w = 1'b0;
//        end
//        if(keycode == 8'h16 || keycode2 == 8'h16) begin
//            if(keycode != 8'h2c && keycode2 != 8'h2c) begin
//                if(keycode != 8'h1A && keycode2 != 8'h1A) begin
//                    s = 1'b1;
//                end else begin
//                    s = 1'b0;
//                end
//            end else begin
//                s = 1'b0;
//            end
            
//        end else begin
//            s = 1'b1;
//        end
//    end


//    always_comb begin
//        Ball_Y_Motion_next = Ball_Y_Motion; //default motion
        
            
            
//            if(w) begin
            
//            if(state == ON_GROUND) begin
            
//            //first level ladders
//                if(BallX > 300 && BallX < 315 && BallY <= 415 && BallY > 354) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else
//                if(BallX > 535 && BallX < 550 && BallY <= 415 && BallY > 354) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else
            
//            //second level ladder
//                if(BallX > 100 && BallX < 115 && BallY <= 355 && BallY > 294) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else 
            
//            //third level ladders
//                if(BallX > 250 && BallX < 265 && BallY <= 295 && BallY > 234) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else 
//                if(BallX > 500 && BallX < 515 && BallY <= 295 && BallY > 234) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else 
            
//            //fourth level ladders
//                if(BallX > 120 && BallX < 135 && BallY <= 235 && BallY > 174) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else 
//                if(BallX > 320 && BallX < 335 && BallY <= 235 && BallY > 174) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else 
            
//            //fifth level ladder
//                if(BallX > 515 && BallX < 520 && BallY <= 175 && BallY > 114) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else begin //not on any ladders
//                    Ball_Y_Motion_next = 10'd0;
//                end
//                end
//            end else if (s) begin
//                if(state == ON_GROUND) begin
            
//             //first level ladders
//                if(BallX > 300 && BallX < 315 && BallY < 414 && BallY > 354) begin
//                    Ball_Y_Motion_next = 10'd1;
//                end else
//                if(BallX > 535 && BallX < 550 && BallY < 414 && BallY > 354) begin
//                    Ball_Y_Motion_next = 10'd1;
//                end else
            
//            //second level ladder
//                if(BallX > 100 && BallX < 115 && BallY < 354 && BallY > 294) begin
//                    Ball_Y_Motion_next = 10'd1;
//                end else 
            
//            //third level ladders
//                if(BallX > 250 && BallX < 265 && BallY < 294 && BallY > 234) begin
//                    Ball_Y_Motion_next = 10'd1;
//                end else 
//                if(BallX > 500 && BallX < 515 && BallY < 294 && BallY > 234) begin
//                    Ball_Y_Motion_next = 10'd1;
//                end else 
            
//            //fourth level ladders
//                if(BallX > 120 && BallX < 135 && BallY < 234 && BallY > 174) begin
//                    Ball_Y_Motion_next = 10'd1;
//                end else 
//                if(BallX > 320 && BallX < 335 && BallY < 234 && BallY > 174) begin
//                    Ball_Y_Motion_next = 10'd1;
//                end else 
            
//            //fifth level ladder
//                if(BallX > 515 && BallX < 520 && BallY <= 175 && BallY > 114) begin
//                    Ball_Y_Motion_next = -10'd1;
//                end else begin //not on any ladders
//                    Ball_Y_Motion_next = 10'd0;
//                end
                
//                end
          
//            end else if (a) begin
//                if(state == ON_GROUND || state == IN_AIR) begin
//                    Ball_X_Motion_next = -10'd2;
//                end
//            end else if(d) begin
//                if(state == ON_GROUND || state == IN_AIR) begin
//                    Ball_X_Motion_next = 10'd2;
//                end
            
//            end
            
            
        
            
            

////        //modify to control ball motion with the keycode
////        if (keycode == 8'h1A || keycode == 8'h52) begin //the W key or up arrow
       
////            //first level ladders
////        if((BallX > 300 && BallX < 315) || (BallX > 535 && BallX < 550)) begin
////            if(BallY <= 415 && BallY > 354) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0;
////            end else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //second level ladder
////        else if(BallX > 100 && BallX < 115) begin
////            if(BallY <= 355 && BallY > 294) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //third level ladders
////        else if((BallX > 250 && BallX < 265) || (BallX > 500 && BallX < 515)) begin
////            if(BallY <= 295 && BallY > 234) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //fourth level ladders
////        else if((BallX > 120 && BallX < 135)||(BallX > 320 && BallX < 335)) begin
////            if(BallY <= 235 && BallY > 174) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //fifth level ladder
////        else if(BallX > 505 && BallX < 550) begin
////            if(BallY <= 174 && BallY > 114) begin
////                Ball_Y_Motion_next = -10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
       
//// end //final end
           

////        if (keycode == 8'h16 || keycode == 8'h51) begin //the S key or the down arrow
       
////            //first level ladder
////        if((BallX > 300 && BallX < 315) || (BallX > 535 && BallX < 550)) begin
////            if(BallY < 414 && BallY > 354) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0;
////            end else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //second level ladder
////        else if(BallX > 100 && BallX < 115) begin
////            if(BallY < 354 && BallY > 294) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //third level ladders
////        else if((BallX > 250 && BallX < 265) || (BallX > 500 && BallX < 515)) begin
////            if(BallY < 294 && BallY > 234) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //fourth level ladders
////        else if((BallX > 120 && BallX < 135)||(BallX > 320 && BallX < 335)) begin
////            if(BallY < 234 && BallY > 174) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
           
////            //fifth level ladder
////        else if(BallX > 505 && BallX < 550) begin
////            if(BallY < 174 && BallY > 114) begin
////                Ball_Y_Motion_next = 10'd1;
////                Ball_X_Motion_next = 10'd0; end
////            else begin
////                Ball_Y_Motion_next = 10'd0;
////            end
////        end
//////        end
       
////        if(keycode == 8'h04 || keycode2 == 8'h04) begin //the A key or the left arrow
////            if(BallY == 414 || BallY == 294 || BallY == 234 || BallY == 354 || BallY == 174 || BallY == 114) begin
           
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = -10'd2; end
           
////            else if(BallY == 413 || BallY == 293 || BallY == 233 || BallY == 353 || BallY == 173 || BallY == 113) begin
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = -10'd2; end
           
////            else if(BallY == 415 || BallY == 295 || BallY == 235 || BallY == 355 || BallY == 175 || BallY == 115)begin
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = -10'd2; end

////        end
       
       
           
////        if(keycode == 8'h07 || keycode2 == 8'h07) begin//the D key or the right arrow
////            if(BallY == 414 || BallY == 294 || BallY == 234 || BallY == 354 || BallY == 174 || BallY == 114) begin //we should broaden the range of this
           
////            Ball_Y_Motion_next = 10'd0;
////            Ball_X_Motion_next = 10'd2; end
           
////            else if(BallY == 413 || BallY == 293 || BallY == 233 || BallY == 353 || BallY == 173 || BallY == 113) begin
////            Ball_Y_Motion_next = 10'd1;
////            Ball_X_Motion_next = 10'd2; end
           
////            else if(BallY == 415 || BallY == 295 || BallY == 235 || BallY == 355 || BallY == 175 || BallY == 115)begin
////            Ball_Y_Motion_next = -10'd1;
////            Ball_X_Motion_next = 10'd2; end
////        end
           
////        if(keycode != 8'h04 && keycode != 8'h07) begin
////            Ball_X_Motion_next = 10'd0;
////        end
    
       
       

////       else
////            Ball_Y_Motion = Ball_Y_Motion; //redundant last case to avoid inferred latches
        
//    end

//    assign BallS = 16;  // default ball size
//    assign Ball_X_next = (BallX + Ball_X_Motion);
//    assign Ball_Y_next = (BallY + Ball_Y_Motion);
//    assign test = d;
//    assign floortest = floor;
//    logic ground;
   
//    always_ff @(posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
//    begin
//        if (Reset)
//        begin
//            state <= ON_GROUND;
//            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
//            Ball_X_Motion <= 10'd0; //Ball_X_Step;
//            Ball_X_Motion_next <= 10'd0;
           
//            BallY <= Ball_Y_Center;
//            BallX <= Ball_X_Center;
//            floor <= 10'd414;

//        end
//        else
//        begin

////Ball_Y_Motion <= Ball_Y_Motion_next;
////Ball_X_Motion <= Ball_X_Motion_next;

//            BallY <= Ball_Y_next;  // Update ball position
//            BallX <= Ball_X_next;
//            Ball_Y_Motion <= Ball_Y_Motion_next;
//            Ball_X_Motion <= Ball_X_Motion_next;
            

//            unique case (state)
//                ON_GROUND: begin
//                counter = 0;
//                if(space) begin
//                    state <= IN_AIR;
//                    Ball_Y_Motion <= -10'd3;
//                end
//                if(BallX <= 22 || BallX >= 618) begin
//                    state <= IN_AIR;
//                end
//                if(BallX > 22 && BallX <= 72) begin
//                    if(BallY < floor) begin
//                        state <= IN_AIR;
//                    end
//                end
//                if(BallX <618 && BallX >= 568) begin
//                    if(BallY < floor ) begin
//                        state <= IN_AIR;
//                    end
//                end
                   
//                   case(floor) 
//                        10'd414: BallY = floor;
//                        10'd354: BallY = floor;
//                        10'd294: BallY = floor;
//                        10'd234: BallY = floor;
//                        10'd174: BallY = floor;
//                        10'd114: BallY = floor;
//                        10'd464: BallY = floor;
//                   endcase
//                  end
//                IN_AIR: begin
//                    if(BallY > floor || BallY + Ball_Y_Motion > floor) begin
//                        BallY <= floor;
//                        Ball_Y_Motion = 10'd0;
//                        state <= ON_GROUND;
//                    end
//                    if(counter != 6) begin
//                        counter = counter +1; end
//                    else begin
//                    Ball_Y_Motion = Ball_Y_Motion + 1;
//                    counter = 0;
                    
//                  end
//               end
//               LADDER: begin
//                    Ball_X_Motion = 10'd0;
//                    if((BallY == floor || BallY+1 == floor || BallY-1 == floor)&& !w && !d) begin
//                            state <= ON_GROUND;
//                    end
//                    if(w) begin
//                        Ball_Y_Motion = -10'd1;
//                    end else if(d) begin
//                        Ball_Y_Motion = 10'd1;
//                    end
                    
//                    else begin
//                        Ball_Y_Motion = 10'd0;
//                    end
//               end
//            endcase    
                   

//        end  
//    end
    
//    logic [2:0] testie;
//    assign stateid = testie;
// always_comb begin
//    if(state == ON_GROUND) begin
//        testie = 3'b001;
//    end else if (state == IN_AIR) begin 
//        testie = 3'b010;
//    end else if (state == LADDER) begin
//        testie = 3'b100;
//    end
//end
   
//    endmodule

module  player
(
    input  logic        Reset,
    input  logic        frame_clk,
    input  logic [7:0]  keycode,
    input logic [7:0] keycode2,

    output logic [9:0]  BallX,
    output logic [9:0]  BallY,
    output logic [9:0]  BallS,
    output logic test,
    output logic [2:0] stateid,
    output logic [9:0] floortest
);
   


    parameter [9:0] Ball_X_Center=50;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=414;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    logic [17:0] Ball_X_Motion;
    logic [17:0] Ball_X_Motion_next;
    logic [17:0] Ball_Y_Motion;
    logic [17:0] Ball_Y_Motion_next;

    logic [17:0] Ball_X_next;
    logic [17:0] Ball_Y_next;
    assign floortest = floor;
    assign test = s;
    //debug info
    logic [2:0] testie;
    assign stateid = testie;
 always_comb begin
    if(state == ON_GROUND) begin
        testie[1:0] = 2'b01;
    end else if (state == IN_AIR) begin 
        testie[1:0]= 3'b010;
    end
    testie[2] = climb;
end
   
   logic ladder;
   logic climb;
   
   logic w, a, s, d, space;
    
    always_comb begin //get keycodes
        if(keycode == 8'h04 || keycode2 == 8'h04) begin
            if(keycode != 8'h07 && keycode2 != 8'h07) begin
                a = 1'b1;
            end else begin
                a = 1'b0;
                d = 1'b0;
            end
        end else begin
            a = 1'b0;
        end
        if(keycode == 8'h07 || keycode2 == 8'h07) begin
            if(keycode != 8'h04 && keycode2 != 8'h04) begin
                d = 1'b1;
            end else begin
                a = 1'b0;
                d = 1'b0;
            end
        end else begin
            d = 1'b0;
        end
        if(keycode == 8'h2c || keycode2 == 8'h2c) begin
            space = 1'b1;
        end else begin
            space = 1'b0;
        end
        if(keycode == 8'h1A || keycode2 == 8'h1A) begin
            if(keycode != 8'h2c && keycode2 != 8'h2c) begin
                w = 1'b1;
            end else begin
                w = 1'b0;
            end
        end else begin
            w = 1'b0;
        end
        if(keycode == 8'h16 || keycode2 == 8'h16) begin
            if(keycode != 8'h2c && keycode2 != 8'h2c) begin
                if(keycode != 8'h1A && keycode2 != 8'h1A) begin
                    s = 1'b1;
                end else begin
                    s = 1'b0;
                end
            end else begin
                s = 1'b0;
            end
            
        end else begin
            s = 1'b0;
        end
    end
    
    
    //State machine states
    typedef enum logic { ON_GROUND, IN_AIR} state_t;
    state_t state, next_state;
    logic [6:0] counter;
    logic [17:0] floor;
    
    always_comb begin
        Ball_Y_Motion_next = Ball_Y_Motion; // set default motion to be same as prev clock cycle
        Ball_X_Motion_next = Ball_X_Motion;
        

       
        if(a) begin //the A key or the left arrow
            if(climb) begin
                Ball_X_Motion_next = 10'd0;
            end else Ball_X_Motion_next = -10'd2;
            

        end
       
       
           
        if(d) begin//the D key or the right arrow
            if(climb) begin
                Ball_X_Motion_next = 10'd0;
            end else Ball_X_Motion_next = 10'd2;
        end
           
        if(!(a || d)) begin
            Ball_X_Motion_next = 10'd0;
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
            
            ladder <= 0;
            climb <= 0;
        end
        else
        begin

//            Ball_Y_Motion <= Ball_Y_Motion_next;
//            Ball_X_Motion <= Ball_X_Motion_next;

            BallY <= Ball_Y_next;  // Update ball position
            BallX <= Ball_X_next;
            
            //ladder
            if(BallX > 300 && BallX < 315 && BallY <= 415 && BallY > 354) begin
                ladder <= 1;
            end else if(BallX > 535 && BallX < 550 && BallY <= 415 && BallY > 354) begin
                ladder <= 1;
            end else if(BallX > 100 && BallX < 115 && BallY <= 355 && BallY > 294) begin
                ladder <= 1;
            end else if(BallX > 250 && BallX < 265 && BallY <= 295 && BallY > 234) begin
                ladder <= 1;
            end else if(BallX > 500 && BallX < 515 && BallY <= 295 && BallY > 234) begin
                ladder <= 1;
            end else if(BallX > 120 && BallX < 135 && BallY <= 235 && BallY > 174) begin
                ladder <= 1;
            end else if(BallX > 320 && BallX < 335 && BallY <= 235 && BallY > 174) begin
                ladder <= 1;
            end else if(BallX > 515 && BallX < 530 && BallY <= 175 && BallY > 114) begin
                ladder <= 1;
            end else if(BallX > 185 && BallX < 200 && BallY <= 115 && BallY > 74) begin
                ladder <= 1;
            end else
            ladder <= 0;
            
            //floor
            if(BallX > 618 || BallX < 22) begin
                floor = 10'd464; //the mario should fall to the bottom of the screen
            end else if((BallX >= 25 && BallX <= 615 && BallY <= 417 && BallY > 370) || (BallX > 565 && BallX <= 615 && BallY <= 417 && BallY > 310)) begin
                floor = 10'd414;
            end else if((BallX >= 25 && BallX <= 565 && BallY <= 357 && BallY > 310) || (BallX >= 25 && BallX < 75 && BallY <= 357 && BallY > 250)) begin
                floor = 10'd354;
            end else if((BallX >= 75 && BallX <= 615 && BallY <= 297 && BallY > 250) || (BallX > 565 && BallX <= 615 && BallY <= 297 && BallY > 190)) begin
                floor = 10'd294;
            end else if((BallX <= 565 && BallY <= 237 && BallY > 190) || (BallX < 75 && BallY <= 237 && BallY > 130)) begin
                floor = 10'd234;
            end else if((BallX >= 75 && BallY <= 177 && BallY > 130) || (BallX > 565 && BallY <= 177)) begin
                floor = 10'd174;
            end else if((BallX > 205 && BallY <= 117)|| (BallY <= 117 && BallY > 90) || (BallY <= 117 && BallX < 120)) begin
                floor = 10'd114;
            end else if(BallX >= 120 && BallX <= 205 && BallY <= 77) begin
                floor = 10'd74;
            end else begin
                floor = floor;
            end
            

            
            
            unique case (state)
                ON_GROUND: begin
                
                    if (w) begin //the W key or up arrow
                        if(ladder) begin
                            Ball_Y_Motion <= -10'd1;
                        end else Ball_Y_Motion <= 0;
                    end
                       
            
                    if (s) begin //the S key or the down arrow
                        if(ladder && (BallY != floor)) begin
                            Ball_Y_Motion <= 10'd1;
                        end else Ball_Y_Motion <= 0;
                    end
                    
                    if(ladder) begin
                        if(w||s) begin
                            climb <= 1;
                        end else begin
                            if(!space) begin
                                Ball_Y_Motion <= 0;
                                climb <= climb;
                            end
                        end
                    end else climb <= 0;
                
                    if(!climb) begin
                        
                        
                        if(BallY < floor)begin
                            state<= IN_AIR;
                            Ball_Y_Motion <= 0;
                        end
                        else BallY <= floor;
                        
                        if(space) begin
                            state<= IN_AIR;
                            Ball_Y_Motion = -4;
                            counter = 0;
                        end else Ball_Y_Motion = 0;
                    end
                    
                  end
                IN_AIR: begin
                    climb <= 0;
                    if(w||s) begin
                        if(ladder) begin
                            state <= ON_GROUND;
                            climb <= 1;
                            Ball_Y_Motion <= 0;
                        end
                    end
                    if(counter != 8) begin
                        counter = counter +1; end
                    else begin
                        Ball_Y_Motion = Ball_Y_Motion + 1;
                        if(BallY > floor || BallY + Ball_Y_Motion > floor) begin
                            state <= ON_GROUND; 
                            BallY <= floor;
                        end
                    end
               end
            endcase    
                   

end  
    end
   
    endmodule