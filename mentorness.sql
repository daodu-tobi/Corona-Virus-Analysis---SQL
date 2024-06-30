create table coronavirus(
	Province  varchar,
	Country  varchar,
	Latitude decimal,
	Longitude decimal,
	C_Date varchar,
	Confirmed numeric, 
	Deaths numeric,
	Recovered numeric


);ALTER TABLE coronavirus  ADD new_date_column DATE;

UPDATE coronavirus  SET new_date_column = STR_TO_DATE( c_date, '%Y-%m-%d');

UPDATE  coronavirus SET new_date_column = TO_DATE( c_date, 'DD-MM-YYYY');
select * from coronavirus;

ALTER TABLE coronavirus DROP COLUMN c_date;

ALTER TABLE coronavirus RENAME COLUMN new_date_column TO c_date;


select * from coronavirus;
-- Question 1(Checking for null values)

SELECT
    SUM(CASE WHEN province IS NULL THEN 1 ELSE 0 END) AS province_nulls,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS country_nulls,
    SUM(CASE WHEN latitude IS NULL THEN 1 ELSE 0 END) AS latitude_nulls,
	SUM(CASE WHEN longitude IS NULL THEN 1 ELSE 0 END) AS longitude_nulls,
	SUM(CASE WHEN c_date IS NULL THEN 1 ELSE 0 END) AS c_date_nulls,
	SUM(CASE WHEN confirmed IS NULL THEN 1 ELSE 0 END) AS confirmed_nulls,
	SUM(CASE WHEN deaths IS NULL THEN 1 ELSE 0 END) AS deaths_nulls,
	SUM(CASE WHEN recovered IS NULL THEN 1 ELSE 0 END) AS recovered_nulls
FROM coronavirus ;


-- Question 2 (There are no null values)

-- Question 3  (Check the total number of rows)
select 
	count(*) as total_rows
from coronavirus;

-- Question 4(Check what is start_date and end_date)
select 
      MIN(c_date) as start_date,
	  MAX(c_date) as end_date
from coronavirus;

-- SELECT DISTINCT province
-- FROM coronavirus
-- group by province;


-- Question 5(Number of month present in dataset)

SELECT COUNT(DISTINCT TO_CHAR(c_date, 'YYYY-MM')) AS number_of_month
FROM coronavirus;

-- 	Question 6( Find monthly average for confirmed, deaths, recovered)
select 
	TO_CHAR(c_date, 'YYYY') as YEARS  ,
	TO_CHAR(c_date, 'MM') MONTHS, 
	round(avg(confirmed), 2) as montly_avg_confirmed,
	round (avg(deaths), 2)as montly_avg_deaths,
	round(avg(recovered), 2)as montly_avg_recovered

from coronavirus
group by TO_CHAR(c_date, 'YYYY') ,
	     TO_CHAR(c_date, 'MM') 
		
order by TO_CHAR(c_date, 'YYYY') ,
	     TO_CHAR(c_date, 'MM') ;
		
-- Question 7 (Find most frequent value for confirmed, deaths, recovered each month)


-- frequent value for recovered
select 
	TO_CHAR(c_date, 'YYYY') as YEARS,
	TO_CHAR(c_date, 'MM') MONTHS, 
	recovered,
	count (*) as frequency
	
from 
	coronavirus
	
group by 
	TO_CHAR(c_date, 'YYYY') ,
	TO_CHAR(c_date, 'MM'), 
	recovered
	
order by 
	frequency desc

limit 1;

-- frequent value for deaths
select 
	TO_CHAR(c_date, 'YYYY') as YEARS  ,
	TO_CHAR(c_date, 'MM') MONTHS, 
	deaths,
	count (*) as frequency
	
from 
	coronavirus
	
group by 
	TO_CHAR(c_date, 'YYYY'),
	TO_CHAR(c_date, 'MM'), 
	deaths
	
order by 
	frequency desc
	
limit 1;
	
--- frequent value for confirmed

select 
	TO_CHAR(c_date, 'YYYY') as YEARS  ,
	TO_CHAR(c_date, 'MM') MONTHS, 
	confirmed,
	count (*) as frequency
	
from 
	coronavirus
	
group by 
	TO_CHAR(c_date, 'YYYY'),
	TO_CHAR(c_date, 'MM'), 
	confirmed
	
order by 
	frequency desc
	
limit 1;

-- Question 8 (Find minimum values for confirmed, deaths, recovered per year)

select 
     
	TO_CHAR(c_date, 'YYYY') as corona_year,
	 min(confirmed) as yearly_confirmed_min,
 	 min(recovered) as yearly_recovered_min,
	 min(deaths) as yearly_deaths_min
from coronavirus

group by TO_CHAR(c_date, 'YYYY')

order by TO_CHAR(c_date, 'YYYY');

-- question 9 (Find maximum values of confirmed, deaths, recovered per year)
select 
     TO_CHAR(c_date, 'YYYY') as corona_year,
	 max(confirmed) as yearly_confirmed_min,
 	 max(recovered) as yearly_recovered_min,
	 max(deaths) as yearly_deaths_min
	 
from coronavirus

group by TO_CHAR(c_date, 'YYYY') 

order by  TO_CHAR(c_date, 'YYYY') ;

-- Question 10 (The total number of case of confirmed, deaths, recovered each month)
select 
	TO_CHAR(c_date, 'YYYY') as years,
	TO_CHAR(c_date, 'MM') as months,
	sum (confirmed) as total_confirmed_per_month,
	sum (deaths) as total_deaths_per_month,
	sum (recovered) as total_recovered_per_month
	
from coronavirus

group by TO_CHAR(c_date, 'YYYY') ,
	     TO_CHAR(c_date, 'MM') 
		
order by TO_CHAR(c_date, 'YYYY') ,
	     TO_CHAR(c_date, 'MM') ;
		


--- Q11. Check how corona virus spread out with respect to confirmed case
--  (Eg.: total confirmed cases, their average, variance & STDEV )
    
select 
    
     sum(confirmed) as Total_confirmed,
	 round(avg (confirmed), 2) as avg_confirmed,
	 VAR_POP(confirmed) AS variance_confirmed,
	stddev_pop(confirmed) as stvd_confirmed
	
from coronavirus;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg: total confirmed cases, their average, variance & STDEV )

	
select 
	TO_CHAR(c_date, 'YYYY') as years,
	TO_CHAR(c_date, 'MM') as months,
	sum (deaths) as total_deaths_per_month,
    round(avg (deaths), 2) as avg_deaths_per_month,
	round(VAR_POP(deaths), 2) AS variance,
	round(stddev_pop(deaths), 2) as standard_deviation
		
	
from coronavirus

group by TO_CHAR(c_date, 'YYYY') ,
	     TO_CHAR(c_date, 'MM')

order by TO_CHAR(c_date, 'YYYY'),
	     TO_CHAR(c_date, 'MM');


-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
	 
select 
	sum (recovered) as total_recovered_case,
	round(avg(recovered), 2) as avg_recovered_case,
	round(VAR_POP(recovered), 2) AS variance,
	round(stddev_pop(recovered), 2) as standard_deviation
	
from coronavirus;

	
-- Q14. Find Country having highest number of the Confirmed case

select 					
	country,
	sum(confirmed)
	
from coronavirus

group by 
	country
	
	
order by sum(confirmed) desc

limit 1;

-- Q15  Find Country having lowest number of the death case
 
select 					
	country,
	sum(deaths)
	
from coronavirus

group by 
	country	
	
order by sum(deaths) asc

limit 1; 
 

	
 -- Q16 Find top 5 countries having highest recovered case
 
select 					
	country,
	sum(recovered)
	
from coronavirus

group by 
	country	
	
order by sum(recovered) desc

limit 5;




