class environment;

    generator gen;
    driver    drv;
    monitor   mon;
    scoreboard sb;

    mailbox #(dff_transaction) gen2drv;
    mailbox #(dff_transaction) mon2sb;

    virtual dff_if vif;

    function new(virtual dff_if vif);

        this.vif = vif;

        gen2drv = new();
        mon2sb  = new();

        gen = new(gen2drv);
        drv = new(gen2drv, vif);
        mon = new(mon2sb, vif);
        sb  = new(mon2sb);

    endfunction

    task run();

        fork
            gen.run();
            drv.run();
            mon.run();
            sb.run();
        join

    endtask
endclass