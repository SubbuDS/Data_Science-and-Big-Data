SELECT * FROM facts
INNER JOIN cities ON cities.facts_id = facts.id
LIMIT 10;


SELECT c.*, f.name country_name FROM facts f
2
INNER JOIN cities c ON c.facts_id = f.id
3
LIMIT 5;


SELECT f.name country, c.name capital_city FROM cities c
INNER JOIN facts f ON f.id = c.facts_id
WHERE c.capital = 1



SELECT f.name country, f.population
FROM facts f
LEFT JOIN cities c ON c.facts_id = f.id
WHERE c.name IS NULL;



SELECT c.name capital_city, f.name country, c.population
FROM facts f
INNER JOIN cities c ON c.facts_id = f.id
WHERE c.capital = 1
ORDER BY 3 DESC
LIMIT 10;



SELECT c.name capital_city, f.name country, c.population population
FROM facts f
INNER JOIN (
            SELECT * FROM cities
            WHERE capital = 1
            AND population > 10000000
           ) c ON c.facts_id = f.id
ORDER BY 3 DESC;



SELECT
    f.name country,
    c.urban_pop,
    f.population total_pop,
    (c.urban_pop / CAST(f.population AS FLOAT)) urban_pct
FROM facts f
INNER JOIN (
            SELECT
                facts_id,
                SUM(population) urban_pop
            FROM cities
            GROUP BY 1
           ) c ON c.facts_id = f.id
WHERE urban_pct > .5
ORDER BY 4 ASC;



