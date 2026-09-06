class test;

    environment env;

    function new(virtual dff_if vif);
        env = new(vif);
    endfunction

    task run();
        env.run();
    endtask

endclass