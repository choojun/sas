proc report data=grocery;
   title 'My Report';
   column ('Individual Store Sales as a Percent of All Sales'
            sector manager sales,(sum pctsum) comment);
   define manager / group format=$mgrfmt.;
   define sector / group format=$sctrfmt.;
   define sales / format=dollar11.2 '';
   define sum / format=dollar9.2 'Total Sales';
   define pctsum / 'Percent of Sales' format=percent6.;
   define comment / computed style(column)=[cellwidth=2.5in];
   
   compute comment / char length=40;
      if sales.pctsum gt .15 and _break_ = ' '
      then comment='Sales substantially above expectations.';
      else comment=' ';
   endcomp;
   rbreak after / summarize style=[font_style=italic];
run;