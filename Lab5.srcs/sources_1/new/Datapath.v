`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 12:12:27 AM
// Design Name: 
// Module Name: Datapath
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


module Datapath(input clk,rst);

wire [63:0] counter_out;
wire [31:0] instruction;
wire Reg2Loc,UncondBranch,Branch,MemRead,MemtoReg;
wire [3:0] ALUop;
wire MemWrite,ALUsrc,RegWrite;

reg [4:0] ReadSelect1, ReadSelect2,WriteSelect;



Program_Counter counter( clk,rst,zero,UncondBranch,Branch,instruction,counter_out);
Instruction_Memory IM(counter_out,instruction );
Control_Logic control(rst,instruction,Reg2Loc,UncondBranch,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite);
Register_File register(ReadSelect1, ReadSelect2, WriteSelect, WriteData, RegWrite, ReadData1, ReadData2, clk, rst);

always @(Reg2Loc,instruction ,posedge rst) begin
    if(rst) begin
        ReadSelect1=31;
        ReadSelect2=31;
        WriteSelect=31;
    end
    else if (Reg2Loc) begin
        ReadSelect1=instruction[9:5];
        ReadSelect2=instruction [4:0];
        WriteSelect=instruction [4:0];
    end
    else if (Reg2Loc==0) begin
        ReadSelect1=instruction[9:5];
        ReadSelect2=instruction [20:16];
        WriteSelect=instruction [4:0];
    end
    
end



endmodule
