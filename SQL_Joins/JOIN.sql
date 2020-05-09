-- Quiz Questions
-- 1. Try pulling all the data from the accounts table, and all the data from the orders table.

SELECT orders.*, accounts.* 
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

-- 2. Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, 
       orders.gloss_qty, 
       orders.poster_qty,
       accounts.website,
       accounts.primary_poc
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

-- 3. Provide a table for all web_events associated with account name of Walmart. There should be three columns.
--- Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a
--  fourth column to assure only Walmart events were chosen.
SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

-- 4.Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include
-- three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name regions, s.name rep_names, a.name accounts
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;
