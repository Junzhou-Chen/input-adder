`timescale 1ns / 1ps
//*************************************************************************
// > 文件名：adder.v
// > 描述：加法器
// > 作者：陈俊州
// > time：2022-06-04
//*************************************************************************
module adder(
 input [31:0] operand1,
 input [31:0] operand2,
 input cin,
 output [31:0] result,
 output cout
 );
 assign {cout,result} = operand1 + operand2 + cin;
endmodule