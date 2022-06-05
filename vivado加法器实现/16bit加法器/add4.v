`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HoHai University
// Engineer: Junzhou Chen
// Create Date: 2022/06/05 
// Design Name: 4bit先行进位加法器方法
// Module Name: add4
// Project Name: 4bit先行进位加法器
// Description: 超前进位加法器优化改进行波进位器的关键路径，通过采用并行计算进位的
//              方法，解决了行波进位加法器的进位依赖问题。
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module add4(
    // 定义成员变量
    input[3:0] A,   // 输入A
    input[3:0] B,   // 输入B
    input C_in,     // 进位输入
    output[3:0]S,   // S输出
    output C_out    // 进位输出
    );
    wire[3:0] G ,P ,C ;  
    assign G = A & B; // 生成信号（Generate）
    assign P = A ^ B; // 传播信号（Propagate）
    // 进位信号
    assign C[0] = C_in; 
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & (G[0] | (P[0] & C[0])));
    assign C[3] = G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))));
    assign C_out = G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))))));
    assign S = A ^ B ^ C;
endmodule
