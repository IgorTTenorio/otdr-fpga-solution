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

module pulse_gen_tb(
    );
      
//--------------------Drive------------------------

reg clock;                  // Clock 
reg reset_async;            // Reset assncrono
reg acq_busy;
reg pulse_trigger;
reg [7:0] pulse_width;      // Configura a largura do pulso
reg [7:0] pulse_n;          // Configura o numero de pulsos da saida
wire pulse_out;             // Saida de pulso gerado
 
//-------------------------------------------------
// Name: Geracao de Reset
//------------------------------------------------- 
initial
       begin
           acq_busy = 0;
           reset_async = 1;
           #100
           reset_async = 0;
       end

initial
              begin
                  pulse_trigger = 0;
                  #200
                  pulse_trigger = 1;
                  #200
                  pulse_trigger = 0;
              end

//-------------------------------------------------
// Name: Geracao de Pulsos
//-------------------------------------------------        
initial
        begin
           pulse_width = 8'd10;
           pulse_n = 8'd5;
        end   
//-------------------------------------------------
// Name: Geracao de Clock
//-------------------------------------------------                        
initial
       begin
           clock = 0;
           forever #100 clock = ~clock;
       end
   
//DUT 
    pulse_gen uu_pulse_gen (
    
    .clock(clock),                      // Clock 
    .reset_async(reset_async),          // Reset assncrono
    .pulse_width(pulse_width),          // Configura a largura do pulso
    .pulse_trigger(pulse_trigger),
    .pulse_n(pulse_n),
    .pulse_out(pulse_out),               // Sada de pulso gerado
    .acq_busy(acq_busy)
    );
endmodule    