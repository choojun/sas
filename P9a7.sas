/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;
	title 'My Table';
		
   	/* Check out these three statements with GROUP BY */
   	select Continent, sum(Population) from myLib.countries
		group by Continent order by Continent;
	select Continent, sum(Population) format=comma14. from myLib.countries
		group by Continent order by Continent;
	select Continent, sum(Population) format=comma14. from myLib.countries
		where Continent is not missing
		group by Continent order by Continent;
		
	*select Continent, sum(Population) from myLib.countries
   		group by Continent
   		having Continent in ('Asia', 'Europe')
   		order by Continent;
   	*select Continent, sum(Population) as TotalPopulation format=comma16.,
        count(*) as Count from myLib.countries
      	group by Continent
      	having count(*) gt 15 order by Continent;
   	*select Location, Type, sum(Area) as TotalArea format=comma16.
      	from myLib.features where type in ('Desert', 'Lake')
      	group by Location, Type;
   		
   		
   	/* Observe the sequence of constructing SELECT statement:
   		SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY*/
run;
quit;