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

    	/* = EQ  		equal to 
    	^= -= <> NE 	not equal to
    	> GT			greater than
    	< LT			less than
	>= GE			greater than or equal to
	<= LE			less than or equal to
	& AND
	! | OR
	^ - NOT
    	*/
	select Name, Continent, Population from myLib.countries
		where Continent eq 'Africa' and Population gt 5000000;
	*select Name, Continent, Population from myLib.countries
		where Continent = 'Africa' and Population > 5000000;
	*select Name, Continent, Population from myLib.countries
		where Continent ne 'Africa' or Population ge 5000000;
	*select Name, Continent, Population from myLib.countries
		where Continent ^= 'Africa' and not Population >= 5000000;
		
	*select Name, Continent, Population from myLib.countries
		where Population > any 
		(select Population from myLib.countries);
	*select Name, Continent, Population from myLib.countries
		where exists (select Population from myLib.countries 
			where Population = 17070323);
	*select Name, Continent, Population from myLib.countries
		where Name =* (select Name from myLib.countries 
			where Name = 'Afghanistan');
	*select Name, Continent, Population from myLib.countries
		where Population between 1000000 and 5000000;
	*select Name, Continent, Population from myLib.countries
		where Continent contains 'Africa';

   		
   	/* Observe the sequence of constructing SELECT statement:
   		SELECT, FROM, WHERE */
run;
quit;
