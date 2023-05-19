SELECT
	SI.shop,
	COUNT(SI.item) AS my_item_cnt,
	(SELECT COUNT(item) FROM Items) - COUNT(SI.item) AS diff_cnt
FROM
	ShopItems AS SI
INNER JOIN
	Items AS I
ON
	SI.item = I.item
GROUP BY
	SI.shop
;


