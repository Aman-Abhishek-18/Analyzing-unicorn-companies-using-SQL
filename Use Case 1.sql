

-- Task 1: Retrieve the latest valuation for each unicorn company

WITH LatestValuations AS (
    SELECT company_id, valuation_amount, valuation_date,
    ROW_NUMBER() OVER (PARTITION BY company_id ORDER BY valuation_date DESC) as row_num
    FROM Valuations
)
SELECT c.company_name, lv.valuation_amount, lv.valuation_date FROM Companies c
JOIN LatestValuations lv ON c.company_id = lv.company_id
WHERE lv.row_num = 1 AND lv.valuation_amount >= 1000000000;

