proc template;
  define statgraph scatterplot;
    begingraph; 
      entrytitle "Height and Weight by Sex"; 
      layout overlay; 	 
        scatterplot x=height y=weight / 
          group=sex name="scatter" datalabel=name;
        discretelegend "scatter";
      endlayout;	
    endgraph;
  end;
run;

proc sgrender data=sashelp.class template=scatterplot;
run;
