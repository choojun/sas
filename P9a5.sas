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
		
	select Name, Continent, Population from myLib.countries
		where Continent like 'A%' or Continent like '_____e';
	*select Name, Continent, Population from myLib.countries
		where Continent eqt 'Asia'; 
	*select Name, Continent, Population from myLib.countries
		where Continent gtt 'A';  
	*select Name, Continent, Population from myLib.countries
		where Continent ltt 'E'; 
	*select Name, Continent, Population from myLib.countries
		where Continent get 'Asia'; 
	*select Name, Continent, Population from myLib.countries
		where Continent let 'Europe';  
	*select Name, Continent, Population from myLib.countries
		where Continent net 'Europe'; 
	/*EQT: equal to truncated strings*/
	/*GTT: greater than truncated strings*/
	/*LTT: less than truncated strings*/
	/*GET: greater than or equal to truncated strings*/
	/*LET: less than or equal to truncated strings*/
	/*NET: not equal to truncated strings*/
   		
   		
   	/* Observe the sequence of constructing SELECT statement:
   		SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY*/
run;
quit;