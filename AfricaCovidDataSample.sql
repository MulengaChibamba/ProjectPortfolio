use projectportfolio;
# Sample data for a few countries in africa
select continent,location date, total_cases, new_cases, total_deaths, population
from africacoviddeaths
order by date, total_cases ;

# Comparing Total cases vs total deaths

select 
location,date,total_cases, total_deaths, (total_deaths/total_cases)*100  'death_ratio_%'
from
africacoviddeaths
where location = 'zambia'
order by 'death_ratio_%' ;

# We compare total cases against population as a percentage, as indicator of percentage
# population infected with covid per day

select 
location,date,total_cases, population , (total_cases/population)*100  'population_death_ratio_%'
from
africacoviddeaths
where location = 'zambia';

# Rank countries by infection rate compared to popultion
select location, population, max(total_cases) as HighestInfection, max(total_cases/population)*100 PercentInfection
from africacoviddeaths
group by location, population
order by PercentInfection desc
limit 1;

# Show  highest death countries with the count per population

select location, max(total_deaths ) as max_deaths 
from africacoviddeaths
group by location
order by max_deaths desc;

# Grouping values
select  sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, sum(new_deaths)/sum(new_cases)*100 as deathpercentage
from africacoviddeaths
where continent is not null
order by continent,location;

# Grouping values by country

select continent,location, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, sum(new_deaths)/sum(new_cases)*100 as deathpercentage
from africacoviddeaths
where continent is not null
group by continent, location
order by continent,location;

# Check the Africa Vaccinations Table layout
select * from africacovidvaccinations;

# Sample data(Vaccinations) for a few countries in africa
select continent,location, date,sum( total_tests), sum(new_tests),sum( total_vaccinations), population
from africacovidvaccinations
group by continent,location, date, population
order by continent,location, date, population;

# Comparing Total cases vs total deaths

select 
location,total_tests, total_vaccinations, (total_vaccinations/total_tests)*100  'vaccination_ratio_%'
from
africacovidvaccinations
where location = 'zambia'
and  total_vaccinations <>' '
order by  'vaccination_ratio_%';

# Grouping values(Vaccinations) by country

select continent,location, sum(new_tests) as total_tests, sum(new_vaccinations) as total_vaccinations, sum(new_vaccinations)/sum(new_tests)*100 as deathpercentage
from africacovidvaccinations
where continent is not null
group by continent, location
order by continent,location;






