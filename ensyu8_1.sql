/* 中間ビューを一つ減らした */
SELECT MASTER.age_class AS age_class,
	MASTER.sex_cd AS sex_cd,
	SUM(CASE WHEN pref_name IN ('青森', '秋田')
			THEN population ELSE NULL END) AS pop_tohoku,
	SUM(CASE WHEN pref_name IN ('東京', '千葉')
			THEN population ELSE NULL END) AS pop_kanto
FROM 
	( SELECT age_class, sex_cd
		FROM TblAge
		CROSS JOIN
		TblSex ) AS MASTER
	LEFT OUTER JOIN
		TblPop
	ON MASTER.age_class = TblPop.age_class
	AND MASTER.sex_cd = TblPop.sex_cd
GROUP BY
	Master.age_class,
	Master.sex_cd
ORDER BY
	Master.age_class,
	Master.sex_cd DESC
;

