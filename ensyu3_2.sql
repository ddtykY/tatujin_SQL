/* Productsテーブルに「serial_number」という整数型の列を加える */
ALTER TABLE
	Products
ADD
	serial_number SMALLINT NULL
;

/* 元のProuctsに存在した「name」「price」の値と「name」ごとに決めた行番号の値を
	Productsに挿入する */
INSERT INTO
	Products
SELECT
	p2.name,
	p2.price,
	ROW_NUMBER() OVER(PARTITION BY p2.name)
FROM
	Products AS p2
;

/* 「serial_number」が1でなく、あるいはNULLであるレコードを削除する */
DELETE FROM
	Products
WHERE
	serial_number IS NULL
OR
	serial_number <> 1
;

/* Productsテーブルから「serial_number」列を削除する */
ALTER TABLE
	Products
DROP
	serial_number
;
