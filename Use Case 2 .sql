
-- List all companies that received at least one funding round in 2014

--solution 1:
SELECT DISTINCT c.company_name
FROM Companies c JOIN FundingRounds f ON c.company_id = f.company_id
WHERE DATEPART(YEAR,f.round_date) = 2014;

--solution2 :
SELECT DISTINCT c.company_name
FROM Companies c JOIN FundingRounds f ON c.company_id = f.company_id
WHERE YEAR(f.round_date) = 2014;

