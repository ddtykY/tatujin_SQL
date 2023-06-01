SELECT
	*
FROM
	Projects AS p1
WHERE
	1 = ALL(
		SELECT
			CASE
				WHEN p2.step_nbr <= 1 AND p2.status = '完了' THEN 1
				WHEN p2.step_nbr > 1 AND p2.status = '待機' THEN 1
				ELSE 0
			END
		FROM
			Projects AS p2
		WHERE
			p1.project_id = p2.project_id
	)
;
