/* directory path for files: COVID_19.sas (this file), libname store */
%let homedir = /Local_Files/covid-19-sas/ccf;

/* the storage location for the MODEL_FINAL table and the SCENARIOS table */
libname store "&homedir.";

CAS;

CASLIB _ALL_ ASSIGN;

PROC CASUTIL;
	DROPTABLE INCASLIB="CASUSER" CASDATA="MODEL_FINAL" QUIET;
	LOAD DATA=store.MODEL_FINAL CASOUT="MODEL_FINAL" OUTCASLIB="CASUSER" PROMOTE;
	
	DROPTABLE INCASLIB="CASUSER" CASDATA="SCENARIOS" QUIET;
	LOAD DATA=store.SCENARIOS CASOUT="SCENARIOS" OUTCASLIB="CASUSER" PROMOTE;

	DROPTABLE INCASLIB="CASUSER" CASDATA="INPUTS" QUIET;
	LOAD DATA=store.INPUTS CASOUT="INPUTS" OUTCASLIB="CASUSER" PROMOTE;

	DROPTABLE INCASLIB="CASUSER" CASDATA="FIT_PARMS" QUIET;
	LOAD DATA=store.FIT_PARMS CASOUT="FIT_PARMS" OUTCASLIB="CASUSER" PROMOTE;

	DROPTABLE INCASLIB="CASUSER" CASDATA="FIT_PRED" QUIET;
	LOAD DATA=store.FIT_PRED CASOUT="FIT_PRED" OUTCASLIB="CASUSER" PROMOTE;
QUIT;

CAS CASAUTO TERMINATE;