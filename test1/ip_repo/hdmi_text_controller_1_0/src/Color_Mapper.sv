//WEEK ONE COLOR MAPPER
//module  color_mapper ( input  logic [9:0]  DrawX, DrawY,
//                       input logic [10:0] inputreg,
//                       input logic inv,
//                       input logic [31:0] LeType,
//                       output logic [3:0]  Red, Green, Blue 
//                       );
   
    
//    logic[10:0] sprite_addr;
//    logic[7:0] sprite_data;
    
//    assign sprite_addr = inputreg;
//    font_rom(.addr(sprite_addr), .data(sprite_data));
        
//    always_comb
//    begin:RGB_Display
//        if (sprite_data[7-DrawX[2:0]] == 1'b1 && inv == 0) begin 
            
//               Red = LeType[24:21];
//               Green = LeType[20:17];
//               Blue = LeType[16:13];
//        end
            
//        else if (sprite_data[7-DrawX[2:0]] == 1'b0 && inv == 0) begin
//               Red = LeType[12:9];
//               Green = LeType[8:5];
//               Blue = LeType[4:1];
//        end     
        
//        else if (sprite_data[7-DrawX[2:0]] == 1'b1 && inv == 1) begin
//               Red = LeType[12:9];
//               Green = LeType[8:5];
//               Blue = LeType[4:1];
//        end    
        
//        else if (sprite_data[7-DrawX[2:0]] == 1'b0 && inv == 1) begin
//               Red = LeType[24:21];
//               Green = LeType[20:17];
//               Blue = LeType[16:13];
//        end    
            
//        else begin
//            Red = 4'hF;
//            Green = 4'hF;
//            Blue = 4'hF;
//        end
            
//    end 
 
    
//endmodule


//WEEK TWO COLOR MAPPER
module color_mapper (
    input logic [9:0] DrawX, DrawY, 
    input logic [31:0] inputCP, 
    input logic [31:0] input_palette [8],
    
    output logic [3:0] Red, Green, Blue,
    output logic [10:0] outputCP
);

logic [9:0] num;
logic [31:0] register;
logic [3:0] char; //glyff

logic [9:0] x_start;
assign x_start = DrawX - (DrawX%8);

logic [7:0] data;
logic inv;
logic [7:0]  sprite_data; //empty array for output


assign outputCP = (DrawX/16) + ((DrawY / 16) * 40);

assign register = inputCP;

assign char = DrawX[3];
logic [10:0] char_base_addr;
logic [10:0] char_addr;
logic [7:0] cur_cp ; 
logic [3:0] fridx ; 
logic [3:0] bgidx ; 
logic [3:0] FR,FG,FB,BB,BR,BG;
logic [11:0] FGD ; 
logic [11:0] BKG ; 


//Char
always_comb begin
    
case (char)

    2'b00: begin
        data = register[14:8];
        inv = register[15];
        fridx = register [7:4];
        bgidx = register [3:0];
    end
    
    2'b01: begin
        data = register[30:24];
        inv = register[31];
        fridx = register [23:20];
        bgidx = register [19:16];
    end
    default: begin
        data = 0;
        inv = 0;
    end
endcase;

    if(fridx[0] == 1'b1)
    begin
        FGD = input_palette[fridx/2][27:16];
    end
    
    else
    begin   
        FGD = input_palette[fridx/2][11:0];
        
    end
    
    if(bgidx[0] == 1'b1)
    begin
        BKG = input_palette[bgidx/2][27:16];
    end
    
    else begin
    BKG= input_palette[bgidx/2][11:0];
    end
end

assign char_base_addr = 16*data[6:0]; //get the base address 
assign char_addr = char_base_addr + (DrawY % 16);   
   
font_rom font_rom1 (.addr(char_addr), .data(sprite_data));
//sprite data == 1 and inverse == 0, print foreground
//sprite data == 1 and inverse == 1, print background
//sprite data == 0 and inverse == 0, print background
//sprite data == 0 and inverse == 1, print foreground

always_comb begin : RGB_Display
        FR = FGD[11:8]; 
        FG = FGD[7:4];
        FB = FGD[3:0];
        BR = BKG[11:8];
        BG = BKG[7:4];
        BB = BKG[3:0];
        
    if (sprite_data[7 - (DrawX % 8)] == 1'b1 && inv == 1'b0 )
    begin
        
        Red = FR;
        Green= FG;
        Blue= FB;
     
    end
    else if (sprite_data[7 - (DrawX % 8)] == 1'b1 && inv == 1'b1)
    begin
   
        Red = BR;
        Green= BG;
        Blue= BB;
        end
        
        else if(sprite_data[7 - (DrawX % 8)] == 1'b0 && inv == 1'b0 )
    begin
        
        Red = BR;
        Green= BG;
        Blue= BB;
    end
    
        else if (sprite_data[7 - (DrawX % 8)] == 1'b0 && inv == 1'b1 )
    begin
        
        Red = FR;
        Green= FG;
        Blue= FB;
     
    end
     
 end

endmodule