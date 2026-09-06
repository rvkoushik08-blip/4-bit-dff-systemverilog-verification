class driver;
    virtual dff_if vif;
    dff_transaction tr;
    mailbox #(dff_transaction) gen2drv;

    // Corrected constructor parameter declaration
    function new(mailbox #(dff_transaction) gen2drv, virtual dff_if vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction
    task run() ;
    forever begin
   gen2drv.get(tr);
    @(negedge vif.clk) begin
      vif.d<=tr.d;
      vif.reset<=tr.reset;
      end
     end
    endtask

endclass