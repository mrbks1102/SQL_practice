-- 問題7-1
-- 1
(A) 単一副問合せ
(B) SELECT
(C) SET
(D) n行
(E) 1列
(F) 複数行副問合せ
(G) ANY
(H) ALL
(I) WHERE
(J) 表
(K) FROM

-- 問題7-3
-- 1
INSERT INTO 頭数集計
SELECT 飼育県, COUNT(個体識別番号)
FROM 個体識別
GROUP BY 飼育県

-- 2
SELECT 飼育県 AS 都道府県, 個体識別番号,
      CASE 雌雄コード WHEN '1' THEN '雄'
                    WHEN '2' THEN '雌' END AS 雌雄
FROM 個体識別
WHERE 飼育県 IN (SELECT 飼育県 FROM 頭数集計
              ORDER BY 頭数 DESC
              OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY) -- 三行目から

-- 3
SELECT 個体識別番号, 出生日, 母牛番号
       CASE 品種 WHEN '01' WHEN '乳用種'
                WHEN '02' WHEN '肉用種'
                WHEN '03' WHEN '交雑種' END AS 品種
FROM 個体識別
WHERE 母牛番号 IS ( SELECT 個体識別番号 FROM 個体識別 WHERE 品種コード = '01' ) -- 母牛番号のデータを抽出
