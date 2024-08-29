/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;
	title 'Range of Temperatures in Celsius';
	
   	select City, 
   		(AvgHigh - 32) * 5/9 as HighCelsius format=5.1, 
    		(AvgLow - 32) * 5/9 as LowCelsius format=5.1,
        	(calculated HighCelsius - calculated LowCelsius)
        		as Range format=4.1
    	from myLib.worldtemps;
run;
quit;
