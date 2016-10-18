/*                              *
 * adder16s.v                   *
 * 順序回路版 16 ビット加算回路     *
 *                              */

module adder16s(clk, reset, x, y, cin, sum, cout);
  input [15:0] x, y;
  input clk, reset, cin;
  output [15:0] sum;
  output cout;

  reg [15:0] r0, r1;

  assign {cout, sum} = r0 + r1 + cin;

  always @(posedge clk or negedge reset) begin
    if(reset == 1'b0) begin
      r0 <= 0; r1 <= 0;
    end else begin
      r0 <= x; r1 <= y;
    end
  end
endmodule

