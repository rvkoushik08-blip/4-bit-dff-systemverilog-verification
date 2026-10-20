module assertion (
    input logic clk,
    input logic reset,
    input logic [3:0] d,
    input logic [3:0] q
);

    // Assertion 1: After reset is sampled,
    // q must be zero at the next rising edge.
    property p_reset;
        @(posedge clk)
        reset |=> q == 4'b0000;
    endproperty

    assert property (p_reset)
        else $error("RESET ASSERTION FAILED");

    // Assertion 2: When reset is not active,
    // q must capture the previous cycle's d.
    property p_data;
        @(posedge clk)
        !reset |=> q == $past(d);
    endproperty

    assert property (p_data)
        else $error("DATA ASSERTION FAILED");

endmodule