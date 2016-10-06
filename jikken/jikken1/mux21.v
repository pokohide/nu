/*                    *
 *       mux21.v      *
 * 2-1 マルチプレクサ *
 * (2-1 セレクタ回路) *
 *                    */

module mux21(S1, D0, D1, Y);
  input S1, D0, D1;  // 入力 S1, D0, D1
  output Y;
  
  // Y = ((not S1) and D0) or (S1 and D1)
  assign Y = (~S1 & D0) | (S1 & D1);  // 出力ポートYへの代入(assign)
endmodule

