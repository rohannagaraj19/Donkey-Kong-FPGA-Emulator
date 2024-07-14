//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//                                                                       --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input  logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size, BarrelX, BarrelY, Barrel_size,
                        //Barrel2X, Barrel2Y, Barrel3X, Barrel3Y, Barrel4X, Barrel4Y, Barrel5X, Barrel5Y,
                        Barrel2X, Barrel2Y,
                        input logic a, input logic d, pngClk, frame_clk, reset,
                        input logic [1:0] lifecount,
                        output logic [15:0] out,
                       output logic [3:0]  Red, Green, Blue );
    
    logic ball_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*BallS, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))
       )

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 120 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
    assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
    logic [5:0] addr;
    logic [13:0] data;
    
    logic [15:0] counter;
    logic [9:0] timer;
    
    assign out[15:0] = counter;
    logic left; 
    
    always_ff@(posedge frame_clk or posedge reset) begin
        if(reset) begin
            counter <= 6059;
            left <= 0;
        end
        else begin
        
            if(d) //look right
                left <= 0;
            else if(a)
                left <= 1;
            else 
                left <= left;
        
            if(counter != 0)
                counter <= counter - 1; 
            timer <= counter/60;
        end
    end
    
    
    
    logic [3:0] hundreds, tens, ones;
    
    logic [10:0] fontaddr;
    logic [10:0] zero_offset = 10'h30;
    logic [7:0] fontdata;
    
    font_rom font(
        .addr(fontaddr),
        .data(fontdata)
    );
    
    logic font_pixel;
    
    
    
    always_comb begin
        if(DrawX < 24 && DrawX >= 0 && DrawY >= 0 && DrawY < 16) begin
            //get values
            ones = timer %10;
            tens = (timer%100)/10;
            hundreds = timer/100;
            
            if(DrawX <8) begin //get hundreds place
                fontaddr = 16*(hundreds + zero_offset) + DrawY;
                font_pixel = fontdata[7-DrawX]; 
            end else if(DrawX < 16) begin
                fontaddr = 16*(tens + zero_offset) + DrawY;
                font_pixel = fontdata[7-DrawX%8];
            end else begin
                fontaddr = 16*(ones + zero_offset) + DrawY;
                font_pixel = fontdata[7-DrawX%8];
            end 
            
        end else 
                font_pixel = 0;
    end
    
    ladder_sprite ladder(
            .addr,
            .data
        );
        
        mario_sprite mario(
            .X,
            .Y,
            .pal
        );
        
        mario_sprite life3mario(
            .X(X3),
            .Y(Y3),
            .pal(pal3)
        );
        
        mario_sprite life2mario(
            .X(X2),
            .Y(Y2),
            .pal(pal2)
        );
        
        mario_sprite life1mario(
            .X(X1),
            .Y(Y1),
            .pal(pal1)
        );
        
    logic [3:0] X, Y;
    logic [1:0] pal;
    
    logic [3:0] X3, Y3;
    logic [1:0] pal3;
    
    logic [3:0] X2, Y2;
    logic [1:0] pal2;
    
    logic [3:0] X1, Y1;
    logic [1:0] pal1;
    //barrel generation
    logic Barrel_on;
    int b1DistX, b1DistY, bsize;
    assign b1DistX = DrawX - BarrelX;
    assign b1DistY = DrawY - BarrelY;
    assign bsize = Barrel_size;
    always_comb
    begin:Barrel_on_proc
    if((b1DistX*b1DistX + b1DistY*b1DistY) <= (bsize*bsize)) begin
       Barrel_on = 1'b1; end
    else begin 
        Barrel_on = 1'b0; end
    end 
    
    //barrel2 generation
    logic Barrel2_on;
    int b2DistX, b2DistY;
    assign b2DistX = DrawX - Barrel2X;
    assign b2DistY = DrawY - Barrel2Y;
    always_comb
    begin:Barrel2_on_proc
    if((b2DistX*b2DistX + b2DistY*b2DistY) <= (bsize*bsize)) begin
       Barrel2_on = 1'b1; end
    else begin 
        Barrel2_on = 1'b0; end
    end
    
    
    //life counter generation
    logic on3, on2, on1; //determines if the mario in the corner appears
    
    
    always_comb begin
        if(DrawY >= 0 && DrawY < 32 && DrawX >= (640-96) && DrawX <640) begin
            if(DrawX >= (640-32)) begin
                X1 = 15-(DrawX-(640-32))/2;
                Y1 = (DrawY%32)/2;
            end else if(DrawX >= (640-64)) begin
                X2 = 15-(DrawX-(640-64))/2;
                Y2 = (DrawY%32)/2;
            end else if(DrawX >= (640-96)) begin
                X3 = 15-(DrawX - (640-96))/2;
                Y3 = (DrawY%32)/2;
            end
        end
        
        case(lifecount) 
            2'b00: begin
                on3 = 0;
                on2 = 0;
                on1 = 0;
            end
            
            2'b01: begin
                on3 = 0;
                on2 = 0;
                on1 = 1;
            end
            2'b10: begin
                on3 = 0;
                on2 = 1;
                on1 = 1;
            end
            2'b11: begin
                on3 = 1;
                on2 = 1;
                on1 = 1;
            end
        endcase
    end
    
  
    always_comb
    begin:Ball_on_proc
    if(!left) begin
        if ((DrawX >= BallX - Ball_size/2)&&(DrawX <= BallX + Ball_size/2)&&(DrawY >= BallY)&&(DrawY < BallY + Ball_size)) begin
            X = 15 - ((DrawX - BallX + 8));
            Y = (DrawY - BallY);
            if(pal == 2'b00) begin
                ball_on = 1'b0; end 
                else begin
                ball_on = 1'b1; end
        end 
        else begin
            ball_on = 1'b0;
        end
        end
        
   else begin
       if ((DrawX >= BallX - Ball_size/2)&&(DrawX <= BallX + Ball_size/2)&&(DrawY >= BallY)&&(DrawY < BallY + Ball_size)) begin
            X = (DrawX - BallX + 8);
            Y = (DrawY - BallY);
            if(pal == 2'b00) begin
                ball_on = 1'b0;end  
                else begin
                ball_on = 1'b1; end
            end 
            else begin
                ball_on = 1'b0;
            end
        end
        
    end
     
    
      
     logic [11:0] mario_red = 12'hd31;
     logic [11:0] mario_darkbrown = 12'hA50;
     logic [11:0] mario_lightbrown = 12'hD80;
      
       
    always_comb
    begin:RGB_Display
        if (ball_on == 1'b1) begin 
            case(pal)
            2'b01: begin //red
                Red = mario_red[11:8];
                Green = mario_red[7:4];
                Blue = mario_red[3:0];
            end
            2'b10: begin //dark brown
                Red = mario_darkbrown[11:8];
                Green = mario_darkbrown[7:4];
                Blue = mario_darkbrown[3:0];
            end
            2'b11: begin //light brown
                Red = mario_lightbrown[11:8];
                Green = mario_lightbrown[7:4];
                Blue = mario_lightbrown[3:0];
            end
            endcase
        end    
        //barrels
        
        else if(Barrel_on == 1'b1) begin
            Red = 4'hD;
            Green = 4'h6;
            Blue = 4'h0; end 
            
        else if(Barrel2_on == 1'b1) begin
            Red = 4'hD;
            Green = 4'h6;
            Blue = 4'h0; end
        
        //counter
        else if(font_pixel == 1) begin
            Red = 4'hF;
            Green = 4'hF;
            Blue = 4'hF;
        end
        
        //life counter
        else if(DrawX >= (640-96) && DrawX < 640 && DrawY >= 0 && DrawY < 32) begin
            if(DrawX >= (640-32)) begin
                if(!on1) begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end else begin
                //looking at pal(1)
                    case(pal1) 
                        2'b00: begin
                            Red = 4'h0;
                            Green = 4'h0;
                            Blue = 4'h0;
                        end
                        2'b01: begin
                            Red = mario_red[11:8];
                            Green = mario_red[7:4];
                            Blue = mario_red[3:0];
                        end
                        2'b10: begin
                            Red = mario_darkbrown[11:8];
                            Green = mario_darkbrown[7:4];
                            Blue = mario_darkbrown[3:0];
                        end
                        2'b11: begin
                            Red = mario_lightbrown[11:8];
                            Green = mario_lightbrown[7:4];
                            Blue = mario_lightbrown[3:0];
                        end
                    endcase
                end
            end else if(DrawX >= (640-64)) begin
                if(!on2) begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end else begin
                //looking at pal(2)
                    case(pal2) 
                        2'b00: begin
                            Red = 4'h0;
                            Green = 4'h0;
                            Blue = 4'h0;
                        end
                        2'b01: begin
                            Red = mario_red[11:8];
                            Green = mario_red[7:4];
                            Blue = mario_red[3:0];
                        end
                        2'b10: begin
                            Red = mario_darkbrown[11:8];
                            Green = mario_darkbrown[7:4];
                            Blue = mario_darkbrown[3:0];
                        end
                        2'b11: begin
                            Red = mario_lightbrown[11:8];
                            Green = mario_lightbrown[7:4];
                            Blue = mario_lightbrown[3:0];
                        end
                    endcase
                end
            end else begin
                if(!on3) begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end else begin
                //looking at pal(3)
                    case(pal3) 
                        2'b00: begin
                            Red = 4'h0;
                            Green = 4'h0;
                            Blue = 4'h0;
                        end
                        2'b01: begin
                            Red = mario_red[11:8];
                            Green = mario_red[7:4];
                            Blue = mario_red[3:0];
                        end
                        2'b10: begin
                            Red = mario_darkbrown[11:8];
                            Green = mario_darkbrown[7:4];
                            Blue = mario_darkbrown[3:0];
                        end
                        2'b11: begin
                            Red = mario_lightbrown[11:8];
                            Green = mario_lightbrown[7:4];
                            Blue = mario_lightbrown[3:0];
                        end
                    endcase
                end
            end
        end
        
        
        
        //BACKGROUND
        
        //first level
        else if(DrawX > 30 && DrawX < 610 && DrawY >= 430 && DrawY <= 440)  begin 
            Red = 4'hB; 
            Green = 4'h0;
            Blue = 4'h4;
        end 
        
        
        //second level
        else if(DrawX > 30 && DrawX < 560 && DrawY >= 370 && DrawY <= 380) begin
            Red = 4'hB; 
            Green = 4'h0;
            Blue = 4'h4;        
        end
        
        
        //third level
        else if(DrawX > 80 && DrawX < 610 && DrawY >= 310 && DrawY <= 320) begin
            Red = 4'hB; 
            Green = 4'h0;
            Blue = 4'h4;        
        end
        
        
        //fourth level
        else if(DrawX > 30 && DrawX < 560 && DrawY >= 250 && DrawY <= 260) begin
            Red = 4'hB; 
            Green = 4'h0;
            Blue = 4'h4;        
        end
        
        
        //fifth level
        else if(DrawX > 80 && DrawX < 610 && DrawY >= 190 && DrawY <= 200) begin
            Red = 4'hB; 
            Green = 4'h0;
            Blue = 4'h4;        
        end
        
        
        //sixth level - top
        else if(DrawX > 30 && DrawX < 560 && DrawY >= 130 && DrawY <= 140) begin
            Red = 4'hB; 
            Green = 4'h0;
            Blue = 4'h4;        
        end
        
       //peach platform
       else if(DrawX>125 && DrawX<200 && DrawY>= 90 && DrawY <= 100)begin
            Red = 4'hB; 
            Green = 4'h0;
            Blue = 4'h4;  
       end 
        

        


                //first level ladders
       else if(DrawY < 430 && DrawY >= 380) begin
            addr = DrawY-380;
            if(DrawX > 300 && DrawX < 315) begin
                if(data[DrawX%301] == 1) begin
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            end
            else if(DrawX > 535 && DrawX < 550) begin
                if(data[DrawX%536] == 1) begin
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
                
            end
        end
        
        //second level ladder
        else if(DrawY < 370 && DrawY >= 320) begin
            addr = DrawY-320;
            if(DrawX  > 100 && DrawX < 115) begin
                if(data[DrawX%101] == 1) begin
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
        end
        

        
        //third level ladders
        else if(DrawY < 310 && DrawY >= 260) begin
            addr = DrawY-260;
            if(DrawX > 250 && DrawX < 265) begin
                if(data[DrawX%251] == 1) begin 
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            end else if(DrawX > 500 && DrawX < 515) begin
                if(data[DrawX%501] == 1) begin 
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
        end
        
        //fourth level ladders
        else if(DrawY < 250 && DrawY >= 200) begin
            addr = DrawY-200;
            if(DrawX > 120 && DrawX < 135) begin
                if(data[DrawX%121] == 1) begin
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            end else if(DrawX < 320 && DrawX >= 335) begin
                if(data[DrawX%321] == 1) begin
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end        
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
            
        end
        
        //fifth level ladder
        else if(DrawY < 190 && DrawY >= 140) begin
            addr = DrawY - 140;
            if(DrawX > 515 && DrawX < 530)begin
                if(data[DrawX%516] == 1) begin
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
        end
        
        //peach ladder
        else if(DrawY < 180 && DrawY >=100 ) begin
            addr = DrawY-100;
            if(DrawX > 185 && DrawX < 200) begin
                if(data[DrawX%186] == 1) begin
                    Red = 4'h0;
                    Green = 4'hC;
                    Blue = 4'hF;
                end else begin
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
        end
        
        else begin
            Red = 4'h0;
            Green = 4'h0;
            Blue = 4'h0;
        end      
    end 
    
endmodule
