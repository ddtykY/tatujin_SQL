/* ウィンドウ関数 */
SELECT 
	prc_date,
	prc_amt,
	CASE 
		WHEN COUNT(*) OVER(ORDER BY prc_date
						ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) = 3
		THEN AVG(prc_amt)
				OVER(ORDER BY prc_date
						ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
		ELSE NULL
	END average
FROM Accounts
;


/* 相関サブクエリ */
SELECT
	a1.prc_date,
	a1.prc_amt,
	(SELECT
		CASE
			WHEN (SELECT COUNT(*) FROM accounts AS a3 WHERE a3.prc_date BETWEEN a2.prc_date AND a1.prc_date) = 3
				THEN AVG(a2.prc_amt)
			ELSE NULL
		END
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


