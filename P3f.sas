data all;
   drop string;
   string='  3 quick brown fox jumps over the lazy dog.   ';
   out=cats(compress(string," ","a"));
   
   string2='  3 quick brown fox jumps over the lazy dog.   ';
   out2=cats(compress(string2," ","ka"));
   
   string3='  3 quick brown fox jumps over the lazy dog.   ';
   out3=cats(compress(string3," ","d"));
   
   string4='  3 quick brown fox jumps over the lazy dog.   ';
   out4=cats(compress(string4," ","kd"));
   
   *out5=cats(compress(string4," ","a"),compress(string4," ","d"));
   *out6=cats(compress(string4," ","ka"),compress(string4," ","kd"));
run;

/* 
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.2/lefunctionsref/n0fcshr0ir3h73n1b845c4aq58hz.htm
*/
proc print data=all; *noobs;
run;