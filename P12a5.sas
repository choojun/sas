proc iml;
/* Solve the knapsack problem: max Value*b  subject to Weight*b <= WtLimit */
/* Item:  1 2 3 4 5   6   7   8   9  10  11  12  13  14  15  16  17 */
Weight = {2 3 4 4 1.5 1.5 1   1   1   1   1   1   1   1   1   1   1};
Value  = {6 6 6 5 3.1 3.0 1.5 1.3 1.2 1.1 1.0 1.1 1.0 1.0 0.9 0.8 0.6};
WtLimit = 9;                                 /* weight limit */
N = ncol(Weight);
lambda = 10;       /* factor to penalize exceeding the weight limit */
 
/* b is a binary column vector */
start ObjFun( b ) global(Weight, Value, WtLimit, lambda);
   wsum = Weight * b;
   val  = Value * b;
   if wsum > WtLimit then                      /* penalize if weight limit exceeded */
      val = val - lambda*(wsum - WtLimit)##2;  /* subtract b/c we want to maximize value */
   return(val);
finish;
 
/* call the objective function on some possible solution vectors */
Items = 5:12;                  /* choose items 5-12 */
b = j(N,1,0);  b[Items] = 1;
ValPen = ObjFun(b);            /* values penalized if too much weight */
ValUnPen = Value*b;            /* raw values, ignoring the weights */
Wt = Weight*b;                 /* total weight of items */
print (ValPen||ValUnpen||Wt)[L="Items 5:12" 
    c={"Penalized Value" "Unpenalized Value" "Weight"}];
 
Items = 5:13;                  /* choose items 5-13 */
b = j(N,1,0);  b[Items] = 1;
ValPen = ObjFun(b);            /* values penalized if too much weight */
ValUnPen = Value*b;            /* raw values, ignoring the weights */
Wt = Weight*b;                 /* total weight of items */
print (ValPen||ValUnpen||Wt)[L="Items 5:13" 
    c={"Penalized Value" "Unpenalized Value" "Weight"}];
    
    
/* generate 1,000 random binary vectors as columns of b 
We visualize how the penalty works by generating many random binary vectors.
A scatter plot displays the penalized value versus the weight of the items.

Notice that the largest value achieved by these random binary vectors occurs 
when the sum of weights is 9, which is the constraint. 
Change the penalty parameter (such as lambda=1) and rerun the simulation, 
the largest values of the penalized objective function can occur for weights 
that exceed the constraint. Try it! 
*/
call randseed(1234);
NumSim = 1000;
Val = j(NumSim, 1, .);
b = randfun(N||NumSim, "Bernoulli", 0.3);
do i = 1 to NumSim;
   Val[i] = ObjFun(b[,i]);
end;
Wt  = Weight * b;
 
title  "Value of 1,000 Random Knapsacks";
title2 "b ~ Bern(0.3); lambda=10";
call scatter(Wt, Val) grid={x y} label={"Weight"}
             other = "refline 9 / axis=x; yaxis min=-20 label='Value';";

/* Adapted from: https://blogs.sas.com/content/iml/2021/10/13/penalties-constraints-optimization.html
*/
