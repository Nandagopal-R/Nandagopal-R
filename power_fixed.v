`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2022 16:28:42
// Design Name: 
// Module Name: log
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


module log(clk);

//input [15:0] in;
//reg [15:0] in;
input clk;
wire [15:0] in;
reg [15:0] op;

reg [15:0] a [13:0],b [13:0],c[13:0];
integer i=0,l;

vio_0 in_out_name (
  .clk(clk),                // input wire clk
  .probe_in0(op),    // input wire [15 : 0] probe_in0
  .probe_out0(in)  // output wire [15 : 0] probe_out0
);

always
begin

a[0]=16'b00000000_00000000;   //0
a[1]=16'b00000000_00010000;  //0.0625
a[2]=16'b00000000_00011111;  //0.1211
a[3]=16'b00000000_00000000;   //0
a[4]=16'b00000000_00010000;  //0.0625
a[5]=16'b00000000_00011111;  //0.1211
a[6]=16'b00000000_00000000;   //0
a[7]=16'b00000000_00010000;  //0.0625
a[8]=16'b00000000_00011111;  //0.1211
a[9]=16'b00000000_00000000;   //0
a[10]=16'b00000000_00010000;  //0.0625
a[11]=16'b00000000_00011111;  //0.1211


b[0]=16'b00000000_00000000;  //0
b[1]=16'b00000100_00000000;  // 4 
b[2]=16'b00000011_00001011;  // 3.0457
b[3]=16'b00000000_00000000;  //0
b[4]=16'b00000100_00000000;  // 4 
b[5]=16'b00000011_00001011;  // 3.0457
b[6]=16'b00000000_00000000;  //0
b[7]=16'b00000100_00000000;  // 4 
b[8]=16'b00000011_00001011;  // 3.0457
b[9]=16'b00000000_00000000;  //0
b[10]=16'b00000100_00000000;  // 4 
b[11]=16'b00000011_00001011;  // 3.0457

c[0]=16'b01000000_00000000;  // 64
c[1]=16'b00010000_01001000;  //16.2849
c[2]=16'b01000000_00000000;  // 64
c[3]=16'b00010000_01001000;  //16.2849
c[4]=16'b01000000_00000000;  // 64
c[5]=16'b00010000_01001000;  //16.2849
c[6]=16'b01000000_00000000;  // 64
c[7]=16'b00010000_01001000;  //16.2849
c[8]=16'b01000000_00000000;  // 64
c[9]=16'b00010000_01001000;  //16.2849c[0]=16'b01000000_00000000;  // 64
c[10]=16'b00010000_01001000;  //16.2849
end

always @(posedge clk)
begin
//in=16'b00000000_00010111;  //0.09
for(i=0;i<=13;i=i+1)
begin
if(in>=a[i] && in<a[i+1])
l=i;
end
op=b[l]-c[l]*a[l]+8;
end

endmodule
