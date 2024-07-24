data all;
   drop string;
   string='  The quick brown fox jumps over the lazy dog     ';
   translated_var = translate(string,' ', 'o');

   string2='!!';
   *concat_var = cat(string2, string, string2);
   *concat_var2 = catx(string2, string, string2);
   
   string3=' The    quick    brown   fox jumps over the lazy dog   ';
   *compressed_var=compress(string3, 'ak');
   compbled_var=compbl(string3);
run;

proc print data=all; *noobs;
run;