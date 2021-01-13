-- 問題5-1
-- 1, 現在登録されているデータを元に(A)~(C)に当てはまる点数を計算して登録するUPDATE文をそれぞれ作成する
-- 1 (A)
UPDATE 試験結果
SET 午後1 = (80*4) - (86+68+91)
WHERE 受験者ID = 'SW1046'

-- 2 (B)
UPDATE 試験結果
SET 論述 = (68*4) - (65+53+70)
WHERE 受験者ID = 'SW1350'

-- 3 (C)
UPDATE 試験結果
SET 午前 = (56*4) - (59+56+36)
WHERE 受験者ID = 'SW1877'

-- 2, 次の条件を元に合格者の受験者IDを抽出する。ただし烈見出しは「合格者ID」とすること

-- (1)午前の点数は60以上であること
-- (2)午後１と午後２を合計した点数が１２０以上であること
-- (3)論述の点数が、全科目の合計点の３割以上であること
SELECT 受験者ID AS 合格者ID
FROM 試験結果
WHERE 午前 >= 60
AND 120 <= (午前1+午前2)
AND 0.3*(午前+午後1+午後2+論述) <= 論述


-- 問題5-2
-- 1
UPDATE 回答者
SET 国名 = CASE SUBSTRING(TRIM(メールアドレス),LENGTH(TRIM(メールアドレス))-1,2)
          WHEN 'jp' THEN '日本'
          WHEN 'uk' THEN 'イギリス'
          WHEN 'cn' THEN '中国'
          WHEN 'fr' THEN 'フランス'
          WHEN 'vn' THEN 'ベトナム' END

--2
SELECT TRIN(メールアドレス) AS メールアドレス,
CASE WHEN 年齢 >= 20 AND 年齢 < 30 THEN ('20代')
　　　WHEN 年齢 >= 30 AND 年齢 < 40 THEN ('30代')
     WHEN 年齢 >= 40 AND 年齢 < 50 THEN ('40代')
     WHEN 年齢 >= 50 AND 年齢 < 60 THEN ('60代') END
     || ':' ||
CASE 性別　WHEN　'M' THEN '男性'
　　　WHEN  'F' THEN '女性'　END AS　属性
FROM 回答者

-- 問題5-3
-- 1
UPDATE 受注
SET 文字数 = LENGTH(REPLACE(文字, ' ', '')) -- 文字をなくしている

-- 2
SELECT 受注日, 受注ID, 文字数,
       CASE COALESCE(書体コード, '1')
           WHEN '1' THEN 'ブロック体'
           WHEN '2' THEN '筆記体'
           WHEN '3' THEN '草書体' END AS 書体名,
       CASE COALESCE(書体コード, '1')
           WHEN '1' THEN 100
           WHEN '2' THEN 150
           WHEN '3' THEN 200 END AS 等価,
       CASE WHEN 文字数 > 10 THEN 500
       ELSE 0 END AS 特別加工料
FROM 受注
ORDER BY 受注日, 受注ID

-- 3
UPDATE 受注
SET 文字 = REPLACE(文字, ' ','★')
WHERE ID = '113'
