proc format;
   value $perish 'p1','p2'='Group1'
                'np1','np2'='Group2';
run;

proc report data=grocery;
   column manager department, sales sales;
   define manager / group order=formatted
                    format=$mgrfmt.;
   define department / across order=formatted
                 format=$perish. '';
   define sales / analysis sum
                  format=dollar9.2 style=[cellwidth=13];
                  
   compute after / style=[font_style=italic];
      line 'Total sales for these stores were: '
            sales.sum dollar9.2;
   endcomp;
   title 'Sales Summary for All Stores';
run;