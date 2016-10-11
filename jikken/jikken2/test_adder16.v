/*                                 *
 * test_adder16.v                  *
 * 16 ビット加算回路のテストベンチ *
 *                                 */

`timescale 1ns / 1ns    // シミュレーションの単位時間 / 精度
`include "adder16.v"

module test;
  reg [15:0] x, y;
  reg cin;

  wire [15:0] sum;
  wire cout;

  adder16 adder16a(x, y, cin, sum, cout);

  always begin
    #10 x = x + 100;
  end

  always begin
    #5 y = y + 300;
  end

  initial begin
    x = 0; y = 0; cin = 0;
  end
endmodule

