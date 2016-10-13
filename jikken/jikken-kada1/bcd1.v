/*                *
 * bdc1.v         *
 * 1桁のBCDコード *
 *                */

module bcd1(clk, reset, x, bcd1_out);
  input clk, reset, x;
  output [3:0] bcd1_out;

  reg [3:0] count_reg;  // 4-bit レジスタ

  assign bcd1_out = count_reg;

  // クロックの立ち上がり or リセット信号の立ち下がりイベントが発生した時の処理
  always @(posedge clk or negedge reset) begin
    if(reset == 1'b0) begin
      /* レジスタの初期値を設定(count_reg = 0000) */
      // count_reg[0] <= 1'b0;
      // count_reg[1] <= 1'b0;
      // count_reg[2] <= 1'b0;
      // count_reg[3] <= 1'b0;
      count_reg = 0;
    end else begin
      if(x == 1'b1) begin  // x が 1'b1 のときにカウンタが動く
        if(&count_reg) begin // if(count_reg = 1111) count_reg = 0000
          // count_reg[0] <= 1'b0;  
          // count_reg[1] <= 1'b0;
          // count_reg[2] <= 1'b0;
          // count_reg[3] <= 1'b0;
          count_reg = 0; 
        end else begin
          count_reg = count_reg + x;  // カウントアップ
        end
      end // END: if(x == 1'b1) begin
    end // END: if(reset == 1'b0) begin
  end // END: always @(posedge clk or negedge reset) begin
endmodule // bcd1

