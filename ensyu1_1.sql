/* xとyの最大値 */
SELECT
	p_key,
	CASE 
		WHEN x > y THEN x
		ELSE y
	END AS greatest
FROM
	Greatests
;


/* xとyとzの最大値 */
SELECT
	p_key,
	CASE
		WHEN x >= y AND x >= z THEN x
		WHEN y >= z THEN y
		ELSE z
	END AS greatest
FROM
	Greatests
;
