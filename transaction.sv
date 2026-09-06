class dff_transaction;

    rand bit[3:0] d;
    rand bit reset;
    
        bit [3:0] q;
   
    constraint c_reset {
            reset inside {0,1};
        }
    constraint c_data{
     d inside{[1:15]};
    }
        

    function void display();
        $display("d=%d reset=%d", d, reset);
    endfunction

endclass