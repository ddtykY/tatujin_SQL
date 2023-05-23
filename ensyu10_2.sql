/* 行に折り返しがないケース */
SELECT
	S1.seat AS start_seat,
	'～',
	S2.seat AS end_seat
FROM
	Seats AS S1
CROSS JOIN
	Seats AS S2
INNER JOIN
	Seats AS S3
ON
	S3.seat BETWEEN S1.seat AND S2.seat
WHERE
	S2.seat = S1.seat + (:head_cnt - 1) /* :head_cntは集団の人数 */
GROUP BY
	start_seat,
	end_seat
HAVING
	COUNT(*) = 
		SUM(
			CASE
				WHEN S1.status = '空' AND S2.status = '空' AND S3.status = '空' THEN 1
				ELSE 0
			END
		)
;


/* 行に折り返しがあるケース */
SELECT
	S1.seat AS start_seat,
	'～',
	S2.seat AS end_seat
FROM
	Seats2 AS S1
CROSS JOIN
	Seats2 AS S2
INNER JOIN
	Seats2 AS S3
ON
	S3.seat BETWEEN S1.seat AND S2.seat
WHERE
	S2.seat = S1.seat + (:head_cnt - 1) /* :head_cntは集団の人数 */
GROUP BY
	start_seat,
	end_seat
HAVING
	SUM(
			CASE
				WHEN (S1.status = '空' AND S2.status = '空' AND S3.status = '空')
					AND (S1.line_id = S2.line_id AND S2.line_id = S3.line_id)
				THEN 1
				ELSE 0
			END
	) = COUNT(*)
;

