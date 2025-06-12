-- 1. Count Cities in USA
SELECT COUNT(name) as total_cities_in_USA
FROM city
WHERE countrycode = 'USA';

-- 2. Country with Highest Life Expectancy
select name as Country,LifeExpectancy
from country
order by lifeexpectancy desc;

-- 3. "New Year Promotion: Featuring Cities with 'New
select name as City
from city
where name like '%new%';

-- 4. Display Columns with Limit (First 10 Rows)
select*
from city
order by Population desc
limit 10;

-- 5. Cities with Population Larger than 2,000,000
select name as City, Population
from city
where Population >2000000;

-- 6. Cities Beginning with 'Be' Prefix
select name as City
from city
where name like 'be%';

-- 7. Cities with Population Between 500,000-1,000,000
select name as City, population
from city
where population between '500000' and '1000000';

-- 8. Display Cities Sorted by Name in Ascending Order
select name as Cities
from city
order by Cities asc;

-- 9. Most Populated City
select name, Population
from city
order by Population desc
limit 1;

-- 10. City Name Frequency Analysis: Supporting Geography Education
select name as City,count(distinct name) as Frequency
from city
group by name
order by frequency desc;

-- 11. City with the Lowest Population
select name as City, Population
from city
order by Population asc
limit 1;

-- 12. Country with Largest Population
select name as Country, Population
from country
order by population desc;

-- ***13. Capital of Spain
select *
from city
where ID = (SELECT capital
from country
where name = 'spain')

-- 14. Cities in Europe
SELECT city.Name AS City, country.Name AS Country, country.Continent
FROM city
INNER JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'Europe';

-- 15. Average Population by Country
SELECT name, CountryCode, AVG(Population) AS "Average Population"
FROM city
GROUP BY CountryCode, name
order by AVG(Population) desc;

-- 16. Capital Cities Population Comparison
SELECT c.Name AS "Capital City", c.Population AS Population, co.Name AS Country
FROM city c
INNER JOIN country co ON c.CountryCode = co.Code
WHERE co.Capital in (select distinct capital from country)
ORDER BY c.Population DESC;

-- 17. Countries with Low Population Density
SELECT Name AS "Country with Low Population Density", Population, SurfaceArea,
		(Population / SurfaceArea) AS PopulationDensity
FROM country
WHERE (Population / SurfaceArea) > 0
ORDER BY PopulationDensity ASC;

-- 18. Cities with High GDP per Capita
SELECT c.Name AS City, c.Population, co.GNP, (co.GNP / c.Population) AS "GDP per Capita"
FROM city c
INNER JOIN country co ON c.CountryCode = co.Code
WHERE co.GNP IS NOT NULL
AND c.Population IS NOT NULL
AND c.Population > 0
AND co.GNP / c.Population > (SELECT AVG(co.GNP / c.Population) FROM city c INNER JOIN country co ON c.CountryCode = co.Code WHERE co.GNP IS NOT NULL AND c.Population IS NOT NULL AND c.Population > 0);

-- 19. Display Columns with Limit (Rows 31-40)
select*
from city
order by population desc;
Limit 10 offset 30;
 



