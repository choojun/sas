ods pdf file='/home/u63487999/my.pdf';
*ods rtf file='/home/u63487999/my.rtf';
proc report data=grocery
style(report)=[cellspacing=5 borderwidth=10 bordercolor=blue]
style(header)=[color=black
               fontstyle=italic fontsize=6]
style(column)=[color=moderate brown
               fontfamily=helvetica fontsize=4]
style(lines)=[color=white backgroundcolor=black
              fontstyle=italic fontweight=bold fontsize=5]
style(summary)=[color=cx3e3d73 backgroundcolor=cxaeadd9
                fontfamily=helvetica fontsize=3 textalign=r];
                
   column manager department sales;
   define manager / order order=formatted
                    format=$mgrfmt. 'Manager'
                    style(header)=[color=white
                                   backgroundcolor=black];
   define department / order order=internal
                       format=$deptfmt. 'Department'
                       style(column)=[fontstyle=italic];
   break after manager / summarize;
   
   compute after manager
           / style=[fontstyle=roman fontsize=3 fontweight=bold
             backgroundcolor=white color=black];
      line 'Subtotal for ' manager $mgrfmt. 'is '
            sales.sum dollar7.2 '.';
   endcomp;
   
   compute sales;
      if sales.sum>100 and _break_=' ' then
      call define(_col_, "style",
                  "style=[backgroundcolor=yellow
                          fontfamily=helvetica
                          fontweight=bold]");
   endcomp;
   
   compute after;
       line 'Total for all departments is: '
            sales.sum dollar7.2 '.';
   endcomp;
   
   where sector='se';
   title 'Sales for the Southeast Sector';
run;
ods pdf close;
*ods rtf close;