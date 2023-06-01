/* EXISTSを使った解法 */
SELECT DISTINCT
	at2a.p_key
FROM
	ArrayTbl2 AS at2a
WHERE
	EXISTS
		(
			SELECT
				*
			FROM
				ArrayTbl2 AS at2b
			WHERE
					at2a.p_key = at2b.p_key
				AND
					at2b.val = 1
				AND
					at2b.val IS NOT NULL
		)
;



/* 別解 */
SELECT 
	at2a.p_key
FROM
	ArrayTbl2 AS at2a
EXCEPT
		(
			SELECT
				at2b.p_key
			FROM
				ArrayTbl2 AS at2b
			WHERE
					at2b.val <> 1
				OR
					at2b.val IS NULL
		)
;

