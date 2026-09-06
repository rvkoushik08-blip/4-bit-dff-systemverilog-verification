class scoreboard;

    dff_transaction tr;
    mailbox #(dff_transaction)mon2sb;

    function new(mailbox #(dff_transaction) mon2sb);
        this.mon2sb =mon2sb;
    endfunction

    task run();
       repeat(50) begin

           mon2sb.get(tr);

            if (tr.reset) begin
                if (tr.q == 4'b0000)
                    $display("PASS: reset = 1, q = %0d", tr.q);
                else
                    $display("FAIL: reset = 1, q = %0d", tr.q);
            end

            else begin
                if (tr.q == tr.d)
                    $display("PASS: d = %0d, q = %0d", tr.d, tr.q);
                else
                    $display("FAIL: d = %0d, q = %0d", tr.d, tr.q);
            end

        end
    endtask

endclass