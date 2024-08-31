proc summary data=sashelp.cars nway;
  class type;
  var mpg_highway;
  output out=mileage mean=mean;
run;

proc sort data=mileage;
  by mean;
run;

proc template;
  define statgraph scatterplot;
    begingraph; 
      entrytitle "Average Highway MPG By Type"; 
      layout overlay / 
        xaxisopts=(griddisplay=on gridattrs=(color=lightgray))
        yaxisopts=(griddisplay=on gridattrs=(color=lightgray)
          linearopts=(minorgrid=true minortickcount=9
            minorgridattrs=(color=lightgray pattern=dot)));      
        scatterplot x=type y=mean / 
          group=type groupdisplay=cluster 
          markerattrs=graphDataDefault;
      endlayout;    
    endgraph;
  end;
run;

proc sgrender data=mileage template=scatterplot;
run;