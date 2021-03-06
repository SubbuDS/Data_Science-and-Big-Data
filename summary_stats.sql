SELECT MIN(Unemployment_rate)
  FROM recent_grads;
  
  SELECT SUM(Total)
  FROM recent_grads;
  
  
  SELECT COUNT(Major)
  FROM recent_grads
 WHERE ShareWomen < 0.5;
 
 SELECT COUNT(*), COUNT(Unemployment_rate)
  FROM recent_grads;
  
  SELECT AVG(Total), MIN(Men), MAX(Women)
  FROM recent_grads;
  
  
  
  SELECT COUNT(*) 'Number of Majors',
       MAX(Unemployment_rate) 'Highest Unemployment Rate'
  FROM recent_grads;
  
  
  
  SELECT COUNT(DISTINCT Major ) unique_majors,
       COUNT(DISTINCT Major_category) unique_major_categories,
       COUNT(DISTINCT Major_code) unique_major_codes
  FROM recent_grads;
  
  
  SELECT 'Major: ' || LOWER(Major) AS Major,
       Total, Men, Women, Unemployment_rate,
       LENGTH(Major) AS Length_of_name
  FROM recent_grads
 ORDER BY Unemployment_rate DESC;
 
 
 SELECT Major, Major_category, (P75th - P25th) quartile_spread FROM recent_grads ORDER BY quartile_spread LIMIT 20
 
 
 