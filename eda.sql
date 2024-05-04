
SELECT * 
FROM output_01 	 
LIMIT 10;

-- sum of deposits by type
SELECT description, SUM(value) 
FROM output_01 
WHERE value > 0
GROUP BY 1
ORDER BY 2 DESC

-- count of deposits by type
SELECT description, COUNT(description) 
FROM output_01 
WHERE value > 0
GROUP BY 1
ORDER BY 2 DESC

-- sum of withdrawals by type
SELECT description, SUM(value) 
FROM output_01 
WHERE value < 0
GROUP BY 1
ORDER BY 2

-- count of withdrawals by type
SELECT description, COUNT(description) 
FROM output_01 
WHERE value < 0
GROUP BY 1
ORDER BY 2 DESC

-- monthly sum of deposits
SELECT DATE_TRUNC('month', date AT TIME ZONE 'UTC') AS m, 
       SUM(value) 
FROM output_01 
WHERE value > 0
GROUP BY m
ORDER BY m

-- monthly sum of withdrawals
SELECT DATE_TRUNC('month', date AT TIME ZONE 'UTC') AS m, 
       SUM(value) 
FROM output_01 
WHERE value < 0
GROUP BY m
ORDER BY m

-- total deposits
SELECT SUM(value) 
FROM output_01 
WHERE value > 0

-- total withdrawals
SELECT SUM(value) 
FROM output_01 
WHERE value < 0

-- year's total balance
SELECT SUM(value) 
FROM output_01 
