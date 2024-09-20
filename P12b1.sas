proc iml;
/* Cost coefficients for Traveling Salesman Problem (TSP) problem
The example searches for a solution to the traveling salesman problem. 
In this problem, cities are located on a two-by-five grid. 
The cost of traveling from one city to the next is given by 
the "taxicab distance" between the cities.
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

/* problem setup */
id = gasetup(3,         /* 3 -> integer sequence encoding */
             10,        /* number of locations */
             1234);     /* initial seed */

/* set objective function */
call gasetobj(id,
              2,        /* 2 -> traveling salesman problem */
              coeffs);  /* cost coefficient matrix */

/* initialization phase */
call gainit(id,
            100);       /* initial population size */

/* execute regeneration loop */
niter = 20;             /* number of iterations */
BestValue = j(niter,1); /* allocate vector for results */

call gagetval(value, id, 1); /* gets first value */
BestValue[1] = value;

do i = 2 to niter;
   call garegen(id);
   call gagetval(value, id, 1);
   BestValue[i] = value;
end;

/* print solution history */
print (t(1:niter))[L="Iteration"] BestValue;

/* print final solution */
call gagetmem(bestMember, value, id, 1);
print bestMember[f=3.0 L="Best Member"], value[L="Final Best Value"];

call gaend(id);


/* Adapted from: https://documentation.sas.com/doc/en/imlcdc/14.2/imlug/imlug_geneticalgs_sect014.htm
*/
