`timescale 1ns / 1ps //仿真单位时间为 1ns，精度为 1ps
module display_test;
 // Inputs
 reg [3:0] A;
 reg [3:0] B;
 reg cin;
 // Outputs
 wire [3:0] S;
 wire cout;
 // Instantiate the Unit Under Test (UUT)
 add4 test (
 .A(A), 
 .B(B), 
 .C_in(cin), 
 .S(S), 
 .C_out(cout)
 );
 initial begin
 // Initialize Inputs
 A = 0;
 B = 0;
 cin = 0;
 // Wait 100 ns for global reset to finish
 #100;
 // Add stimulus here
 end
 always #10 A = $random; //$random 为系统任务，产生一个随机的 32 位数
 always #10 B = $random; //#10 表示等待10 个单位时间(10ns)，即每过10ns，赋值一个随机的 32 位数
 always #10 cin = {$random} % 2; //加了拼接符，{$random}产生一个非负数，除 2 取余得到 0 或 1
endmodule