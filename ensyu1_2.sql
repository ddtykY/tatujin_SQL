SELECT
	CASE 
		WHEN sex = 1 THEN '男'
		WHEN sex = 2 THEN '女'
		ELSE ''
	END AS 性別,
	SUM(population) AS 全国,
	MAX(CASE WHEN pref_name = '徳島' THEN population ELSE 0 END) AS 徳島,
	MAX(CASE WHEN pref_name = '香川' THEN population ELSE 0 END) AS 香川,
	MAX(CASE WHEN pref_name = '愛媛' THEN population ELSE 0 END) AS 愛媛,
	MAX(CASE WHEN pref_name = '高知' THEN population ELSE 0 END) AS 高知,
	SUM(CASE WHEN pref_name = '徳島' THEN population
			 WHEN pref_name = '香川' THEN population
			 WHEN pref_name = '愛媛' THEN population
			 WHEN pref_name = '高知' THEN population
			 ELSE 0 
		END
	) AS 四国
FROM
	PopTbl2
GROUP BY
	sex
;
