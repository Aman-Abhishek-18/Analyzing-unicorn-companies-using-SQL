-- 5. Identify companies that had their valuation increased by at least 2% within any single year period

WITH ValuationGrowth AS (
    SELECT company_id, valuation_amount, valuation_date,
           LEAD(valuation_amount, 1) OVER (PARTITION BY company_id ORDER BY valuation_date) AS next_valuation,
           LEAD(valuation_date, 1) OVER (PARTITION BY company_id ORDER BY valuation_date) AS next_date
    FROM Valuations
)
SELECT c.company_name, v.valuation_amount, v.next_valuation, v.valuation_date, v.next_date
FROM Companies c JOIN ValuationGrowth v ON c.company_id = v.company_id
WHERE v.next_valuation >= 1.02 * v.valuation_amount AND DATEDIFF(YEAR, v.valuation_date, v.next_date) <= 1;
