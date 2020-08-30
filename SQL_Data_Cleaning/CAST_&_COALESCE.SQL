--- CAST AND COALESCE

-- For this set of quiz questions, you are going to be working with a single table in the environment below. 
-- This is a different dataset than Parch & Posey, as all of the data in that particular dataset were already clean.

-- 1. Write a query to look at the top 10 rows to understand the columns and the raw data in the dataset called sf_crime_data
SELECT *
FROM sf_crime_data
LIMIT 10;

-- 2. What are the format dates used in SQL
yyyy-mm-dd

-- 3. The format of the date column is mm/dd/yyyy with times that are not correct also at the end of the date.

-- 4. Write a query to change the date into the correct SQL date format. Hint: use atleast SUBSTR AND CONCAT
SELECT date orig_date, (SUBSTR(date, 7, 4) || '_' || LEFT(date, 2) || '_' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data

-- 5. Once you have created a column in the correct format, use either CAST or :: to convert this to a date
SELECT date orig_date, (SUBSTR(date, 7, 4) || '_' || LEFT(date, 2) || '_' || SUBSTR(date, 4, 2))::DATE new_date
FROM sf_crime_data

----------------------------------------------------------------------
--- COALESCE -> returns the first non-NULL value passed for each row
--1. Run the query in SQL to notice the row with missing data
SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

-- 2. Use COALESCE to fill in the accounts.id column with the account.id for NULL value for table in  1
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

-- 3. Use COALESCE to fill in the orders.account_id column with account.id for NULL value for table in 1
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, 
COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, 
o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;


-- 4. Use COALESCE to fill in each of the qty and usd columns with 0 for the taable in 1
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id,
 COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, 
 COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, 
 COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

-- 5. Run query in 1 with the WHERE removed and COUNT the number of ids.
SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id

-- 6. Run the above query 5, but with COALESCE function used in questions 2 through 4
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, 
COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, 
COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, 
COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;