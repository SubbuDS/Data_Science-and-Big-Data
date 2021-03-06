SELECT
    il.track_id,
    t.name track_name,
    mt.name track_type,
    il.unit_price,
    il.quantity
FROM invoice_line il
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN media_type mt ON mt.media_type_id = t.media_type_id
WHERE il.invoice_id = 4;


SELECT
    il.track_id,
    t.name track_name,
    ar.name artist_name,
    mt.name track_type,
    il.unit_price,
    il.quantity
FROM invoice_line il
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN media_type mt ON mt.media_type_id = t.media_type_id
INNER JOIN album al ON al.album_id = t.album_id
INNER JOIN artist ar on ar.artist_id = al.artist_id
WHERE il.invoice_id = 4;



SELECT
2
    ta.album_title album,
3
    ta.artist_name artist,
4
    COUNT(*) tracks_purchased
5
FROM invoice_line il
6
INNER JOIN (
7
            SELECT
8
                t.track_id,
9
                al.title album_title,
10
                ar.name artist_name
11
            FROM track t
12
            INNER JOIN album al ON al.album_id = t.album_id
13
            INNER JOIN artist ar ON ar.artist_id = al.artist_id
14
           ) ta
15
           ON ta.track_id = il.track_id
16
GROUP BY 1, 2
17
ORDER BY 3 DESC LIMIT 5;




SELECT
    e1.first_name || " " || e1.last_name employee_name,
    e1.title employee_title,
    e2.first_name || " " || e2.last_name supervisor_name,
    e2.title supervisor_title
FROM employee e1
LEFT JOIN employee e2 ON e1.reports_to = e2.employee_id
ORDER BY 1;




SELECT
    first_name,
    last_name,
    phone
FROM customer
where first_name LIKE "%belle%";


SELECT
   c.first_name || " " || c.last_name customer_name,
   COUNT(i.invoice_id) number_of_purchases,
   SUM(i.total) total_spent,
   CASE
       WHEN sum(i.total) < 40 THEN 'small spender'
       WHEN sum(i.total) > 100 THEN 'big spender'
       ELSE 'regular'
       END
       AS customer_category
FROM invoice i
INNER JOIN customer c ON i.customer_id = c.customer_id
GROUP BY 1 ORDER BY 1;



