

-- 9. Retrieve the companies with the most frequent funding rounds and the total number of rounds


SELECT c.company_name, COUNT(f.round_id) AS total_rounds 
FROM Companies c JOIN FundingRounds f 
ON c.company_id = f.company_id
GROUP BY c.company_name
ORDER BY total_rounds DESC;
