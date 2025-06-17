/*
 * 
 * NANO CPU   --------  VERSÃO INCOMPLETA A SER PREENCHIDA PELOS ALUNOS
 * Fernando Gehm Moraes
 * 03/maio/2025
 * 
*/

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 16-bit register  
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module Reg16bit (
    input logic ck, rst, we, 
    input logic [15:0] D,
    output logic [15:0] Q
);
    always_ff @(posedge ck or posedge rst) begin
        if (rst) begin
            Q <= 'b0;
        end else if (we) begin
            Q <= D;
        end
    end

endmodule

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// NanoCPU description  
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module NanoCPU (
    input  logic ck, rst,
    output logic [7:0]  address,
    input  logic [15:0] dataR,
    output logic [15:0] dataW,
    output logic ce, we
);
    // instructions executed by the nanoCPU
    typedef enum logic [3:0] {
        iREAD, iWRITE, iJMP, iBRANCH, iXOR, iSUB, iADD, iLESS, iEND
    } instType;
    instType inst;

    // EAs for the control FSM
    typedef enum logic [3:0] {
        IDLE, FETCH, EXEC, LD, WRITE, ALU, JMP, BRANCH, fim
    } EAType;
    EAType EA;

    logic [15:0] reg_bank [3:0];    // 4 16-bit registers
    logic wPC, wIR, wReg;
    logic [3:0] wen;
    logic [1:0] addReg;
    logic [15:0] IR, RS1, RS2, muxRegIn, outalu, muxPC, PC;

   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   // data-path - responsible to execute the current instruction 
   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   // memory interface
   assign dataW   = outalu;
   assign address = (EA==FETCH) ? PC[7:0] : IR[11:4];
   assign ce      = 1;
   assign we      = 0;               // completar -atividade 6
   
    // register bank - 4 general purpose registers
   genvar i;
   generate
    for (i = 0; i < 4; i++) begin
        assign wen[i] = (addReg == i && wReg);
        Reg16bit reg_inst (.ck(ck), .rst(rst), .we(wen[i]), .D(muxRegIn), .Q(reg_bank[i]) );
    end
   endgenerate

    assign addReg   =  (EA == LD) ? IR[1:0] : IR[9:8];        // completar - atividade 1
    assign muxRegIn = (EA == LD) ? dataR : outula;          // completar - atividade 1

   assign RS1 = reg_bank[IR[5:4]];    // reg bank output multiplexers 
   assign RS2 = reg_bank[IR[1:0]];

   // arithmetic and logic unit        // completar - atividade 4
   always_comb begin
        unique case (inst)
            default: outalu = RS1 + RS2;
        endcase
    end

   // IR and PC registers 
   Reg16bit R_IR (.ck(ck), .rst(rst), .we(wIR), .D(dataR), .Q(IR));
   Reg16bit R_PC (.ck(ck), .rst(rst), .we(wPC), .D(muxPC), .Q(PC));

   assign  muxPC =  PC + 1;            // completar - atividade 7

   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   // control block  - manages the execution of instructions
   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   always_comb begin               // decode the current instruction
        case (IR[15:12])           // completar - atividade 2
            4'h0: inst = iREAD;
            default: inst = iEND;
        endcase
    end

    assign wPC  = (EA inside {LD, ALU, WRITE, JMP, BRANCH});
    assign wReg = (EA inside {LD, ALU});
    assign wIR  = (EA == FETCH);

    always_ff @(posedge ck or posedge rst) begin    
      if (rst)
        EA <= IDLE;
      else begin
        unique case (EA)
            IDLE:    EA <= FETCH;
            FETCH:   EA <= EXEC;
            EXEC:    unique case (inst)          // completar - atividade 3
                         iEND:     EA <= fim;
                         iREAD:    EA <= LD;
                         default:  EA <= ALU;
                     endcase
            fim:     EA <= fim;
            default: EA <= FETCH;
        endcase
       end
   end

endmodule
