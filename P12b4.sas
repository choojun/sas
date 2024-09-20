proc iml;

/* objective function, has minimum value at x = xopt */
start sin_obj(x) global(xopt);
   r = abs(sin(sum(abs(x-xopt))));
   return(r);
finish;

xopt = { 0 0 0 };
optimum = xopt;
optval = sin_obj(optimum);

id = gasetup(1,         /* 1-> floating-point vector encoding */
             3,         /* 3-> length of solution vectors */
             1234);     /* 0-> initial random seed */
call gasetobj(id,
              0,        /* 0->minimize a user module */
              "sin_obj"); /* module name */
call gasetcro(id,
              0.9,      /* crossover probabilty */
              4);       /* 4-> heuristic crossover operator */
call gasetmut(id,
              0.05,     /* mutation probability */
              2,        /* 2-> delta mutation operator */
              0.01);    /* delta value  */
call gasetsel(id,
              5,        /* carry best 5 solutions forward */
              1,        /* dual tournament */
              0.95);    /* best-player wins probability */

bounds = {-1 -1 -1,
           1  1  1};
call gainit(id,
            200,        /* initial population size */
            bounds);    /* upper/lower bounds for random components */

summary = j(20,2);
mattrib summary [c = {"BestValue", "AvgValue"}];
call gagetval(value, id);
summary[1,1] = value[1];
summary[1,2] = value[:];

do i = 2 to 20;
   call garegen(id);
   call gagetval(value, id);
   summary[i,1] = value[1];
   summary[i,2] = value[:];
end;

print (t(1:20))[L="Iteration"] summary;
call gaend(id);


/* Adapted from: https://documentation.sas.com/doc/en/imlcdc/14.2/imlug/imlug_geneticalgs_sect016.htm
*/
