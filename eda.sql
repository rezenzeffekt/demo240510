
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

-- year's total balance calculated by subtracting the withdrawals from the deposits
WITH 
de AS (SELECT SUM(value) AS d 
FROM output_01 
WHERE value > 0
),
wi AS (SELECT SUM(value) AS w 
FROM output_01 
WHERE value < 0
)
SELECT wi.w+de.d 
FROM de, wi

-- show all 'Gehalt'
SELECT *
FROM output_01
WHERE description = 'Gehalt'












