filename source '/home/u62978370/sasuser.v94/Guided_assignment/airlines.txt';
DATA airlines;
infile source;
input
Airline $1-20
Length 22-28
Speed 30-36
Dailyflighttime 38-44
Populationserved 46-52
TotalopCost 54-60
Revenue 62-68
Loadcap 70-76
Availablecap 78-84
Totalassets 86-92
Investmentsfunds 94-100
Adjustedassets 102-108;
format 
Revenue dollar9.2
Totalassets dollar9.2
Investmentsfunds dollar9.2
Adjustedassets dollar9.2;
IF TotalopCost <50 then RATING = 5;
IF TotalopCost >=50 and TotalopCost <100 then RATING = 4;
IF TotalopCost >=100 and TotalopCost <150 then RATING = 3;
IF TotalopCost >=150 and TotalopCost <200 then RATING = 2;
IF TotalopCost >=200 then RATING = 1;
run;

proc chart data=airlines;
vbar RATING/discrete ;
run;

proc chart data=airlines(where=(RATING=5));
hbar RATING /discrete sumvar=TotalopCost type=mean ;
run;

proc sql;
create table airline_P as
select *
from airlines
where Airline like 'P%';
quit;

proc sql ;
select max(speed) into :FASTPLANE from airlines;
quit;
%put ----->&FASTPLANE;

