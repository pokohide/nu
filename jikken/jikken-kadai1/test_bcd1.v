/*                                 *
 * test_bcd1.v                     *
 * 1桁のBCDカウンタのテストベンチ      *
 *                                 */
 
`timescale 1ns / 1ns    // シミュレーションの単位時間 / 精度
`include "bcd1.v"       // bcd1.v の読み込み
 
module test;
  /*** bcd1 の入力値格納用のレジスタ ****/
  reg reset, clk, x;

  /*** bcd1 の出力観測用の信号線 ****/
  wire [3:0] bcd1_out;

  /*** bcd1 の実体化 ***/
  bcd1 bcd1a(clk, reset, x, bcd1_out);
 
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
    
    #200 reset = 0;

    #20 reset = 1;

    // 更に 1000 単位時間(1000 ns)後, 終了
    #1000 $finish;
  end
endmodule // test
