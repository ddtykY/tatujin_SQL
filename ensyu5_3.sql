SELECT
	num
FROM
	numbers
WHERE
	num <> 1
AND
	num
NOT IN
	(
		SELECT
			n2.num
		FROM
			numbers AS n2
		CROSS JOIN
			numbers AS n3
		ON
			n2.num > n3.num
		WHERE
			n2.num MOD n3.num = 0
		AND
			(n2.num <> 1 AND n3.num <> 1)
	)
;
