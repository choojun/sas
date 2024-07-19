data have;
  input id text $50.;
  datalines;
1 This is a sample text with a smiley face 😊
2 Another text with a smiley face 🙂 and some other characters

;

data want;
  set have;
  clean_text = compress(text, '😊🙂');
run;


proc print data = have;
run;
