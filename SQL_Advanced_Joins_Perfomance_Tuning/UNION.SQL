--- UNION 

-- Pretreating Tables before doing a 
--- Add a WHERE clause to each of the tables that you unioned in the query above, filtering the first table where
--- name equals Walmart and filtering the second table where name equals Disney. Inspect the results then answer the subsequent quiz.

SELECT *
FROM accounts
WHERE name = 'Walmart'

UNION 

SELECT *
FROM accounts
WHERE name = 'Disney'