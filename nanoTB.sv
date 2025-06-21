/*
 * 
 * TEST BEHNCH PARA A NANO CPU 
 * Fernando Gehm Moraes
 * 02/maio/2025
 * 
*/
module nanoCPU_TB;

  timeunit 1ns;
  timeprecision 1ps;

  logic ck, rst;
  logic [15:0] dataR, dataW;
  logic [7:0] address;
  logic we, ce;

  // Memory array signal for 256 x 16-bit positions
  typedef logic [15:0] memory_array_t [0:255];

   memory_array_t memory = '{
     //Atividade 10 Fibonacci 
     0: 'h4000,   // XOR R0, R0, R0 -> i=0
     1: 'h4111,   // XOR R1, R1, R1 -> a=0
     2: 'h4222,   // XOR R2, R2, R2 -> b =0
     3: 'h01E3, // READ R3 <- mem[30] -> 10 (limite)
     4: 'h8211,// INC R1 -> F1 = 1

     //Loop
     5: 'h4331, //ADD R3 = R1 + R2 -> c= a + b
     6: 'h2010, // WRITE R3 -> mem[16+i]
     7: 'h6221,     //ADD R2 = R1 + 0 -> b = a
     8: 'h6113, // ADD R1= R3 +0 -> a= c
     9: 'h8000, //INC R0-> i++
     10: 'h7420, //LESS R2  = i< 10
     11: 'h30A5, // BRANCH to 5 if R2 == 1
     12: 'hF000, //END 

     //Constante
     9: 'h000A, //valor 10
      default: 'h0000
   };

  always #1 ck = ~ck;

  NanoCPU CPU ( .ck(ck), .rst(rst), .address(address), .dataR(dataR), .dataW(dataW), .ce(ce), .we(we) );

  always_ff @(posedge ck) begin  // Write to memory
    if (we) begin
      memory[address] <= dataW;
    end
  end
  
  assign dataR = memory[address];   // Read from memory

    // Generate clock and reset signals
  initial begin
    ck = 1'b0;
    rst = 1'b1;
    #2 rst = 1'b0;
    #300 $finish; //ajustei tempo final 
  end

endmodule
