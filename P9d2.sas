/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	/* A multiple-value subquery can return more than one value from one column. 
	It is used in a WHERE or HAVING expression that 
	contains IN or a comparison operator that is modified by ANY or ALL. 
	*/
	select name 'Country', Population format=comma15.
      	from myLib.countries
      	where Name in 
        	(select Country from myLib.oilprod);
        	
    /* If you use the NOT IN operator in this query, 
    then the query result contains all the countries that 
    are not contained in the OilProd table.
    */
    select name 'Country', Population format=comma15. 
      	from myLib.countries  
      	where Name not in 
            (select Country from myLib.oilprod);
      	
run;
quit;