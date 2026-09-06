class generator;

    dff_transaction tr;
    mailbox #(dff_transaction) gen2drv;

    function new(mailbox #(dff_transaction) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        repeat(50) begin
            tr = new();

            if (tr.randomize() == 0)
                $display("Randomization failed");
            else
                gen2drv.put(tr);

            tr.display();
        end
    endtask

endclass