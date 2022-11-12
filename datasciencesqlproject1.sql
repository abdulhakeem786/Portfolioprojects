--select * 
--from [Portfolio pro]..coviddeath
--where continent is not null
--order by 3,4

----select * 
----from [Portfolio pro]..[covidvaccination]
----order by 3,4

--select location,date,total_cases,total_deaths,population,
--(total_cases/population)*100 as PercentageOfPopulation
--from [Portfolio pro]..coviddeath
--where location like '%congo%'
--order by 1,2

--select location,total_deaths,population,
--MAX(total_cases) as HeighestInfectionCount,
--MAX(total_cases/population)*100 as MAXDeathPercentage
--from [Portfolio pro]..coviddeath

--Group by location,population,total_deaths
--order by HeighestInfectionCount desc

--select location,
--MAX(cast(total_deaths as int)) as TotalDeathCount
--from [Portfolio pro]..coviddeath
--where continent is not null
--Group by location
--order by TotalDeathCount desc

--select continent,MAX(cast(total_deaths as int)) as TotalDeathCount
--from [Portfolio pro]..coviddeath
--where continent is  null
--Group by continent
--order by TotalDeathCount desc

--select sum(new_cases) as TotalCases,
--SUM(cast(new_deaths as int))as Totaldeaths

----,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
--from [Portfolio pro]..coviddeath
--where continent is not null
----Group by date 
--order by 1,2


--select * 
--from [Portfolio pro]..covidvaccination

select * 
from [Portfolio pro]..coviddeath de

join [Portfolio pro]..covidvaccination  cv
	on de.location = cv.location
	and de.date = cv.date

select de.continent, de.location,de.population 
from [Portfolio pro]..coviddeath de

join [Portfolio pro]..covidvaccination  cv
	on de.location = cv.location
	and de.date = cv.date
where de.continent is not null
order by 1,2,3




 


