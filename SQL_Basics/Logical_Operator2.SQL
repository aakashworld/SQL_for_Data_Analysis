--- Questions using the NOT operator

-- 1. Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id 
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

-- 2. Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

-- 3. All the companies whose names do not start with 'C'.
SELECT name 
FROM accounts
WHERE name NOT LIKE 'C%';

-- 4. All companies whose names do not contain the string 'one' somewhere in the name.
SELECT name 
FROM accounts
WHERE name NOT LIKE '%one%';

-- 5. All companies whose names do not end with 's'.
SELECT name 
FROM accounts
WHERE name NOT LIKE '%s';

--------------------------------------------------------------------------------------=----------------
------------------------------------------------------------------------------------------------------
--- Questions using the AND and BETWEEN operator

-- 1. Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;


-- 2. Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name NOT LIKE '%S';

-- 3. When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? nt question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29
SELECT occurred_at, gloss_qty 
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;
-- WHERE gloss_qty >= 24 AND gloss_qty <=29
-- So the answer to the question is that yes, the BETWEEN operator in SQL is inclusive; that is, the endpoint values are included. 

-- 4. Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
SELECT *
FROM web_events
WHERE channel IN ('organic','channel') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC

-----------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
--- Questions using the OR operator

-- 1.Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000; 

-- 2.Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT *
FROM orders
WHERE (gloss_qty > 1000 OR poster_qty > 1000) AND standard_qty=0; 

-- 3.Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');