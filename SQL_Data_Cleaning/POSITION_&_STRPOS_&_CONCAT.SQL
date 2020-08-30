--- Quizzes POSITION & STRPOS & CONCAT
-- Use what you have learned about LEFT & RIGHT, as well as what you know about POSITION or STRPOS or CONCATS to do the following quizzes

-- 1. Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.

SELECT primary_poc as Full_name,
LEFT (primary_poc, STRPOS(primary_poc, ' ')-1) AS first_name,
	RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name

FROM accounts;

-- 2. Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.

SELECT name as full_name,
LEFT (name, STRPOS(name, ' ') - 1) AS first_name,
RIGHT (name, LENGTH(name) - STRPOS(name, ' ')) AS last_name
FROM sales_reps;

-- 3. Each company in the accounts table wants to create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
WITH t1 AS (
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
FROM accounts)

SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;

-- 4. You may have noticed that in the previous solution some of the company names include spaces, which will certainly not work in an email address. 
--- See if you can create an email address that will work by removing all of the spaces in the account name, but otherwise your solution should be just as in question 
WITH t1 AS (
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
FROM accounts)

SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ',''), '.com')
FROM t1;

-- 5. We would also like to create an initial password, which they will change after their first log in. The first password will
--  be the first letter of the primary_poc's first name (lowercase), then the last letter of their first name (lowercase),
--  the first letter of their last name (lowercase), the last letter of their last name (lowercase), the number of letters in 
-- their first name, the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.

WITH t1 AS (
SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
FROM accounts)

SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ',''), '.com'), LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name),1) || LENGTH(first_name) || LENGTH(last_name)|| REPLACE(UPPER(name), ' ', '') as password
FROM t1;