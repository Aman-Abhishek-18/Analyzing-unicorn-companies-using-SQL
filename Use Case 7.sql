

-- 7. Find companies that have never received funding but have valuations over 1 billion USD

SELECT c.company_name, v.valuation_amount
FROM Companies c JOIN Valuations v 
ON c.company_id = v.company_id
WHERE v.valuation_amount >= 1000000000
AND c.company_id NOT IN (
    SELECT company_id FROM FundingRounds
);
