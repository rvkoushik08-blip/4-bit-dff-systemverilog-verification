class coverage;

    dff_transaction tr;

    covergroup dff_cg;

        cp_reset: coverpoint tr.reset;

        cp_d: coverpoint tr.d;

    endgroup

    function new();
        dff_cg = new();
    endfunction

    function void sample(dff_transaction tr);
        this.tr = tr;
        dff_cg.sample();
    endfunction

    function void display_coverage();
        $display("Coverage = %0.2f%%", dff_cg.get_inst_coverage());
    endfunction

endclass