module mb_usb_hdmi_top(
    input logic Clk,
    input logic reset_rtl_0,
    input logic theButton,
    input logic winButton,
  
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
        
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB,
    
    output logic led_collision,
    output logic [2:0] led
);
    
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic clk_25MHz, clk_125MHz, clk, clk_100MHz;
    logic locked;
    logic [9:0] drawX, drawY, ballxsig, ballysig, ballsizesig;
    logic [2:0] lives;

    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    
    assign reset_ah = reset_rtl_0;
    assign led[0] = (lives >= 1);
    assign led[1] =(lives>=2);
    assign led[2] = (lives >=3);
    
    logic [9:0] floortest;
    logic [15:0] inset;
    logic [15:0] out;
    assign inset = out;
    
    //Keycode HEX drivers
    hex_driver HexA (
        .clk(Clk),
        .reset(reset_ah),
        .in({4'h00, 4'h00, timer[15:8], timer[7:0]}),
        .hex_seg(hex_segA),
        .hex_grid(hex_gridA)
    );
    
    hex_driver HexB (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[15:12], keycode0_gpio[11:8], keycode0_gpio[7:4], keycode0_gpio[3:0]}),
        .hex_seg(hex_segB),
        .hex_grid(hex_gridB)
    );
    
    mb_block mb_block_i (
        .clk_100MHz(Clk),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss)
    );
        
    //clock wizard configured with a 1x and 5x clock for HDMI
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(Clk)
    );
    
    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

    //Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        //Clocking and Reset
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        //Reset is active LOW
        .rst(reset_ah),
        //Color and Sync Signals
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        
        //aux Data (unused)
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        
        //Differential outputs
        .TMDS_CLK_P(hdmi_tmds_clk_p),          
        .TMDS_CLK_N(hdmi_tmds_clk_n),          
        .TMDS_DATA_P(hdmi_tmds_data_p),         
        .TMDS_DATA_N(hdmi_tmds_data_n)          
    );

    logic A, D, W, S;
    logic start;
    logic climb, ladder, jump, paused, enter, win;
    //Ball Module
    player ball_instance(
        .Reset(reset_rtl_0), 
        .frame_clk(vsync),//add vsync as the frame clk                    //Figure out what this should be so that the ball will move
        .keycode(keycode0_gpio[7:0]),    //Notice: only one keycode connected to ball by default
        .keycode2(keycode0_gpio[15:8]),
        .colliding(led_collision),
        .lives,
        .BallX(ballxsig),
        .BallY(ballysig),
        .BallS(ballsizesig),
        .climb_out(climb),
        .ladder_out(ladder),
        .jump_out(jump),
        .win_out(win),
        .A(A), .D(D), .W(W), .S(S), 
        .paused,
        .enter,
        .start,
        .winButton
    );
    
    logic [9:0] barrelxsig, barrelysig, barrelsizesig; logic barstate;
    logic [9:0] barrel2xsig, barrel2ysig; logic bar2state; 
    logic [9:0] barrel3xsig, barrel3ysig;  logic bar3state;
    logic [9:0] barrel4xsig, barrel4ysig;  logic bar4state;
    logic [9:0] barrel5xsig, barrel5ysig;  logic bar5state;    
    
    
    barrel barrel( //19 seconds to loop
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrelxsig),
        .BarrelY(barrelysig),
        .BarrelS(barrelsizesig),
        .BarrelState(barstate),
        .paused,
        .enter   
    );
      
    
    barrel #(.Delay(117)) barrel2(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel2xsig),
        .BarrelY(barrel2ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(bar2state),
        .paused,
        .enter      
    );
    
    barrel #(.Delay(241)) barrel3(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel3xsig),
        .BarrelY(barrel3ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(bar3state),
        .paused,
        .enter      
    );
    
    barrel #(.Delay(294)) barrel4(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel4xsig),
        .BarrelY(barrel4ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(bar4state),
        .paused,
        .enter      
    );
    
    barrel #(.Delay(361)) barrel5(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel5xsig),
        .BarrelY(barrel5ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(bar5state),
        .paused,
        .enter      
    );
    
    //MORE BARRELSSSSSSSSSS NEVER ENOUGH BARRELS!!!!!!!!!!
    logic [9:0] barrel6xsig, barrel6ysig; logic barstate;
    logic [9:0] barrel7xsig, barrel7ysig;  
    logic [9:0] barrel8xsig, barrel8ysig; 
    logic [9:0] barrel9xsig, barrel9ysig; 
    logic [9:0] barrel10xsig, barrel10ysig;  
    barrel #(.Delay(403)) barrel6(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel6xsig),
        .BarrelY(barrel6ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(barstate),
        .paused,
        .enter      
    );
        barrel #(.Delay(502)) barrel7(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel7xsig),
        .BarrelY(barrel7ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(barstate),
        .paused,
        .enter      
    );
        barrel #(.Delay(616)) barrel8(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel8xsig),
        .BarrelY(barrel8ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(barstate),
        .paused,
        .enter      
    );
        barrel #(.Delay(658)) barrel9(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel9xsig),
        .BarrelY(barrel9ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(barstate),
        .paused,
        .enter      
    );
        barrel #(.Delay(725)) barrel10(
        .Reset(reset_rtl_0),
        .frame_clk(vsync),
        .BarrelX(barrel10xsig),
        .BarrelY(barrel10ysig),
        .BarrelS(barrelsizesig),
        .BarrelState(barstate),
        .paused,
        .enter      
    );
 
 //I AM ADDICTED TO FENT AND BARRELS!!!!
logic [9:0] barrel11xsig, barrel11ysig;
logic [9:0] barrel12xsig, barrel12ysig;
logic [9:0] barrel13xsig, barrel13ysig;
logic [9:0] barrel14xsig, barrel14ysig;
logic [9:0] barrel15xsig, barrel15ysig;
barrel #(.Delay(767)) barrel11(
    .Reset(reset_rtl_0),
    .frame_clk(vsync),
    .BarrelX(barrel11xsig),
    .BarrelY(barrel11ysig),
    .BarrelS(barrelsizesig),
    .BarrelState(barstate),
    .paused,
    .enter      
);

barrel #(.Delay(838)) barrel12(
    .Reset(reset_rtl_0),
    .frame_clk(vsync),
    .BarrelX(barrel12xsig),
    .BarrelY(barrel12ysig),
    .BarrelS(barrelsizesig),
    .BarrelState(barstate),
    .paused,
    .enter      
);

barrel #(.Delay(903)) barrel13(
    .Reset(reset_rtl_0),
    .frame_clk(vsync),
    .BarrelX(barrel13xsig),
    .BarrelY(barrel13ysig),
    .BarrelS(barrelsizesig),
    .BarrelState(barstate),
    .paused,
    .enter      
);

barrel #(.Delay(1000)) barrel14( //sneaky long delay heh heh heh
    .Reset(reset_rtl_0),
    .frame_clk(vsync),
    .BarrelX(barrel14xsig),
    .BarrelY(barrel14ysig),
    .BarrelS(barrelsizesig),
    .BarrelState(barstate),
    .paused,
    .enter      
);

barrel #(.Delay(1070)) barrel15(
    .Reset(reset_rtl_0),
    .frame_clk(vsync),
    .BarrelX(barrel15xsig),
    .BarrelY(barrel15ysig),
    .BarrelS(barrelsizesig),
    .BarrelState(barstate),
    .paused,
    .enter      
);

   

collision collisions(
    .BallX(ballxsig),
    .BallY(ballysig),
    .barrelx(barrelxsig),
    .barrely(barrelysig),
    .barrel2x(barrel2xsig),
    .barrel2y(barrel2ysig),
    .barrel3x(barrel3xsig),
    .barrel3y(barrel3ysig),
    .barrel4x(barrel4xsig),
    .barrel4y(barrel4ysig),
    .barrel5x(barrel5xsig),
    .barrel5y(barrel5ysig),
    
    .barrel6x(barrel6xsig),
    .barrel6y(barrel6ysig),
    .barrel7x(barrel7xsig),
    .barrel7y(barrel7ysig),
    .barrel8x(barrel8xsig),
    .barrel8y(barrel8ysig),
    .barrel9x(barrel9xsig),
    .barrel9y(barrel9ysig),
    .barrel10x(barrel10xsig),
    .barrel10y(barrel10ysig),

    .barrel11x(barrel11xsig),
    .barrel11y(barrel11ysig),
    .barrel12x(barrel12xsig),
    .barrel12y(barrel12ysig),
    .barrel13x(barrel13xsig),
    .barrel13y(barrel13ysig),
    .barrel14x(barrel14xsig),
    .barrel14y(barrel14ysig),
    .barrel15x(barrel15xsig),
    .barrel15y(barrel15ysig),

    .collision(led_collision)
);

    
    logic [15:0] timer;
    
    //Color Mapper Module   
    color_mapper color_instance(
        .BallX(ballxsig),
        .BallY(ballysig),
        .BarrelX(barrelxsig),
        .BarrelY(barrelysig),
        .Barrel2X(barrel2xsig),
        .Barrel2Y(barrel2ysig),
        .Barrel3X(barrel3xsig),
        .Barrel3Y(barrel3ysig),
        .Barrel4X(barrel4xsig),
        .Barrel4Y(barrel4ysig),
        .Barrel5X(barrel5xsig),
        .Barrel5Y(barrel5ysig),
        
        .Barrel6X(barrel6xsig),
        .Barrel6Y(barrel6ysig),
        .Barrel7X(barrel7xsig),
        .Barrel7Y(barrel7ysig),
        .Barrel8X(barrel8xsig),
        .Barrel8Y(barrel8ysig),
        .Barrel9X(barrel9xsig),
        .Barrel9Y(barrel9ysig),
        .Barrel10X(barrel10xsig),
        .Barrel10Y(barrel10ysig),
        
        .Barrel11X(barrel11xsig),
        .Barrel11Y(barrel11ysig),
        .Barrel12X(barrel12xsig),
        .Barrel12Y(barrel12ysig),
        .Barrel13X(barrel13xsig),
        .Barrel13Y(barrel13ysig),
        .Barrel14X(barrel14xsig),
        .Barrel14Y(barrel14ysig),
        .Barrel15X(barrel15xsig),
        .Barrel15Y(barrel15ysig),
        
        .Barrel_size(barrelsizesig),
        .frame_clk(vsync),
        .reset(reset_rtl_0),
        .out,
        .win(win),
        .climb(climb),
        .jump(jump),
        .lifecount(lives),
        .DrawX(drawX),
        .DrawY(drawY),
        .Ball_size(ballsizesig),
        .Red(red),
        .Green(green),
        .Blue(blue),
        .A(A), .D(D), .w(W), .s(S),
        .pngClk(clk_25MHz),
        .theButton(theButton),
        .pause(paused),
        .timer_out(timer),
        .start
    );

    
endmodule
