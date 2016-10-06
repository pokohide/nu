/*                   *
 * adder16.v         *
 * 16 ƒrƒbƒg‰ÁZ‰ñ˜H *
 *                   */

module adder16(x, y, cin, sum, cout);
  input [15:0] x, y;
  input cin;
  
  output [15:0] sum;
  output cout;

  assign {cout, sum} = x + y + cin;
endmodule

