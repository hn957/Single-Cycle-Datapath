`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 03:04:45 PM
// Design Name: 
// Module Name: ALU_test
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


module ALU_test;

reg [31:0] instruction;
reg [63:0]Reg1Data,Reg2Data;
reg [3:0] ALUop;
wire zero;
wire [63:0] ALU_Out;

ALU test_ALU(instruction, Reg1Data ,Reg2Data,ALUop,ALU_Out ,zero);
initial begin
Reg1Data =8;
Reg2Data =10;
instruction =0;
ALUop=4'b0001;

#10;
ALUop=4'b0010;

#10;
ALUop=4'b0100;

#10;
ALUop=4'b0101;

#10;
ALUop=4'b0011;

#10;
ALUop=4'b0110;

#10;
Reg2Data=8;
ALUop=4'b0111;

end
endmodule
