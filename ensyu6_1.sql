SELECT
	CASE
		WHEN COUNT(*) <> MAX(seq) THEN '歯抜けあり'
		ELSE '歯抜けなし'
	END AS gap
FROM
	SeqTbl
;
	

