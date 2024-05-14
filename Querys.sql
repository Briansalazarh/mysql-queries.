#query1
SELECT world.languages.language, world.countries.name, world.languages.percentage
FROM world.languages
JOIN world.countries ON world.languages.country_id = world.countries.id
WHERE world.languages.language = "Slovene"
ORDER BY world.languages.percentage DESC;

#query2
SELECT countries.name AS nombre_countries, COUNT(cities.id) AS total_cities
FROM world.countries
JOIN world.cities ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY total_cities DESC;

#3
SELECT name, population
FROM world.cities
WHERE country_code = 'MEX' AND population > 500000
ORDER BY population DESC;

#4
SELECT countries.name AS nombre_countries, languages.language AS nombre_language, languages.percentage as porcentaje
FROM world.countries
JOIN world.languages ON countries.code = languages.country_code
WHERE (languages.percentage > 89)
ORDER BY percentage DESC;

#5
SELECT name, surface_area, population
FROM world.countries
WHERE surface_area < 501 AND population > 100000;

#6
SELECT name, government_form, capital, life_expectancy
FROM world.countries
WHERE government_form = 'Constitutional Monarchy' AND capital > 200 AND life_expectancy > 75;

#7
SELECT countries.name AS nombre_countrie,cities.name AS nombre_city, cities.district, cities.population 
FROM world.countries
JOIN world.cities ON countries.id = cities.country_id
WHERE countries.name = 'Argentina' AND cities.district = 'Buenos Aires' AND cities.population > 500000;



#8
SELECT region, COUNT(name) AS numero_countries
FROM world.countries
GROUP BY region
ORDER BY numero_countries DESC;


