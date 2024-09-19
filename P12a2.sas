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

/* Adapted from: https://blogs.sas.com/content/iml/2021/10/18/crossover-mutation.html
*/