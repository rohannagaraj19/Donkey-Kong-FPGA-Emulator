module  color_mapper ( input  logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size, BarrelX, BarrelY, Barrel_size,
                        Barrel2X, Barrel2Y, Barrel3X, Barrel3Y, Barrel4X, Barrel4Y, Barrel5X, Barrel5Y,
                        Barrel6X, Barrel6Y, Barrel7X, Barrel7Y, Barrel8X, Barrel8Y, Barrel9X, Barrel9Y, Barrel10X, Barrel10Y,
                        Barrel11X, Barrel11Y, Barrel12X, Barrel12Y, Barrel13X, Barrel13Y, 
                        Barrel14X, Barrel14Y, Barrel15X, Barrel15Y,
                        //Barrel2X, Barrel2Y,
                       input logic pngClk, theButton, A, D, frame_clk, reset, jump, pause, start, win, climb, w, s,
                       input logic [1:0] lifecount, output logic [15:0] out,
                       output logic [3:0]  Red, Green, Blue, output logic [15:0] timer_out);
        
        
    logic [3:0] ObjectR, ObjectG, ObjectB;
    logic [3:0] dkR, dkG, dkB;
    logic [3:0] dX, dY;
    logic dk_on;  
    logic [9:0] dk_xMax = 10'd83;
    logic [9:0] dk_yMax  = 10'd66;  
    
    logic [9:0] peach_xMax = 10'd30;
    logic [9:0] peach_yMax = 10'd50; 
    
    assign timer_out = counter2;
    
              
         dk2 donkeykong(
            .vga_clk(pngClk),
            .DrawX (DrawX+30),
            .DrawY (DrawY-(130+66+28)), //+26 to +28
            .blank (1'd1),
            .red (dkR),
            .green (dkG),
            .blue (dkB)
         );
         
        logic[3:0] ssR, ssG, ssB;
        startScreen_example startScreen(
            .vga_clk(pngClk),
            .DrawX (DrawX),
            .DrawY (DrawY), 
            .blank (1'd1),
            .red (ssR),
            .green (ssG),
            .blue (ssB)
         );
         
        logic[3:0] esR, esG, esB;
        endScreen_example endScreen(
            .vga_clk(pngClk),
            .DrawX (DrawX),
            .DrawY (DrawY), 
            .blank (1'd1),
            .red (esR),
            .green (esG),
            .blue (esB)
         );
         
       logic [3:0] dkjR, dkjG, dkjB; logic dkjump_on;
         dkjump dkjump(
            .vga_clk(pngClk),
            .DrawX (DrawX+30+3),
            .DrawY (DrawY-(130+66+28)), //+26 to +28
            .blank (1'd1),
            .red (dkjR),
            .green (dkjG),
            .blue (dkjB)
         );
         
    logic [3:0] peachR, peachG, peachB;
    logic peach_on;
         peach peach(
            .vga_clk(pngClk),
            .DrawX (DrawX+30+3),
            .DrawY (DrawY+(130+50+7-3)), //+3 to -3
            .blank(1'd1),
            .red (peachR),
            .green (peachG),
            .blue (peachB)
           );
         
         logic [3:0] wsR, wsG, wsB;
          winScreen_example winScreen(
            .vga_clk(pngClk),
            .DrawX (DrawX),
            .DrawY (DrawY), 
            .blank(1'd1),
            .red (wsR),
            .green (wsG),
            .blue (wsB)
           );  
           
        logic [3:0] wslR, wslG, wslB;
          winScreen_luigi_example winScreen_luigi(
            .vga_clk(pngClk),
            .DrawX (DrawX),
            .DrawY (DrawY), 
            .blank(1'd1),
            .red (wslR),
            .green (wslG),
            .blue (wslB)
           );  
      
      logic [9:0] leveldata;
      logic [3:0] leveladdr;
      level_rom levels(
        .addr(leveladdr),
        .data(leveldata));
        
 logic dead;         
 //donkey kong generated
 always_comb begin
         if(DrawX >=30 && DrawX<(30+dk_xMax) && DrawY <130 && DrawY>=(130 - dk_yMax - 28)) begin //changed -30 to -28
            dk_on = 1'b1;
            //Red = ObjectR; Green = ObjectG; Blue = ObjectB;
         end
         else begin
            dk_on = 1'b0;
            //Red = 4'h0; Green = 4'h0; Blue = 4'h0;
         end
         
  end

  
  always_comb begin // check if ur dead lmao
    if(counter2 == 0 || lifecount == 0) begin
        dead = 1;
    end else dead = 0;
  end
  
  

//donkey kong animation
logic toggle; logic [31:0] counter;
always_ff @(posedge frame_clk) begin
     counter <= counter + 1;
end
always_comb begin
  if(counter%60 > 30) begin  //every second the animation changes
      toggle <= 1;
  end else toggle <= 0;
  if(toggle) begin
      ObjectR <= dkR;
      ObjectG <= dkG;
      ObjectB <= dkB; 
  end
  else begin
      ObjectR <= dkjR;
      ObjectG <= dkjG;
      ObjectB <= dkjB; 
  end
end

  
  
 //peach generated
 always_comb begin
        if(DrawX>=130 && DrawX<(130+peach_xMax) && DrawY<(90+5) && DrawY>=(90 - peach_yMax)) begin 
              peach_on = 1'b1;
              //Red = peachR; Green = peachG; Blue = peachB;
        end else begin
              peach_on = 1'b0; 
              //Red = 4'h0; Green = 4'h0; Blue = 4'h0;
        end
 end    
  //assign Red = peachR; assign Green = peachG; assign Blue = peachB;


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
    
    //tom
    logic [15:0] counter2;
    logic [9:0] timer;
    assign out[15:0] = counter2;
    logic left; 
    
    always_ff@(posedge frame_clk or posedge reset) begin
        if(reset) begin
            counter2 <= 6059;
            left <= 0;
        end
        else begin
        
            if(D) //look right
                left <= 0;
            else if(A)
                left <= 1;
            else 
                left <= left;
        
            if(counter2 != 0) begin
                if(pause == 1 || start == 1 || win == 1 || dead == 1) begin
                    counter2 <= counter2;
                end else counter2 <= counter2 -1; end
            timer <= counter2/60;
        end
    end
    
    
    
    logic [3:0] hundreds, tens, ones;
    
    logic [10:0] fontaddr;
    logic [10:0] zero_offset = 10'h30;
    logic [7:0] fontdata;
    logic [10:0] A_offset = 10'h41;
    
    font_rom font(
        .addr(fontaddr),
        .data(fontdata)
    );
    
    logic font_pixel;
    logic [9:0] y_score_min = 480 - 48;
    logic [9:0] y_score_max = 480 - 32;
    logic [9:0] x_score_min = 320 - 40;
    logic [9:0] x_score_max = 320 + 40;

    logic [9:0] x_score_offset;
    logic score_pixel;
    
  logic [9:0] x_center = 320;
    //there are 11 characters total so 88 pixels wide
    logic [9:0] y_text_min = 480-32;
    logic [9:0] y_text_max = 480-16;
    logic [9:0] x_text_max = 320 + (88/2);
    logic [9:0] x_text_min = 320 - (88/2);
   
    logic [9:0] x_text_offset;
   
    always_comb begin
        //counter display
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
           
        end else if(DrawX >= x_text_min && DrawX < x_text_max && DrawY >= y_text_min && DrawY < y_text_max && pause == 1) begin
            x_text_offset = DrawX - x_text_min;
            if(x_text_offset < 8) begin //print capital P
                fontaddr = 16*(15 + A_offset) + DrawY%16;
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 16) begin //print capital R
                fontaddr = 16*(17 + A_offset) + DrawY%16;
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 24) begin
                fontaddr = 16*(4 + A_offset) + DrawY%16; //print capital E
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 32) begin
                fontaddr = 16*(18 + A_offset) + DrawY%16; //print capital S
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 40) begin
                fontaddr = 16*(18 + A_offset) + DrawY%16; //print capital S
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 48) begin
                fontaddr = 0;                           //print space
                font_pixel = 0;
            end else if(x_text_offset < 56) begin
                fontaddr = 16*(4 + A_offset) + DrawY%16; //print capital E
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 64) begin
                fontaddr = 16*(13 + A_offset) + DrawY%16; //print capital N
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 72) begin
                fontaddr = 16*(19 + A_offset) + DrawY%16; //print capital T
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 80) begin
                fontaddr = 16*(4 + A_offset) + DrawY%16; //print capital E
                font_pixel = fontdata[3-DrawX%8];
            end else if(x_text_offset < 88) begin
                fontaddr = 16*(17 + A_offset) + DrawY%16; //print capital R
                font_pixel = fontdata[3-DrawX%8];
            end
        end else
                font_pixel = 0;
         
           //SCORE: 000
        if(DrawX >= x_score_min && DrawX < x_score_max && DrawY >= y_score_min && DrawY < y_score_max) begin
            x_score_offset = DrawX - x_score_min;
            if(x_score_offset < 8) begin //S
                fontaddr = 16*(18+ A_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 16) begin //C
                fontaddr = 16*(2+ A_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 24) begin //O
                fontaddr = 16*(14+ A_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 32) begin //R
                fontaddr = 16*(17+ A_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 40) begin //E
                fontaddr = 16*(4+ A_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 48) begin //:
                fontaddr = 16*(10 + zero_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 56) begin // [space]
                fontaddr = 0;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 64) begin // hundreds
                fontaddr = 16*(hundreds + zero_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else if(x_score_offset < 72) begin // tens
                fontaddr = 16*(tens + zero_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end else begin //ones
                fontaddr = 16*(ones + zero_offset) + DrawY%16;
                score_pixel = fontdata[7-DrawX%8];
            end
        end else score_pixel = 0;      
       
    end
//tom
   
    
    ladder_sprite ladder(
            .addr,
            .data
        );
        mario_sprite mario(
            .X(X),
            .Y(Y),
            .pal
        );
        
        logic [3:0] cX;
        logic [1:0] palClimb;
        argenisAhh climber(
            .X(cX),
            .Y(Y),
            .pal(palClimb)
        );
        
 
    
//    always_comb begin
//        if(D == 1'b1 || A == 1'b1) begin
//            if(runCounter%10 == 0) begin
//                ball_on <= 0;
//                runMario_on <= 1;
//            end
//            else begin
//                ball_on <= 1;
//                runMario_on <=0;
//            end        
//        end    
//    end    

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
    logic[3:0] barrelR, barrelG, barrelB; 
    barrel_ex barrel(
        .vga_clk(pngClk),
        .DrawX (b1X-5),
        .DrawY (b1Y+5), 
        .blank(1'd1),
        .red (barrelR),
        .green (barrelG),
        .blue (barrelB)
    );   
    


        
    logic [3:0] X, Y;
    logic [1:0] pal;
    
    logic [3:0] X3, Y3;
    logic [1:0] pal3;
    
    logic [3:0] X2, Y2;
    logic [1:0] pal2;
    
    logic [3:0] X1, Y1;
    logic [1:0] pal1;
    
    logic [1:0] palRun;
    
    
    logic lr; // 0 is left, 1 is right
    
    //barrel generation
    logic [3:0] b1X, b1Y;
    logic Barrel_on;
    int b1DistX, b1DistY, bsize;
    assign b1DistX = DrawX - BarrelX;
    assign b1DistY = DrawY - BarrelY;
    assign bsize = Barrel_size;
    always_comb
    begin:Barrel_on_proc
    if((b1DistX*b1DistX + b1DistY*b1DistY) <= (bsize*bsize)) begin
       b1X = (DrawX - BarrelX + 2*Barrel_size)/2;
       b1Y =  (DrawY - BarrelY + 2*Barrel_size)/2;
       Barrel_on = 1'b1; end
    else begin 
        Barrel_on = 1'b0; end
    end 
    
    //barrel2 generation
    logic Barrel2_on;
    int b2DistX, b2DistY;
    assign b2DistX = DrawX - Barrel2X;
    assign b2DistY = DrawY - Barrel2Y;
    assign bsize = Barrel_size;
    always_comb
    begin:Barrel2_on_proc
    if((b2DistX*b2DistX + b2DistY*b2DistY) <= (bsize*bsize)) begin
       Barrel2_on = 1'b1; end
    else begin 
        Barrel2_on = 1'b0; end
    end 
    
     //barrel3 generation
    logic Barrel3_on;
    int b3DistX, b3DistY;
    assign b3DistX = DrawX - Barrel3X;
    assign b3DistY = DrawY - Barrel3Y;
    assign bsize = Barrel_size;
    always_comb
    begin:Barrel3_on_proc
    if((b3DistX*b3DistX + b3DistY*b3DistY) <= (bsize*bsize)) begin
       Barrel3_on = 1'b1; end
    else begin 
        Barrel3_on = 1'b0; end
    end 
    
        //barrel4 generation
    logic Barrel4_on;
    int b4DistX, b4DistY;
    assign b4DistX = DrawX - Barrel4X;
    assign b4DistY = DrawY - Barrel4Y;
    assign bsize = Barrel_size;
    always_comb
    begin:Barrel4_on_proc
    if((b4DistX*b4DistX + b4DistY*b4DistY) <= (bsize*bsize)) begin
       Barrel4_on = 1'b1; end
    else begin 
        Barrel4_on = 1'b0; end
    end 
    
        //barrel5 generation
    logic Barrel5_on;
    int b5DistX, b5DistY;
    assign b5DistX = DrawX - Barrel5X;
    assign b5DistY = DrawY - Barrel5Y;
    assign bsize = Barrel_size;
    always_comb
    begin:Barrel5_on_proc
    if((b5DistX*b5DistX + b5DistY*b5DistY) <= (bsize*bsize)) begin
       Barrel5_on = 1'b1; end
    else begin 
        Barrel5_on = 1'b0; end
    end 
    
    
    //barrel6 generation
    logic Barrel6_on;
    int b6DistX, b6DistY;
    assign b6DistX = DrawX - Barrel6X;
    assign b6DistY = DrawY - Barrel6Y;
    assign bsize = Barrel_size;
    always_comb
    begin:Barrel6_on_proc
    if((b6DistX*b6DistX + b6DistY*b6DistY) <= (bsize*bsize)) begin
       Barrel6_on = 1'b1; end
    else begin 
       Barrel6_on = 1'b0; end
    end 
    
  // Barrel 7 generation
logic Barrel7_on;
int b7DistX, b7DistY, b7size;
assign b7DistX = DrawX - Barrel7X;
assign b7DistY = DrawY - Barrel7Y;
assign b7size = Barrel_size;
always_comb begin : Barrel7_on_proc
    if ((b7DistX*b7DistX + b7DistY*b7DistY) <= (b7size*b7size))
        begin
            Barrel7_on = 1'b1;
        end
    else
        begin
            Barrel7_on = 1'b0;
        end
end

// Barrel 8 generation
logic Barrel8_on;
int b8DistX, b8DistY, b8size;
assign b8DistX = DrawX - Barrel8X;
assign b8DistY = DrawY - Barrel8Y;
assign b8size = Barrel_size;
always_comb begin : Barrel8_on_proc
    if ((b8DistX*b8DistX + b8DistY*b8DistY) <= (b8size*b8size))
        begin
            Barrel8_on = 1'b1;
        end
    else
        begin
            Barrel8_on = 1'b0;
        end
end

// Barrel 9 generation
logic [3:0] b9X, b9Y;
logic Barrel9_on;
int b9DistX, b9DistY, b9size;
assign b9DistX = DrawX - Barrel9X;
assign b9DistY = DrawY - Barrel9Y;
assign b9size = Barrel_size;
always_comb begin : Barrel9_on_proc
    if ((b9DistX*b9DistX + b9DistY*b9DistY) <= (b9size*b9size))
        begin
            Barrel9_on = 1'b1;
        end
    else
        begin
            Barrel9_on = 1'b0;
        end
end

// Barrel 10 generation
logic Barrel10_on;
int b10DistX, b10DistY, b10size;
assign b10DistX = DrawX - Barrel10X;
assign b10DistY = DrawY - Barrel10Y;
assign b10size = Barrel_size;
always_comb begin : Barrel10_on_proc
    if ((b10DistX*b10DistX + b10DistY*b10DistY) <= (b10size*b10size))
        begin
            Barrel10_on = 1'b1;
        end
    else
        begin
            Barrel10_on = 1'b0;
        end
end

// Barrel 11 generation
logic Barrel11_on;
int b11DistX, b11DistY, b11size;
assign b11DistX = DrawX - Barrel11X;
assign b11DistY = DrawY - Barrel11Y;
assign b11size = Barrel_size;
always_comb begin : Barrel11_on_proc
    if ((b11DistX*b11DistX + b11DistY*b11DistY) <= (b11size*b11size))
        begin
            Barrel11_on = 1'b1;
        end
    else
        begin
            Barrel11_on = 1'b0;
        end
end

// Barrel 12 generation
logic Barrel12_on;
int b12DistX, b12DistY, b12size;
assign b12DistX = DrawX - Barrel12X;
assign b12DistY = DrawY - Barrel12Y;
assign b12size = Barrel_size;
always_comb begin : Barrel12_on_proc
    if ((b12DistX*b12DistX + b12DistY*b12DistY) <= (b12size*b12size))
        begin
            Barrel12_on = 1'b1;
        end
    else
        begin
            Barrel12_on = 1'b0;
        end
end

// Barrel 13 generation
logic Barrel13_on;
int b13DistX, b13DistY, b13size;
assign b13DistX = DrawX - Barrel13X;
assign b13DistY = DrawY - Barrel13Y;
assign b13size = Barrel_size;
always_comb begin : Barrel13_on_proc
    if ((b13DistX*b13DistX + b13DistY*b13DistY) <= (b13size*b13size))
        begin
            Barrel13_on = 1'b1;
        end
    else
        begin
            Barrel13_on = 1'b0;
        end
end

// Barrel 14 generation
logic Barrel14_on;
int b14DistX, b14DistY, b14size;
assign b14DistX = DrawX - Barrel14X;
assign b14DistY = DrawY - Barrel14Y;
assign b14size = Barrel_size;
always_comb begin : Barrel14_on_proc
    if ((b14DistX*b14DistX + b14DistY*b14DistY) <= (b14size*b14size))
        begin
            Barrel14_on = 1'b1;
        end
    else
        begin
            Barrel14_on = 1'b0;
        end
end

// Barrel 15 generation
logic Barrel15_on;
int b15DistX, b15DistY, b15size;
assign b15DistX = DrawX - Barrel15X;
assign b15DistY = DrawY - Barrel15Y;
assign b15size = Barrel_size;
always_comb begin : Barrel15_on_proc
    if ((b15DistX*b15DistX + b15DistY*b15DistY) <= (b15size*b15size))
        begin
            Barrel15_on = 1'b1;
        end
    else
        begin
            Barrel15_on = 1'b0;
        end
end

    
    
//    logic left;
//    always_ff@(posedge pngClk) begin
//        if(D)
//            left<= 0;
//        else if(A)
//            left<=1;
//        else
//            left <= left;
//     end
     
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
    
    
   logic runMario_on;
        
   runningMario runMario(
     .X(X),
     .Y(Y),
     .palRun
   );
  //RUN LOGIC LETS GOO
  logic [31:0] runCounter; logic run;
    always_ff@(posedge frame_clk) begin
        runCounter <= runCounter + 1;
    end 
    always_comb begin
        if((((runCounter % 10) < 5 && (A||D)) || jump) && !climb) begin
            run = 1; end
        else begin
            run = 0; end        
    end
    
    //climb animation
    logic [31:0] climbCounter;
   always_ff@(posedge frame_clk) begin
        if(w||s) begin
        climbCounter <= climbCounter +1; end
        else begin
        climbCounter <= climbCounter; end
   end 
   
    always_comb begin
        if((climbCounter % 30)<15) begin
            cX = 15- (DrawX-BallX+16)/2;
        end else begin
            cX = (DrawX-BallX+16)/2; end    
    end
    
    
    logic climb_on;
    always_comb //prints the sprite in the direction you face or walk
    begin:Ball_on_proc
     if(!left) begin
          if ((DrawX > BallX - Ball_size)&&(DrawX < BallX + Ball_size)&&(DrawY > BallY - Ball_size)&&(DrawY < BallY + Ball_size)) begin
            X = 15 - (DrawX - BallX + 16)/2;
            Y = (DrawY - BallY + 16)/2;
            if(pal == 2'b00) begin
                ball_on = 1'b0; end
            else begin
                ball_on = 1'b1;
            end
            if(palRun == 2'b00) begin
                runMario_on = 1'b0; end
            else begin
                runMario_on = 1'b1;
            end
            if(palClimb == 2'b00) begin
                climb_on = 1'b0; end
            else begin
                climb_on = 1'b1;
            end               
        end else begin
            ball_on = 1'b0;
            runMario_on = 1'b0;
            climb_on = 1'b0;
        end
    end    //keycode end
       else begin
          if ((DrawX > BallX - Ball_size)&&(DrawX < BallX + Ball_size)&&(DrawY > BallY - Ball_size)&&(DrawY < BallY + Ball_size)) begin
            X = ((DrawX - BallX +16)/2);
            Y = (DrawY - BallY + 16)/2;
            if(pal == 2'b00) begin
                ball_on = 1'b0; end
                else begin
                ball_on = 1'b1; end
            if(palRun == 2'b00) begin
                runMario_on = 1'b0; end
            else begin
                runMario_on = 1'b1;
            end
            if(palClimb == 2'b00) begin
                climb_on = 1'b0; end
            else begin
                climb_on = 1'b1;
            end               
        end else begin
            ball_on = 1'b0;
            runMario_on = 1'b0;
            climb_on = 1'b0;
        end             
    end //keycode end   
    //end //first if statement en
 end //always_comb end

 
 logic bstate; logic check;
 always_ff@(posedge pngClk) begin
        if(theButton)begin
            if(!check) begin
                bstate <= ~bstate;
                check <= 1'b1;
            end 
            else begin
                bstate <= bstate; check <=check; end
        end
        else begin
            check <= 1'b0;
            bstate <= bstate; end 
   end
    
      
     logic [11:0] mario_red = 12'ha00;
     logic [11:0] mario_darkbrown = 12'h532;
     logic [11:0] mario_lightbrown = 12'hD80;
     logic [11:0] luigi_white = 12'hFFF;
     logic [11:0] luigi_green = 12'h061; //0c0 to 061
      
    //Mario and Luigi
    always_comb
    begin:RGB_Display
    //start screen
        if(start == 1'b1) begin
            Red = ssR;
            Green = ssG;
            Blue = ssB;
        end 
        //dead screen (not win screen)
        else if(dead == 1'b1) begin
            //the end innit
            Red = esR;
            Green = esG;
            Blue = esB;
        end
        //win screen
        else if(win == 1'b1 && (bstate == 1'b0)) begin
            if(score_pixel == 1) begin
                Red = 4'hF;
                Green = 4'hF;
                Blue = 4'hF;
            end else begin
                Red = wsR;
                Green = wsG;
                Blue = wsB;
            end
        end
        else if(win == 1'b1 && (bstate == 1'b1)) begin //luigi rizzler ending 
            if(score_pixel == 1) begin
                Red = 4'hF;
                Green = 4'hF;
                Blue = 4'hF;
            end else begin
                Red = wslR;
                Green = wslG;
                Blue = wslB;
            end
        end
        
        //climb animation (needs more priority)
        else if((climb == 1'b1) && (bstate == 1'b0) && (climb_on == 1'b1)) begin
            case(palClimb)
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
            else if((climb == 1'b1) && (bstate == 1'b1) && (climb_on == 1'b1)) begin
            case(palClimb)
            2'b01: begin //red
                Red = luigi_white[11:8];
                Green = luigi_white[7:4];
                Blue = luigi_white[3:0];
            end
            2'b10: begin //dark brown
                Red = luigi_green[11:8];
                Green = luigi_green[7:4];
                Blue = luigi_green[3:0];
            end
            2'b11: begin //light brown
                Red = mario_lightbrown[11:8];
                Green = mario_lightbrown[7:4];
                Blue = mario_lightbrown[3:0];
            end
            endcase
              
        end 
        //stationary sprite
        else if ((ball_on == 1'b1) && (bstate == 1'b0) && (run == 1'b0)) begin 
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
        else if((ball_on == 1'b1) && (bstate == 1'b1) && !run) begin
            case(pal)
            2'b01: begin //red
                Red = luigi_white[11:8];
                Green = luigi_white[7:4];
                Blue = luigi_white[3:0];
            end
            2'b10: begin //dark brown
                Red = luigi_green[11:8];
                Green = luigi_green[7:4];
                Blue = luigi_green[3:0];
            end
            2'b11: begin //light brown
                Red = mario_lightbrown[11:8];
                Green = mario_lightbrown[7:4];
                Blue = mario_lightbrown[3:0];
            end
            endcase
              
        end       
        
        //running sprite
        else if((runMario_on == 1'b1) && (bstate == 1'b0) && run) begin
            case(palRun)
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
            else if((runMario_on == 1'b1) && (bstate == 1'b1) && run) begin
            case(palRun)
            2'b01: begin //red
                Red = luigi_white[11:8];
                Green = luigi_white[7:4];
                Blue = luigi_white[3:0];
            end
            2'b10: begin //dark brown
                Red = luigi_green[11:8];
                Green = luigi_green[7:4];
                Blue = luigi_green[3:0];
            end
            2'b11: begin //light brown
                Red = mario_lightbrown[11:8];
                Green = mario_lightbrown[7:4];
                Blue = mario_lightbrown[3:0];
            end
            endcase
              
        end 

        //BACKGROUND
        //barrels
//        else if(Barrel_on == 1'b1) begin
//            Red = barrelR;
//            Green = barrelG;
//            Blue = barrelB;
//        end
        else if(Barrel_on == 1'b1 || Barrel2_on == 1'b1 || Barrel3_on == 1'b1 || Barrel4_on == 1'b1 || Barrel5_on == 1'b1 ||
                Barrel6_on == 1'b1 || Barrel7_on == 1'b1 || Barrel8_on == 1'b1 || Barrel9_on == 1'b1 || Barrel10_on == 1'b1 ||
                Barrel11_on || Barrel12_on || Barrel13_on || Barrel14_on || Barrel15_on) begin
            Red = 4'h8;
            Green = 4'h4;
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
                            if(bstate == 1'b0) begin
                            Red = mario_red[11:8];
                            Green = mario_red[7:4];
                            Blue = mario_red[3:0]; end
                            else begin
                            Red = luigi_white[11:8];
                            Green = luigi_white[7:4];
                            Blue = luigi_white [3:0];
                            end
                        end
                        2'b10: begin
                            if(bstate == 1'b0) begin
                            Red = mario_darkbrown[11:8];
                            Green = mario_darkbrown[7:4];
                            Blue = mario_darkbrown[3:0]; end
                            else begin
                            Red = luigi_green[11:8];
                            Green = luigi_green[7:4];
                            Blue = luigi_green[3:0];
                            end
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
                            if(bstate == 1'b0) begin
                            Red = mario_red[11:8];
                            Green = mario_red[7:4];
                            Blue = mario_red[3:0]; end
                            else begin
                            Red = luigi_white[11:8];
                            Green = luigi_white[7:4];
                            Blue = luigi_white [3:0];
                            end
                        end
                        2'b10: begin
                            if(bstate == 1'b0) begin
                            Red = mario_darkbrown[11:8];
                            Green = mario_darkbrown[7:4];
                            Blue = mario_darkbrown[3:0]; end
                            else begin
                            Red = luigi_green[11:8];
                            Green = luigi_green[7:4];
                            Blue = luigi_green[3:0];
                            end
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
                            if(bstate == 1'b0) begin
                            Red = mario_red[11:8];
                            Green = mario_red[7:4];
                            Blue = mario_red[3:0]; end
                            else begin
                            Red = luigi_white[11:8];
                            Green = luigi_white[7:4];
                            Blue = luigi_white [3:0];
                            end
                        end
                        2'b10: begin
                            if(bstate == 1'b0) begin
                            Red = mario_darkbrown[11:8];
                            Green = mario_darkbrown[7:4];
                            Blue = mario_darkbrown[3:0]; end
                            else begin
                            Red = luigi_green[11:8];
                            Green = luigi_green[7:4];
                            Blue = luigi_green[3:0];
                            end
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
    
       
 //first level
        else if(DrawX >= 30 && DrawX < 610 && DrawY >= 430 && DrawY <= 440)  begin
            leveladdr = DrawY - 430;
            if(leveldata[DrawX%10] == 1) begin
                Red = 4'hB;
                Green = 4'h0;
                Blue = 4'h4;
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
        end
       
       
        //second level
        else if(DrawX >= 30 && DrawX < 560 && DrawY >= 370 && DrawY <= 380) begin
            leveladdr = DrawY - 370;
            if(leveldata[DrawX%10] == 1) begin
                Red = 4'hB;
                Green = 4'h0;
                Blue = 4'h4;
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end;       
        end
       
       
        //third level
        else if(DrawX >= 80 && DrawX < 610 && DrawY >= 310 && DrawY <= 320) begin
            leveladdr = DrawY - 310;
            if(leveldata[DrawX%10] == 1) begin
                Red = 4'hB;
                Green = 4'h0;
                Blue = 4'h4;
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end     
        end
       
       
        //fourth level
        else if(DrawX >= 30 && DrawX < 560 && DrawY >= 250 && DrawY <= 260) begin
            leveladdr = DrawY - 250;
            if(leveldata[DrawX%10] == 1) begin
                Red = 4'hB;
                Green = 4'h0;
                Blue = 4'h4;
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end     
        end
       
       
        //fifth level
        else if(DrawX >= 80 && DrawX < 610 && DrawY >= 190 && DrawY <= 200) begin
            leveladdr = DrawY - 190;
            if(leveldata[DrawX%10] == 1) begin
                Red = 4'hB;
                Green = 4'h0;
                Blue = 4'h4;
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end       
        end
       
       
        //sixth level - top
        else if(DrawX >= 30 && DrawX < 560 && DrawY >= 130 && DrawY <= 140) begin
            leveladdr = DrawY - 130;
            if(leveldata[DrawX%10] == 1) begin
                Red = 4'hB;
                Green = 4'h0;
                Blue = 4'h4;
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end     
        end
       
       //peach platform
       else if(DrawX>=125 && DrawX<200 && DrawY>= 90 && DrawY <= 100)begin
            leveladdr = DrawY - 90;
            if(leveldata[(DrawX+5)%10] == 1) begin
                Red = 4'hB;
                Green = 4'h0;
                Blue = 4'h4;
            end else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
       end

        //donkey kong on top
        else if(dk_on == 1'b1) begin
            Red = ObjectR;
            Green = ObjectG;
            Blue = ObjectB;
        end
        //peach beside my goat donkey kong  
        else if(peach_on == 1'b1) begin
            Red = peachR;
            Green = peachG;
            Blue = peachB;
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
        
        //peach's ladder
        else if(DrawY < 180 && DrawY >= 100) begin
            addr = DrawY - 100;
            if(DrawX > (130+30+40-15) && DrawX< (130+30+40))begin
                if(data[DrawX%(130+30+40-14)] == 1) begin
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
