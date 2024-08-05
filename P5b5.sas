data testTrunc;
  length p 3 q 4 r 5 x 6 y 7 z 8;
  p =  trunc(1/5, 3);
  q =  trunc(1/5, 4);
  r =  trunc(1/5, 5);
  x =  trunc(1/5, 6);
  y =  trunc(1/5, 7);
  z =  trunc(1/5, 8);
run;

proc print data=testTrunc;
run;

data test;
  length x 3;
  length y 4;
  length z 5;
  length j 6;
  length k 7;
  length l 8;
  x = 1/5;
  y = 1/5;
  z = 1/5;
  j = 1/5;
  k = 1/5;
  l = 1/5;
run;

data test2;
  set test;
  if x ne 1/5 then 
     put 'x ne 1/5';
  if y ne 1/5 then 
     put 'y ne 1/5';
  if z ne 1/5 then 
     put 'z ne 1/5';
  if j ne 1/5 then 
     put 'j ne 1/5';
  if k ne 1/5 then 
     put 'k ne 1/5';
  if l ne 1/5 then 
     put 'l ne 1/5';
     
  if x eq trunc(1/5,3) then 
     put 'x eq trunc(1/5,3)';
  if y eq trunc(1/5,4) then 
     put 'y eq trunc(1/5,4)';
  if z eq trunc(1/5,5) then 
     put 'z eq trunc(1/5,5)';
  if j eq trunc(1/5,6) then 
     put 'j eq trunc(1/5,6)';
  if k eq trunc(1/5,7) then 
     put 'k eq trunc(1/5,7)';
  if l eq trunc(1/5,8) then 
     put 'l eq trunc(1/5,8)';
run;