`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2017 02:47:20 PM
// Design Name: 
// Module Name: pulse_train_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pulse_train_tb(
    );
      
//--------------------Drive------------------------

reg clock;                  // Clock 
reg reset_async;            // Reset assncrono
reg [7:0] pulse_width;      // Configura a largura do pulso
reg [7:0] pulse_period;     // Configura o perodo de gerao de pulsos
wire pulse_out;             // Sada de pulso gerado
 
//-------------------------------------------------
// Name: Gerao de Reset
//------------------------------------------------- 
initial
       begin
           reset_async = 1;
           #100
           reset_async = 0;
       end
//-------------------------------------------------
// Name: Gerao de Pulsos
//-------------------------------------------------        
initial
        begin
           pulse_width = 8'd50;
           pulse_period = 8'd100;
        end   
//-------------------------------------------------
// Name: Gerao de Clock
//-------------------------------------------------                        
initial
       begin
           clock = 0;
           forever #100 clock = ~clock;
       end
   
//DUT 
    pulse_train uu_pulse_train (
    
    .clock(clock),                  // Clock 
    .reset_async(reset_async),            // Reset assncrono
    .pulse_width(pulse_width),          // Configura a largura do pulso
    .pulse_period(pulse_period),        // Configura o perodo de gerao de pulsos
    .pulse_out(pulse_out)               // Sada de pulso gerado
    
    );
    

               
endmodule
