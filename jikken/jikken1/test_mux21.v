/*                                  *
 *   test_mux21.v                   *
 *   2-1セレクタ回路のテストベンチ      *
 *                                  */

`timescale 1ns / 1ns   // シミュレーションの単位時間 / 精度
`include "mux21.v"     // 1ns = 1/1000000000 sec

module test;  // テストベンチもジュール、入出力ポートはなし
  
  // mux21 の入力用 flip-flop(1-bit レジスタ) の宣言
  reg S1, D0, D1;   // flip-flop

  // mux21 の出力用 wire(信号線) の宣言
  wire Y;           // 1-bit 信号線

  // module mux21(S1, D0, D1, Y) の実体化
  mux21 mux21a(S1, D0, D1, Y);

  initial begin
    // S1, D0, D1 の初期化
    S1 = 0; D0 = 0; D1 = 0;

    // 20 単位時間(20 ns)後
    #20 S1 = 0; D0 = 1; D1 = 0;

    // さらに20 単位時間(20 ns)後
    #20 S1 = 1; D0 = 1; D1 = 0;

    // さらに20 単位時間(20 ns)後
    #20 S1 = 0; D0 = 0; D1 = 0;

    // さらに80 単位時間(80 ns)後, 終了
    #80 $finish;
  end
endmodule
