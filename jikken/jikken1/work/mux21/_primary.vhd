library verilog;
use verilog.vl_types.all;
entity mux21 is
    port(
        S1              : in     vl_logic;
        D0              : in     vl_logic;
        D1              : in     vl_logic;
        Y               : out    vl_logic
    );
end mux21;
