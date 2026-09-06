`timescale 1ns/1ps

module top;

    dff_if vif();

    d_flip dut (
        .clk   (vif.clk),
        .reset (vif.reset),
        .d     (vif.d),
        .q     (vif.q)
    );

    test t;

   initial begin
    vif.clk = 0;

    t = new(vif);

    t.run();

    $finish;
end

    always #5 vif.clk = ~vif.clk;

endmodule