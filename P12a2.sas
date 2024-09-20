/* Individuals are ROW vectors. Population is a matrix of stacked rows. */
proc iml;
call randseed(12345);
/* Solve the knapsack problem: max Value*b  subject to Weight*b <= WtLimit */
/* Item:  1 2 3 4 5   6   7   8   9  10  11  12  13  14  15  16  17 */
Weight = {2 3 4 4 1.5 1.5 1   1   1   1   1   1   1   1   1   1   1}`;
Value  = {6 6 6 5 3.1 3.0 1.5 1.3 1.2 1.1 1.0 1.1 1.0 1.0 0.9 0.8 0.6}`;
WtLimit = 9;                                 /* weight limit */
N = nrow(Weight);
 
/* set up an encoding for the GA */
id = gaSetup(2,                 /* 2-> integer vector encoding */
             nrow(weight),      /* size of vector */
             123);              /* internal seed for GA */


/* GA hyperparameters */
lambda = 100;       /* factor to penalize exceeding the weight limit */
ProbMut= 0.2;       /* probability that the i_th site is mutated */
ProbCross = 0.3;    /* children based on 30%-70% split of parents */
 
/* b is a binary column vector */
start ObjFun( b ) global(Weight, Value, WtLimit, lambda);
   wsum = b * Weight;
   val  = b * Value;
   if wsum > WtLimit then                      /* penalize if weight limit exceeded */
      val = val - lambda*(wsum - WtLimit)##2;  /* subtract b/c we want to maximize value */
   return(val);
finish;
 
/* Mutation operator for a binary vector, b. */
start Mutate(b) global(ProbMut);
   N = ncol(b);
   k = max(1, randfun(1, "Binomial", ProbMut, N)); /* how many sites? */
   j = sample(1:N, k, "NoReplace");                /* choose random elements */
   b[j] = ^b[j];                                   /* mutate these sites */
finish;
 
/* Crossover operator for a a pair of parents. */
start Cross(child1, child2, parent1, parent2) global(ProbCross);
   b = j(ncol(parent1), 1);
   call randgen(b, "Bernoulli", ProbCross); /* 0/1 vector */
   idx = loc(b=1);                          /* locations to cross */
   child1 = parent1;
   child2 = parent2;
   if ncol(idx)>0 then do;                  /* exchange values */
      child1[idx] = parent2[idx];
      child2[idx] = parent1[idx];
   end;
finish;
 
/* register these modules so the GA can call them as needed */
call gaSetObj(id, 1, "ObjFun"); /* 1->maximize objective module */
call gaSetCro(id,
              1.0,              /* hyperparameter: crossover probability */
              0, "Cross");      /* user-defined crossover module */
call gaSetMut(id,
              0.20,             /* hyperparameter: mutation probability */
              0, "Mutate");     /* user-defined mutation module */

/* We are using GASETSEL to specify the rules for selecting elite individuals 
and for are selecting which individuals are eligible to reproduce. 
The following call specifies that 3 elite individuals are "cloned" 
for the next generation.
*/
call gaSetSel(id,
              3,                /* hyperparameter: carry k elites directly to next generation */
              1,                /* dual tournament */
              0.95);            /* best-player-wins probability */








/* Try 1: example of very small population; only 10 candidates */
call gaInit(id,  10,            /* initial population size */
            j(1,  nrow(weight), 0) //   /* lower and upper bounds of binary vector */
            j(1,  nrow(weight), 1) );

call gaGetVal(f0, id);     /* initial generation is random */ 
call gaRegen(id);          /* create the next generation via selection, crossover, and mutation */
call gaGetVal(f1, id);     /* evaluate fitness */
call gaRegen(id);          /* continue for additional generations ...*/
call gaGetVal(f2, id);
 
/* print fitness for each generation and top candidates so far */
print f0[L="Initial Fitness"] f1[L="1st Gen Fitness"] f2[L="2nd Gen Fitness"];

call gaGetMem(best, val, id, 1:3);
print best[f=1.0 L="Best Members"], val[L="Best Values"];







/* Try 2: for genetic diversity, better to have a larger population, i.e. 100 */
*call gaInit(id,  100,                 /* initial population size */
            j(1,  nrow(weight), 0) //  /* lower and upper bounds of binary vector */
            j(1,  nrow(weight), 1) );   
/* record the best and median scores for each generation */
*niter = 15;
*summary = j(niter,3);
*summary[,1] = t(1:niter);   /* (Iteration, Best Value, Median Value) */
*do i = 1 to niter;
*   call gaRegen(id);
*   call gaGetVal(f, id);
*   summary[i,2] = f[1];   
*.  summary[i,3] = median(f);
*end;
*print summary[c = {"Iteration" "Best Value" "Median Value"}];

/* print the top candidates */
*call gaGetMem(best, f, id, 1:3);
*print best[f=1.0 L="Best Member"], f[L="Final Best Value"];




call gaEnd(id);   /* free the memory and internal resources for this GA */

/* Adapted from: https://blogs.sas.com/content/iml/2021/10/20/intro-genetic-algorithms-sas.html
*/
