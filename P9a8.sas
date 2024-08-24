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
	
    select City, Country, mean(AvgHigh, AvgLow) as MeanTemp
    	from myLib.worldtemps
      	where calculated MeanTemp gt 75 order by MeanTemp desc;
   	*select Name, Continent, Population format=comma20., 
   		freq(Population) as FreqPopulation format=comma20.,
   		max(Population) as MaxPopulation format=comma20.,
   		min(Population) as MinPopulation format=comma20.,
   		std(Population) as StdPopulation format=comma20.,
   		/* standard error of the mean */
   		stderr(Population) as StdErrPopulation format=comma20.,
   		/* corrected sum of squares */
   		css(Population) as CssPopulation format=comma20.,
   		var(Population) as VarPopulation format=comma20.,
   		nmiss(Population) as MissingPopulation format=comma20.
    	from myLib.countries order by Population desc;
    	

    	
    *select Name, Continent, Population format=comma14.,
        (Population/sum(Population)*100) as Percentage format=comma8.2
      	from myLib.countries order by Percentage desc;
    *select Name, Continent, Population format=comma14.,
        (Population/sum(Population)*100) as Percentage format=comma8.2
      	from myLib.countries order by Continent ASC, Percentage desc;
   		
   		
   	/* Observe the sequence of constructing SELECT statement:
   		SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY*/
run;
quit;