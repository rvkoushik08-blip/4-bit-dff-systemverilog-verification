class monitor;

    virtual dff_if vif;
    dff_transaction tr;
    mailbox #(dff_transaction)mon2sb;

    function new(mailbox #(dff_transaction) mon2sb,
                 virtual dff_if vif);
        this.mon2sb = mon2sb;
        this.vif = vif;
    endfunction

    task run();
        repeat(50) begin
            @(negedge vif.clk);

            tr = new();

            tr.d     = vif.d;
            tr.reset = vif.reset;
            tr.q     = vif.q;

            mon2sb.put(tr);

            tr.display();
        end
    endtask

endclass