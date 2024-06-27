


 -- 4. Create a view that shows the average valuation for each industry

CREATE VIEW AvgIndustryValuation AS
SELECT c.industry, AVG(v.valuation_amount) AS avg_valuation
FROM Companies c
JOIN Valuations v ON c.company_id = v.company_id
GROUP BY c.industry;

--SELECT * FROM AvgIndustryValuation
