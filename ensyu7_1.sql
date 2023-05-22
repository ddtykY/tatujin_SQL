SELECT
	a1.prc_date,
	a1.prc_amt,
	(SELECT 
		AVG(a2.prc_amt)
	FROM 
		Accounts AS a2
	WHERE
		a2.prc_date <= a1.prc_date
	AND
		(SELECT COUNT(*) FROM accounts AS a3 WHERE a3.prc_date BETWEEN a2.prc_date AND a1.prc_date) <= 3
	) AS average
FROM
	Accounts AS a1
;
