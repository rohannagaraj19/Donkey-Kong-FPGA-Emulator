module collision(
    input logic [9:0] BallX, 
    input logic [9:0] BallY, 
    input logic [9:0] barrelx, 
    input logic [9:0] barrely, 
    input logic [9:0] barrel2x, 
    input logic [9:0] barrel2y,
    input logic [9:0] barrel3x,
    input logic [9:0] barrel3y,
    input logic [9:0] barrel4x,
    input logic [9:0] barrel4y,
    input logic [9:0] barrel5x,
    input logic [9:0] barrel5y,
    input logic [9:0] barrel6x,
    input logic [9:0] barrel6y,
    input logic [9:0] barrel7x,
    input logic [9:0] barrel7y,
    input logic [9:0] barrel8x,
    input logic [9:0] barrel8y,
    input logic [9:0] barrel9x,
    input logic [9:0] barrel9y,
    input logic [9:0] barrel10x,
    input logic [9:0] barrel10y,
    input logic [9:0] barrel11x,
    input logic [9:0] barrel11y,
    input logic [9:0] barrel12x,
    input logic [9:0] barrel12y,
    input logic [9:0] barrel13x,
    input logic [9:0] barrel13y,
    input logic [9:0] barrel14x,
    input logic [9:0] barrel14y,
    input logic [9:0] barrel15x,
    input logic [9:0] barrel15y,
    output logic collision
 );

    //mario x-y range
    logic [9:0] marioXMax = BallX + 14; 
    logic [9:0] marioYMax = BallY + 14;
    logic [9:0] marioXMin = BallX - 14;
    logic [9:0] marioYMin = BallY - 14;
    
    //barrel 1 x-y range
    //modeling it as a square using size = 9 rather than 12 to account for the curvature
    logic [9:0] barrelXMax = barrelx + 8; //changed from 9 to 7
    logic [9:0] barrelYMax = barrely + 8;
    logic [9:0] barrelXMin = barrelx - 8;
    logic [9:0] barrelYMin = barrely - 8;
    
    //barrel 2 x-y range
    logic [9:0] barrel2XMax = barrel2x + 8; //changed from 9 to 7 
    logic [9:0] barrel2YMax = barrel2y + 8;
    logic [9:0] barrel2XMin = barrel2x - 8;
    logic [9:0] barrel2YMin = barrel2y - 8;
    
    //barrel 3 x-y range
    logic [9:0] barrel3XMax = barrel3x + 8; 
    logic [9:0] barrel3YMax = barrel3y + 8;
    logic [9:0] barrel3XMin = barrel3x - 8;
    logic [9:0] barrel3YMin = barrel3y - 8;
    
    //barrel 4 x-y range
    logic [9:0] barrel4XMax = barrel4x + 8; 
    logic [9:0] barrel4YMax = barrel4y + 8;
    logic [9:0] barrel4XMin = barrel4x - 8;
    logic [9:0] barrel4YMin = barrel4y - 8;
    
    //barrel 5 x-y range
    logic [9:0] barrel5XMax = barrel5x + 8; 
    logic [9:0] barrel5YMax = barrel5y + 8;
    logic [9:0] barrel5XMin = barrel5x - 8;
    logic [9:0] barrel5YMin = barrel5y - 8;
                                         
        //barrel 6 x-y rang              
    logic [9:0] barrel6XMax = barrel6x + 8; 
    logic [9:0] barrel6YMax = barrel6y + 8;
    logic [9:0] barrel6XMin = barrel6x - 8;
    logic [9:0] barrel6YMin = barrel6y - 8;
    
        //barrel 7 x-y range
    logic [9:0] barrel7XMax = barrel7x + 8; 
    logic [9:0] barrel7YMax = barrel7y + 8;
    logic [9:0] barrel7XMin = barrel7x - 8;
    logic [9:0] barrel7YMin = barrel7y - 8;
    
        //barrel 8 x-y range
    logic [9:0] barrel8XMax = barrel8x + 8; 
    logic [9:0] barrel8YMax = barrel8y + 8;
    logic [9:0] barrel8XMin = barrel8x - 8;
    logic [9:0] barrel8YMin = barrel8y - 8;
    
        //barrel 9 x-y range
    logic [9:0] barrel9XMax = barrel9x + 8; 
    logic [9:0] barrel9YMax = barrel9y + 8;
    logic [9:0] barrel9XMin = barrel9x - 8;
    logic [9:0] barrel9YMin = barrel9y - 8;
       
        //barrel 10 x-y range
    logic [9:0] barrel10XMax = barrel10x + 8; 
    logic [9:0] barrel10YMax = barrel10y + 8;
    logic [9:0] barrel10XMin = barrel10x - 8;
    logic [9:0] barrel10YMin = barrel10y - 8;
    
    
    //and so on...
    // Barrel 11 x-y range
    logic [9:0] barrel11XMax = barrel11x + 8; 
    logic [9:0] barrel11YMax = barrel11y + 8;
    logic [9:0] barrel11XMin = barrel11x - 8;
    logic [9:0] barrel11YMin = barrel11y - 8;
    
    // Barrel 12 x-y range
    logic [9:0] barrel12XMax = barrel12x + 8; 
    logic [9:0] barrel12YMax = barrel12y + 8;
    logic [9:0] barrel12XMin = barrel12x - 8;
    logic [9:0] barrel12YMin = barrel12y - 8;
    
    // Barrel 13 x-y range
    logic [9:0] barrel13XMax = barrel13x + 8; 
    logic [9:0] barrel13YMax = barrel13y + 8;
    logic [9:0] barrel13XMin = barrel13x - 8;
    logic [9:0] barrel13YMin = barrel13y - 8;
    
    // Barrel 14 x-y range
    logic [9:0] barrel14XMax = barrel14x + 8; 
    logic [9:0] barrel14YMax = barrel14y + 8;
    logic [9:0] barrel14XMin = barrel14x - 8;
    logic [9:0] barrel14YMin = barrel14y - 8;
    
    // Barrel 15 x-y range
    logic [9:0] barrel15XMax = barrel15x + 8; 
    logic [9:0] barrel15YMax = barrel15y + 8;
    logic [9:0] barrel15XMin = barrel15x - 8;
    logic [9:0] barrel15YMin = barrel15y - 8;
    
    //actual collision logic
    logic barrelcol, barrel2col, barrel3col, barrel4col, barrel5col; //making an individual variable for each barrel's collision then OR-ing the signals later
    logic barrel6col,barrel7col, barrel8col, barrel9col, barrel10col;
    logic barrel11col, barrel12col, barrel13col, barrel14col, barrel15col;
    always_comb 
    begin: collisions
        if(marioYMax >= barrelYMin && marioYMin <= barrelYMax && marioXMax >= barrelXMin && marioXMin <= barrelXMax) 
            barrelcol = 1;
        else
            barrelcol = 0;
        if(marioYMax >= barrel2YMin && marioYMin <= barrel2YMax && marioXMax >= barrel2XMin && marioXMin <= barrel2XMax) 
            barrel2col = 1;
        else
            barrel2col = 0;
      if(marioYMax >= barrel3YMin && marioYMin <= barrel3YMax && marioXMax >= barrel3XMin && marioXMin <= barrel3XMax)
          barrel3col = 1;
      else 
          barrel3col = 0;
      if(marioYMax >= barrel4YMin && marioYMin <= barrel4YMax && marioXMax >= barrel4XMin && marioXMin <= barrel4XMax)
          barrel4col = 1;
      else 
          barrel4col = 0;
      if(marioYMax >= barrel5YMin && marioYMin <= barrel5YMax && marioXMax >= barrel5XMin && marioXMin <= barrel5XMax)
          barrel5col = 1;
      else 
          barrel5col = 0;
      
      //
      if(marioYMax >= barrel6YMin && marioYMin <= barrel6YMax && marioXMax >= barrel6XMin && marioXMin <= barrel6XMax)
          barrel6col = 1;
      else 
          barrel6col = 0;
          //
      if(marioYMax >= barrel7YMin && marioYMin <= barrel7YMax && marioXMax >= barrel7XMin && marioXMin <= barrel7XMax)
          barrel7col = 1;
      else 
          barrel7col = 0;          
          //
      if(marioYMax >= barrel8YMin && marioYMin <= barrel8YMax && marioXMax >= barrel8XMin && marioXMin <= barrel8XMax)
          barrel8col = 1;
      else 
          barrel8col = 0;                
          //
      if(marioYMax >= barrel9YMin && marioYMin <= barrel9YMax && marioXMax >= barrel9XMin && marioXMin <= barrel9XMax)
          barrel9col = 1;
      else 
          barrel9col = 0;     
          //
      if(marioYMax >= barrel10YMin && marioYMin <= barrel10YMax && marioXMax >= barrel10XMin && marioXMin <= barrel10XMax)
          barrel10col = 1;
      else 
          barrel10col = 0;       
        
        // Barrel 11 collision
        if(marioYMax >= barrel11YMin && marioYMin <= barrel11YMax && marioXMax >= barrel11XMin && marioXMin <= barrel11XMax)
            barrel11col = 1;
        else 
            barrel11col = 0;         
        
        // Barrel 12 collision
        if(marioYMax >= barrel12YMin && marioYMin <= barrel12YMax && marioXMax >= barrel12XMin && marioXMin <= barrel12XMax)
            barrel12col = 1;
        else 
            barrel12col = 0;         
        
        // Barrel 13 collision
        if(marioYMax >= barrel13YMin && marioYMin <= barrel13YMax && marioXMax >= barrel13XMin && marioXMin <= barrel13XMax)
            barrel13col = 1;
        else 
            barrel13col = 0;         
        
        // Barrel 14 collision
        if(marioYMax >= barrel14YMin && marioYMin <= barrel14YMax && marioXMax >= barrel14XMin && marioXMin <= barrel14XMax)
            barrel14col = 1;
        else 
            barrel14col = 0;         
        
        // Barrel 15 collision
        if(marioYMax >= barrel15YMin && marioYMin <= barrel15YMax && marioXMax >= barrel15XMin && marioXMin <= barrel15XMax)
            barrel15col = 1;
        else 
            barrel15col = 0;                           
        
    end
    
    
    assign collision = (barrelcol || barrel2col || barrel3col || barrel4col || barrel5col
                        || barrel6col || barrel7col || barrel8col || barrel9col || barrel10col
                        || barrel11col || barrel12col || barrel13col || barrel14col || barrel15col);
    
    
    
    
endmodule
