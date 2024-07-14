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


module  color_mapper ( input  logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
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
    
    ladder_sprite ladder(
            .addr,
            .data
        );
        
        mario_sprite mario(
            .X,
            .Y,
            .pal
        );
        
    logic [3:0] X, Y;
    logic [1:0] pal;
  
    always_comb
    begin:Ball_on_proc
        if ((DrawX >= BallX - Ball_size)&&(DrawX <= BallX + Ball_size)&&(DrawY >= BallY - Ball_size)&&(DrawY <= BallY + Ball_size)) begin
            X = (DrawX - BallX + 16)/2;
            Y = (DrawY - BallY + 16)/2;
            if(pal == 2'b00) begin
                ball_on = 1'b0;
            end else begin
                ball_on = 1'b1;
            end
        end else begin
            ball_on = 1'b0;
        end
     end 
     
     logic [11:0] mario_red = 12'hd31;
     logic [11:0] mario_darkbrown = 12'hA50;
     logic [11:0] mario_lightbrown = 12'hD80;
      
       
    always_comb
    begin:RGB_Display
        if ((ball_on == 1'b1)) begin 
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
            if(DrawX > 535 && DrawX < 550)begin
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
        
        else begin
            Red = 4'h0;
            Green = 4'h0;
            Blue = 4'h0;
        end      
    end 
    
endmodule
