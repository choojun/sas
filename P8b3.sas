proc tabulate data=sashelp.cars;
   class make type / style=[background=lightgreen];
   classlev make type / style=[background=yellow];  
   table make*
           (n='Number of make'
            pctn<type>='% of row' 
            pctn<make>='% of column'  
            pctn='% of all make'), type/rts=50 
			box=[label='Car Number by Make and Type' 
				style=[backgroundcolor=orange]];
   title 'Number of Make in Each Type';
run;