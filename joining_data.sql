SELECT * FROM facts
INNER JOIN cities ON cities.facts_id = facts.id
LIMIT 10;


