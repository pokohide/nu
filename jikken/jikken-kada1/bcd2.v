/*                    *
 * bcd2.v             *
 * 2桁のBCDコード     *
 *                    */

`include "bcd1.v"

module bcd2(clk, reset, x, bcd2_out);
  input clk, reset, x;
  output [7:0] bcd2_out;

  /* 1桁目の信号線 */
  wire bcd1a_clk;
  wire bcd1a_reset;
  wire bcd1a_x;
  wire [3:0] bcd1a_out;

  /* 2桁目の信号線 */
  wire bcd1b_clk;
  wire bcd1b_reset;
  wire bcd1b_x;
  wire [3:0] bcd1b_out;

  /* clk 信号の分配 */
  assign bcd1a_clk = clk;
  assign bcd1b_clk = clk;

  /* reset 信号の分配 */
  assign bcd1a_reset = reset;
  assign bcd1b_reset = reset;

  /* 1桁めのカウントアップ信号 */
  assign bcd1a_x = x;

  /* 各桁の BCD カウンタの実体化 */
  bcd1 bcd1a(bcd1a_clk, bcd1a_reset, bcd1a_x, bcd1a_out);
  bcd1 bcd1b(bcd1b_clk, bcd1b_reset, bcd1b_x, bcd1b_out);

  /* 2桁目のカウントアップ信号 */
  assign bcd1b_x = (bcd1a_out == 9) ? 1'b1 : 1'b0;

  /* 2桁目の BCD カウンタの出力のアサイン */
  assign bcd2_out = {bcd1b_out, bcd1a_out};
endmodule

