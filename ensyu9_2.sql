SELECT
	es.emp
FROM
	EmpSkills AS es
LEFT JOIN
	Skills AS s
ON
	es.skill = s.skill
GROUP BY
	es.emp
HAVING
	COUNT(es.skill) = (SELECT COUNT(*) FROM Skills)
AND
	COUNT(s.skill) = (SELECT COUNT(*) FROM Skills)
;
