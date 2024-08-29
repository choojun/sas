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
		where Continent net ' '; /*NET: not equal to truncated strings*/
	*select Name, Continent, Population from myLib.countries
		where Continent is not missing;
   	*select Name, Continent, Population from myLib.countries
      		where Continent is missing;
    	*select Name, Continent, Population from myLib.countries
      		where Continent is null;
    
    	/* Watch out the missing value */
    	*select Name, Length from myLib.features
      		where Name in ('Angel Falls', 'Amazon', 'Nile');
    	*select Name, Length, avg(Length) as AvgLength from myLib.features
      		where Name in ('Angel Falls', 'Amazon', 'Nile');
    	*select Name, Length, coalesce(Length, 0) as NewLength, 
        	avg(calculated NewLength) as AvgLength 
        	from myLib.features where Name in ('Angel Falls', 'Amazon', 'Nile');
     
   		
   	/* Observe the sequence of constructing SELECT statement:
   		SELECT, FROM, WHERE*/
run;
quit;
