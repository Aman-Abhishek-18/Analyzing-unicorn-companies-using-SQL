  
  --Find the top 2 industries with the highest total funding amount in the last 5 years
  
	SELECT TOP 2 c.industry, SUM(f.funding_amount) AS total_funding FROM Companies c JOIN FundingRounds f 
	ON c.company_id = f.company_id
	WHERE f.round_date >= DATEADD(YEAR, -5, GETDATE()) 
	GROUP BY c.industry
	ORDER BY total_funding DESC;

	--GETDATE() function returns the current date and time.
	--DATEADD(YEAR, -5, GETDATE()) subtracts 5 years from the current date obtained from GETDATE(). 
	--This means it calculates a date that is exactly 5 years ago from the current date.




