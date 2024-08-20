proc tabulate data=sashelp.cars;
   class make type;
   table make*
           (n='Number of make'
            pctn<type>='% of row' 
            pctn<make>='% of column'  
            pctn='% of all make'), type/rts=50;
   title 'Number of Make in Each Type';
run;