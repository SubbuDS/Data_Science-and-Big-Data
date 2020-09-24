SELECT Major, ShareWomen
  FROM recent_grads
 WHERE ShareWomen > 0.5225502029537575;
 
 
 SELECT Major, Unemployment_rate
  FROM recent_grads
 WHERE Unemployment_rate < (SELECT AVG(Unemployment_rate)
                              FROM recent_grads
                           );
                           
                           
                           
SELECT CAST(COUNT(*) as FLOAT)/(SELECT COUNT(*)
                                  FROM recent_grads
                               ) AS proportion_abv_avg
  FROM recent_grads
 WHERE ShareWomen > (SELECT AVG(ShareWomen)
                       FROM recent_grads
                    );
                    
                    
                    
SELECT Major_category, Major
  FROM recent_grads
 WHERE Major_category IN ('Business', 'Humanities & Liberal Arts', 'Education');
 
 
 
SELECT Major_category, Major
  FROM recent_grads
 WHERE Major_category IN (SELECT Major_category
                            FROM recent_grads
                           GROUP BY Major_category
                           ORDER BY SUM(TOTAL) DESC
                           LIMIT 3
                         );
                         
                         
                         
SELECT AVG(CAST(Sample_size AS FLOAT)/Total) AS avg_ratio
  FROM recent_grads;
  
  
  
SELECT Major, Major_category, 
       CAST(Sample_size AS FLOAT)/Total AS ratio 
  FROM recent_grads 
 WHERE ratio > (SELECT AVG(CAST(Sample_size AS FLOAT)/Total) AS avg_ratio 
                  FROM recent_grads
               );
               
               
               
