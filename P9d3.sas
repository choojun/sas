/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* A correlated subquery requires a value or 
	values to be passed to it by the outer query. 
	After the subquery runs, it passes the results back to the outer query. 
	Correlated subqueries can return single or multiple values. 
	
	Note that the WHERE clause uses an = (equal) operator. 
	We can use an = (equal) operator if the subquery returns only a single value. 
	However, if the subquery returns multiple values, 
	then you must use IN or a comparison operator with ANY or ALL.
	*/
	select * from myLib.oilrsrvs o
      	where 'Africa' =
        	(select Continent from myLib.countries c
            where c.Name = o.Country);
            
    select * from myLib.oilrsrvs o
      	where 'Asia' =
        	(select Continent from myLib.countries c
            where c.Name = o.Country);

run;
quit;