data all;
   length word $20;
   drop string;
   string=' The quick brown fox jumps over the lazy dog.   ';
   do until(word=' ');
      count+1;
      word=scan(string, count);
      output;
   end;
run;

proc print data=all;
run;