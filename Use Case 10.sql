

-- 10. Show the average funding amount per round type for each industry

SELECT c.industry, f.round_type, AVG(f.funding_amount) AS avg_funding_amount
FROM Companies c JOIN FundingRounds f 
ON c.company_id = f.company_id
GROUP BY c.industry, f.round_type;
