-- # Questions: Working With DATEs
-- 1. Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
SELECT DATE_PART ('year', occurred_at) year_occurred, SUM(total_amt_usd) total_spent
FROM orders
GROUP BY year_occurred
ORDER BY total_spent DESC;
-- Inference FROM Question 1: 2016 is the largest sales year and we expect 2017 to have the largest sales year.

-- 2. Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
SELECT DATE_PART ('month', occurred_at) month_occurred, SUM(total_amt_usd) total_spent
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month_occurred
ORDER BY total_spent DESC;
-- In order for this to be 'fair', we should remove the sales from 2013 and 2017. In these two years, only one month of sales for each of these years (12 for 2013 and 1 for 2017). Therefore, neither of these are evenly represented.  
-- Highest sale in the month of December (12)

-- 3. Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?
SELECT DATE_PART ('year', occurred_at) year_occurred, COUNT(*) total_sales
FROM orders
GROUP BY year_occurred
ORDER BY total_sales DESC;

-- 4. Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
SELECT DATE_PART ('month', occurred_at) month_occurred, COUNT(*) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month_occurred
ORDER BY total_sales DESC;
-- In order for this to be 'fair', we should remove the sales from 2013 and 2017. In these two years, only one month of sales for each of these years (12 for 2013 and 1 for 2017). Therefore, neither of these are evenly represented.  
-- Highest orders in the month of December (12)

-- 5. In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
SELECT DATE_TRUNC ('month', occurred_at) month_occurred, SUM(o.gloss_amt_usd) total_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
-- In May (5) of 2016, Walmart spent most on gloss paper in terms of dollars 