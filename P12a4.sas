proc iml;
call randseed(12345);
N = 17;                      /* size of binary vector */
ProbMut= 0.2;                /* mutation in 20% of sites */
 
/* Mutation operator for a binary vector, b. 
   The number of mutation sites k ~ Binom(ProbMut, N), but not less than 1. 
   Randomly sample (without replacement) k sites. 
   If an item is not in knapsack, put it in; if an item is in the sack, take it out. */
start Mutate(b) global(ProbMut);
   N = nrow(b);
   k = max(1, randfun(1, "Binomial", ProbMut, N)); /* how many sites? */
   j = sample(1:N, k, "NoReplace");                /* choose random elements */
   b[j] = ^b[j];                                   /* mutate these sites */
finish;
 
Items = 5:12;                  /* choose items 5-12 */
b = j(N,1,0);  b[Items] = 1;
bOrig = b;
run Mutate(b);
print (bOrig`)[L="Original b" c=(1:N)]
      (b`)[L="Randomly Mutated b" c=(1:N)];




start uniform_cross(child1, child2, parent1, parent2) global(ProbCross);
   b = j(nrow(parent1), 1);
   call randgen(b, "Bernoulli", ProbCross); /* 0/1 vector */
   idx = loc(b=1);                    /* locations to cross */
 
   child1 = parent1;                  /* initialize children */
   child2 = parent2;
   if ncol(idx)>0 then do;            /* exchange values */
      child1[idx] = parent2[idx];     /* child1 gets some from parent2 */
      child2[idx] = parent1[idx];     /* child2 gets some from parent1 */
   end;
finish;

ProbCross = 0.3;                               /* crossover 25% of sites */
Items = 5:12;   p1 = j(N,1,0);  p1[Items] = 1; /* choose items 5-12 */
Items = 10:15;  p2 = j(N,1,0);  p2[Items] = 1; /* choose items 10-15 */
run uniform_cross(c1, c2, p1, p2);
print (p1`)[L="Parent1" c=(1:N)], (p2`)[L="Parent2" c=(1:N)],
      (c1`)[L="Child1" c=(1:N)], (c2`)[L="Child2" c=(1:N)];


/* Adapted from: https://blogs.sas.com/content/iml/2021/10/18/crossover-mutation.html
*/
