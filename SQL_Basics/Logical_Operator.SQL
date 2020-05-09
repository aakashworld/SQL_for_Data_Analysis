--- Questions using the LIKE operator
-- Use the accounts table to find

--1. All the companies whose names start with 'C'.
SELECT name 
FROM accounts
WHERE name LIKE 'C%';


--2. All companies whose names contain the string 'one' somewhere in the name.
SELECT name 
FROM accounts
WHERE name LIKE '%one%';

--3. All companies whose names end with 's'. --
SELECT name 
FROM accounts
WHERE name LIKE '%s';

--------------------------------------------------------------------------------------=----------------
------------------------------------------------------------------------------------------------------
--- Questions using the IN operator

--1. Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id 
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

--2. Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

