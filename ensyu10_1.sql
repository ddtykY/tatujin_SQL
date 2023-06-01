/* NOT EXISTSバージョン */
SELECT
	seq
FROM
	Sequence
WHERE
		NOT EXISTS
			(
				SELECT
					seq
				FROM
					SeqTbl
				WHERE
					SeqTbl.seq = Sequence.seq
			)
	AND
		seq BETWEEN (SELECT MIN(seq) FROM SeqTbl) AND (SELECT MAX(seq) FROM SeqTbl)
;

/* 外部結合バージョン */
SELECT
	Sequence.seq
FROM
	Sequence
LEFT JOIN
	SeqTbl
ON
	SeqTbl.seq = Sequence.seq
WHERE
		SeqTbl.seq IS NULL
	AND
		Sequence.seq BETWEEN (SELECT MIN(seq) FROM SeqTbl) AND (SELECT MAX(seq) FROM SeqTbl)
;


