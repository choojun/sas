/* Setup required: download the latest dataset from url
https://support.sas.com/en/software/base-sas-support.html#documentation
Then, create the target remote directory before upload 
those uncompressed files to remotely created directory.
You these uploaded files to execute the following codes.
*/

libname myLib '/home/u63487999/SQLDatasetsV9';
filename trans '/home/u63487999/SQLDatasetsV9/*.sas7bdat';

proc sql; *outobs=12;

	select a.City format=$10. 'From City', a.State 'From State',
    	a.Latitude 'Latitude', a.Longitude 'Longitude',
        b.City format=$10. 'To City', b.State 'To State',
        b.Latitude 'Latitude', b.Longitude 'Longitude',
        	sqrt(((b.latitude-a.latitude)**2) +
            		((b.longitude-a.longitude)**2)) as Distance format=6.1
      	from myLib.uscitycoords a, myLib.uscitycoords b
      	where a.city ne b.city and
        	calculated Distance =
            	(select min(sqrt(((d.latitude-c.latitude)**2) +
                             ((d.longitude-c.longitude)**2)))
            	from myLib.uscitycoords c, myLib.uscitycoords d
                where c.city = a.city and 
        		c.state = a.state and
        		d.city ne c.city)
	order by a.city;
            	
run;
quit;
