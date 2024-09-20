proc iml;
/* Cost coefficients for TSP problem
For the symmetric TSP, 
a simple local optimization is to check 
each pair of adjacent locations in the solution 
and swap their positions if that improves the objective function value. 
*/
coeffs = { 0 1 2 3 4 5 4 3 2 1,
           1 0 1 2 3 4 5 4 3 2,
           2 1 0 1 2 3 4 5 4 3,
           3 2 1 0 1 2 3 4 5 4,
           4 3 2 1 0 1 2 3 4 5,
           5 4 3 2 1 0 1 2 3 4,
           4 5 4 3 2 1 0 1 2 3,
           3 4 5 4 3 2 1 0 1 2,
           2 3 4 5 4 3 2 1 0 1,
           1 2 3 4 5 4 3 2 1 0 };

/* define objective function with local optimization */
start TSPObjectiveFunction(r) global(coeffs, p);
   s = r;
   nc = ncol(s);
   /* local optimization: assume symmetric cost coefficients */
   do i = 1 to nc;
      city1 = s[i];
      inext = 1 + mod(i,nc);
      city2 = s[inext];
      if i=1 then
         before = s[nc];
      else
         before = s[i-1];
      after = s[1 + mod(inext,nc)];
      if (coeffs[before,city1] + coeffs[city2, after]) >
         (coeffs[before,city2] + coeffs[city1, after]) then do;
         s[i] = city2;
         s[inext] = city1;
      end;
   end;
   /* compute objective function */
   cost = coeffs[s[nc], s[1]];
   do i = 1 to nc-1;
      cost = cost + coeffs[s[i], s[i+1]];
   end;
   if uniform(1234)<=p then
      r = s;
   return (cost);
finish;

/* problem setup */
id = gasetup(3,         /* 3 -> integer sequence encoding */
             10,        /* number of locations */
             123);      /* initial seed */
/* set objective function */
call gasetobj(id,
              0,        /* 0 -> minimize a user-defined module */
              "TSPObjectiveFunction");

call gasetcro(id, 1.0, 6);
call gasetmut(id, 0.05, 4);
call gasetsel(id, 1, 1, 0.95);
p = 0;        /* probability of writing locally optimized
               * solution back out to population  */

/* initialization phase */
call gainit(id,
            100);       /* initial population size */

/* execute regeneration loop */
niter = 10;             /* number of iterations */
BestValue = j(niter,1); /* allocate vector for results */

call gagetval(value, id, 1); /* gets first (and best) value */
BestValue[1] = value;

do i = 2 to niter;
   call garegen(id);
   call gagetval(value, id, 1);
   BestValue[i] = value;
end;

/* print solution history */
print (t(1:niter))[L="Iteration"] BestValue;

/* write local optimization back to all solutions */
p = 1.;       /* set global probability to 1 */
call gareeval(id);

/* print final solution */
call gagetmem(bestMember, value, id, 1);
print bestMember[f=3.0 L="Best Member"], value[L="Final Best Value"];

call gaend(id);

/* Adapted from: https://documentation.sas.com/doc/en/imlcdc/14.2/imlug/imlug_geneticalgs_sect015.htm
*/
