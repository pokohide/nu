vli/*                                 *
 * test_bcd2.v                     *
 * 2桁のBCDカウンタのテストベンチ  *
 *                                 */
 
`timescale 1ns / 1ns    // シミュレーションの単位時間 / 精度
`include "bcd2.v"       // bcd2.v の読み込み
 
module test;
  /*** bcd2 の入力値格納用のレジスタ ****/
  reg reset, clk, x;

  /*** bcd2 の出力観測用の信号線 ****/
  wire [7:0] bcd2_out;

  /*** bcd2 の実体化 ***/
  bcd2 bcd2a(clk, reset, x, bcd2_out);
 
  always begin
    #5 clk = ~clk;
  end
 
  always begin
    #15 x = ~x;
  end
 
  initial begin
    reset = 1; clk = 0; x = 0;

    // 20 単位時間(20 ns)後
    #20 reset = 0;

    // 更に 20 単位時間(20 ns)後
    #20 reset = 1;

    // 更に 2000 単位時間(2000 ns)後, 終了
    #2000 $finish;
  end
 
endmodule // test
