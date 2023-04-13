--Exploring the complete table
select * 
from dbo.covid
where location = 'India'
order by date

--Filtering the columns that might be useful
select date, population, new_cases, total_cases, total_deaths, new_deaths, new_tests, positive_rate, tests_per_case, people_vaccinated, people_fully_vaccinated, stringency_index
from dbo.covid
where location = 'India'
order by date

--Getting the required data for the analysis
Select date, new_cases, new_deaths, new_tests, stringency_index, (people_fully_vaccinated/population)*100 as Percentage_fully_vaccinated
from dbo.covid
where location = 'India'
order by date

--Creating a temporary table for the required data
create table #temp ( 
Date DATE, new_cases int, new_deaths int, new_tests int, stringency_index float, Percentage_fully_Vaccinated float )

--Inserting data into our temp table
insert into #temp 
Select date, new_cases, new_deaths, new_tests, stringency_index, (people_fully_vaccinated/population)*100 as Percentage_fully_vaccinated
from dbo.covid
where location = 'India'
order by date

--viewing our temp table
select *
from #temp
order by date

-- getting the data required to make the decision
select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg
from #temp
where Date >= '2020-03-03' and Date <= '2020-09-25' -- Stage 1

select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg
from #temp
where Date >= '2020-09-06' and Date <= '2021-03-05' -- Stage 2

select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg, avg(Percentage_fully_Vaccinated) as avg_population_percent_fully_vaccinated
from #temp
where Date >= '2021-02-16' and Date <= '2021-05-15' -- Stage 3 peak

select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg, avg(Percentage_fully_Vaccinated) as avg_population_percent_fully_vaccinated
from #temp
where Date >= '2021-05-16' and Date <= '2021-09-23' -- Stage 3 drop


select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg, avg(Percentage_fully_Vaccinated) as avg_population_percent_fully_vaccinated
from #temp
where Date >= '2021-09-23' and Date <= '2022-01-04' -- Stage 4

select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg, avg(Percentage_fully_Vaccinated) as avg_population_percent_fully_vaccinated
from #temp
where Date >= '2022-01-04' and Date <= '2022-03-07' -- Stage 5

select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg, avg(Percentage_fully_Vaccinated) as avg_population_percent_fully_vaccinated
from #temp
where Date >= '2022-03-07' and Date <= '2022-06-08' -- Stage 6

select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg, avg(Percentage_fully_Vaccinated) as avg_population_percent_fully_vaccinated
from #temp
where Date >= '2022-06-08' and Date <= '2022-10-01' -- Stage 7

select avg(new_cases) as new_cases_Avg, avg(new_deaths) as new_deaths_Avg, avg(stringency_index) as si_Avg, avg(Percentage_fully_Vaccinated) as avg_population_percent_fully_vaccinated
from #temp
where Date >= '2022-10-05' and Date <= '2023-01-04' -- Stage 8