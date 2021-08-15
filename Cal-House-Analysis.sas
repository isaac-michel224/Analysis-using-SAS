
*Import House Data in Program;

/* proc import file='/home/u59144967/My SAS files/modified house data.dta' */
/* 	out=work.house */
/* 	dbms=dta; */
/* run; */

*Observations;

proc print data=work.house (obs=10) noobs;
run;

*Frequencies Example and Univariate;

proc freq data=work.house;
tables lajolla culd;
 	tables lajolla fence; 
run;


proc univariate data=work.house;
		var price age yard sqft;
	run;
	
*Cross-Tabulations;

proc freq data=work.house;
	tables lajolla*rooms;
run;

*Correlation Test - with Matrix;

proc corr data=work.house /*plots=matrix*/;
/* var price age; */
run;

*Paired T-test;

proc ttest data=work.house;
title "Paired sample t-test example";
paired price*pool; /* Continuous*Categorical */
run;


*Chi-Square test;

proc freq data=work.house;
	tables lajolla*rooms
		/chisq;
run;

*ANOVA test;

proc anova data=work.house;
title "ANOVA test between Price of House and Number of Rooms";
class rooms;
model price = rooms;
means rooms / tukey lines; /*  Turkey's Studentized method to compare the mean values */
run;

*Linear Regression;

proc reg data = work.house;
model price = yard;
run;

*Another Linear Regression;

proc reg data = work.house;
title "Factors Influencing the Price of a House in California";
model price = yard sqft lajolla pool view age;
run;
