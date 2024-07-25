data monteCarloSimulation;
  call streaminit(12345);
  iterations = 10000;
  count = 0;
  do i = 1 to iterations;
    x = rand('Uniform');
    y = rand('Uniform');
    z = rand('Uniform');
    if x*x + y*y/(z+2) <= 1 then count + 1;
  end;
  pi_estimate = 4 * count / iterations;
  output;
run;

proc print data=monteCarloSimulation;
run;