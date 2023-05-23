SELECT
	p_key
FROM
	Greatests
ORDER BY
	CASE
		WHEN p_key = 'B' THEN 1
		WHEN p_key = 'A' THEN 2
		WHEN p_key = 'D' THEN 3
		WHEN p_key = 'C' THEN 4
		ELSE 5
	END
;
