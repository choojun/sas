PROC IMPORT DATAFILE='/home/u63487999/BirthsKingCounty2001.txt'
	OUT=IMPORT
	DBMS=DLM;
	*REPLACE;
	*GETNAMES=NO;
RUN;

PROC PRINT data = IMPORT (firstOBS=2 OBS=4);
RUN;