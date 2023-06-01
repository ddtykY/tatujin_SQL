SELECT
	p1.name AS name_1,
	p2.name AS name_2
FROM
	products AS p1
CROSS JOIN
	products AS p2
WHERE
	p1.name >= p2.name
ORDER BY
	name_1 DESC,
	name_2 ASC
;
