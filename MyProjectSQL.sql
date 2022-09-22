SELECT * FROM covidrecords.coviddeaths
order by 3,4;

SELECT *
FROM covidvaccination
where continent is not null
order by 3,4; 

SELECT Location, date, total_cases, total_deaths, new_cases, population
 FROM covidrecords.coviddeaths
 where continent is not null
order by 1,2;

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM covidrecords.coviddeaths
where continent is not null
order by 1,2;

SELECT Location, date, population, total_cases, (total_cases/population)*100 as DeathPercentage
FROM covidrecords.coviddeaths
where continent is not null
order by 1,2;

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date)
FROM covidrecords.coviddeaths dea
join covidrecords.covidvaccination vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3,4