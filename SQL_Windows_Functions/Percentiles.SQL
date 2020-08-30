-- Percentiles with Partitions

-- 1. each account who has a sales rep and each sales rep that has an account (all of the columns in these returned rows
--  will be full) but also each account that does not have a sales rep and each sales rep that does not have an account 
--- (some of the columns in these returned rows will be empty)
SELECT *
	FROM accounts
FULL JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id

-- 2. Use the NTILE functionality to divide the accounts into two levels in terms of the amount of gloss_qty for their orders.
--  Your resulting table should have the account_id, the occurred_at time for each order, the total amount of
-- gloss_qty paper purchased, and one of two levels in a gloss_half column.
SELECT
       account_id,
       occurred_at,
       gloss_qty,
       NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
  FROM orders 
 ORDER BY account_id DESC

-- 3. Use the NTILE functionality to divide the orders for each account into 100 levels in terms of the amount of total_amt_usd for their orders.
--  Your resulting table should have the account_id, the occurred_at time for each order, the total amount of 
-- total_amt_usd paper purchased, and one of 100 levels in a total_percentile column.
SELECT
       account_id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
  FROM orders 
 ORDER BY account_id DESC
