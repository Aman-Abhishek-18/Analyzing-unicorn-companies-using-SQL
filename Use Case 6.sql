
-- 6. Show the cumulative funding amount for each company over time.

SELECT c.company_name, f.round_date, 
SUM(f.funding_amount) OVER (PARTITION BY c.company_name ORDER BY f.round_date) AS cumulative_funding
FROM Companies c JOIN FundingRounds f 
ON c.company_id = f.company_id
ORDER BY c.company_name, f.round_date





