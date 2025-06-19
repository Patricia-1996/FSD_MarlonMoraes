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
     //ativ 9 loop de somas
     0: 'h4000,   // XOR R0, R0, R0
     1: 'h4111,   // XOR R1, R1, R1
     2: 'h0093,   // Read R3 <- mem[9]
     3: 'h6110, // ADD R1 = R1 + R0
     4: 'h8000,// INC R0
     5: 'h7203, //LESS R2 = R0 < R3
     6: 'h3032, // BRANCH to 3 if R2 ==1
     7: 'h10A1,     //WRITE R1 -> mem[10]
     8: 'h2140, // JMP to 20, vai ativ 8
     9: 'h000A, constante 10
     10: 'h0000, //resultado final será escrito aqui mem[10]

     //Atividade 8 - INC/DEC separadamente 
     20:'h8000,  //INC R0 = R0 +1
     21: 'h8110, // INC R1 = R1 +1
     22: 'h9220, //DEC R2 = R2 -1
     23: 'h9330, //DEC R3 = R3 -1
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
  end

endmodule
