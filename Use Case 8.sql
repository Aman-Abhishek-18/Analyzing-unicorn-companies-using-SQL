

-- 8. Calculate the year-over-year growth in valuation for each company

WITH YearlyValuations AS (
    SELECT company_id, YEAR(valuation_date) AS year, AVG(valuation_amount) AS avg_valuation
    FROM Valuations GROUP BY company_id, YEAR(valuation_date)
),
YearlyGrowth AS (
    SELECT company_id, year, avg_valuation,
    LAG(avg_valuation) OVER (PARTITION BY company_id ORDER BY year) AS prev_valuation
    FROM YearlyValuations
)
SELECT c.company_name, y.year, y.avg_valuation, y.prev_valuation,
((y.avg_valuation - y.prev_valuation) / y.prev_valuation) * 100 AS yoy_growth
FROM Companies c
JOIN YearlyGrowth y ON c.company_id = y.company_id
WHERE y.prev_valuation IS NOT NULL;
