// +FHDR------------------------------------------------------------------------
// Copyright (c) CPqD, Inc. All rights reserved
// CPqD Confidential Proprietary
// -----------------------------------------------------------------------------
// FILE NAME: pulse_train.v
// AUTHOR: Arley Salvador
// -----------------------------------------------------------------------------
// PURPOSE: The Pulse Train module receives two configuration signals 
//    pulse width and pulse period and produce a pulse train synchronized with
//    clock signal. 
// -----------------------------------------------------------------------------
// KEYWORDS: PULSE TRAIN 
// -----------------------------------------------------------------------------
// REUSE ISSUES:
// Reset Strategy:
//    - reset_async: Reset for pulse train (Active high)
// Clock Domains:
//    - clock: System clock 
// Critical Timing:
// Test Features:
// Asynchronous I/F:
// Scan Methodology: 
// Synthesizable (y/n):
// Other: 
// -----------------------------------------------------------------------------
// RELEASE HISTORY:
// VERSION :   DATE      :  AUTHOR  : DESCRIPTION
// 1.0     : 22-Sep-2017 :  Arley   : First release
// -FHDR------------------------------------------------------------------------


module pulse_train(
    input wire clock,              // Clock 
    input wire reset_async,        // Reset assncrono
    input wire [7:0] pulse_width,  // Configura a largura do pulso
    input wire [7:0] pulse_period, // Configura o perodo de gerao de pulsos
    output reg pulse_out           // Sada de pulso gerado

    );
    
    reg [7:0] counter; // contador utilizado para controlador a gerao de pulsos
    
//----------------------------------------------------------------
// Name: Control Counter 
// Contador utilizado para controlar a gerao de pulsos. Marca
//   o incio e o fim de um perodo de gerao de pulso.
//----------------------------------------------------------------     
    always @(posedge clock, posedge reset_async) 
    begin: control_counter
        if (reset_async==1'b1) 
            counter <= 8'd0; 
        else
            if (counter < pulse_period)
                counter <= counter+1'b1;
            else
                counter <= 8'd0;
    end    

//----------------------------------------------------------------
// Name: Gerador de trem de pulsos 
// Gera pulsos com periodo definido pelo sinal period e largura
//   definida pelo sinal pulse width.
//----------------------------------------------------------------     
    always @(posedge clock, posedge reset_async) 
    begin: pulse_train
        if (reset_async==1'b1) 
            pulse_out <= 1'b0; 
        else
            if (counter < pulse_width)
                pulse_out <= 1'b1;
            else
                pulse_out <= 1'b0;
    end 
    
endmodule