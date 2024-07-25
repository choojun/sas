data mydata;
  input name1 $ name2 $ name3 $;
  datalines;
  John Doe Jane Smith
  ;
run;

proc print data=mydata;
run;

data char_array;
  set mydata;
  array names[*] $ name1-name3;
  
  do i = 1 to dim(names);
    length name_length $8;
    name_length = length(names[i]);
    output;
  end;
  
  keep name_length;
run;

proc print data=char_array;
run;
