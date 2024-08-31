proc summary data=sashelp.class nway;
   var height;
   class age;
   output out=classSum mean=mean std=std;
run;

proc template;
   define statgraph dotplot;
      begingraph;
         entrytitle "Mean Height by Age";
         layout overlay /
            xaxisopts=(label="Height (Mean)")
            yaxisopts=(griddisplay=on
               gridattrs=(color=lightgray pattern=dot)
               reverse=true);
            scatterplot x=mean y=age / name="scatter"
               markerattrs=(symbol=circlefilled)
               xerrorupper=eval(mean + std)
               xerrorlower=eval(mean - std)
               legendlabel="Height (Mean), 1 Standard Deviation";
            discretelegend "scatter";
         endlayout;
      endgraph;
   end;
run;

proc sgrender data=classSum template=dotplot;
   where age < 16;
run;