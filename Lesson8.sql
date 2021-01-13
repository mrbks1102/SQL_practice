-- 問題8-1
--1
SELECT　A.A1, C.A2, B1, B2 
FROM A
JOIN B
ON A.A1 = B.B1
JOIN A AS C
ON B.B1 = C.A1

-- 問題8-2
-- 1
SELECT　社員番号, 社員.名前, 部署.名前　AS 部署名
FROM 社員
JOIN 部署
ON 社員.部署ID = 部署.部署ID

-- 2
-- 同テーブルを結合
SELECT A.社員番号, A.名前, B.名前 AS 上司名
FROM 社員 AS A
LEFT JOIN 社員 AS B  -- 上司がいない場合もあるため、外部結合
ON A.上司ID = B.社員番号

-- 3
SELECT 社員番号, A.名前 AS 名前, B.名前 AS 部署名, S.名前 AS 勤務地
FROM 社員 AS A
JOIN 部署 AS B
ON A.部署ID = B.部署ID
JOIN 視点 AS S
ON A.勤務地ID = S.支店ID

-- 4
SELECT 支店ID AS 支店コード, 支店.名前　AS 支店名, S.名前 AS 支店長名, T.社員数 AS 社員数
FROM 支店
JOIN 社員 AS S
ON 支店.支店長ID = S.社員番号
-- ここからが社員数をカウントするSQL文
JOIN (SELECT COUNT(*) AS 社員数, 勤務地ID
      FROM 社員 GROUP BY 勤務地ID) AS T
ON K.支店ID = T.勤務地ID

-- 5
SELECT S1.社員番号 AS 社員番号, 
       S1.名前 AS 名前,
       K1.名前 AS 本人勤務地,
       K2.名前 AS 上司勤務地

FROM 社員 AS S1

JOIN 社員 AS S2
ON S1.上司ID = S2.社員番号

AND S1.勤務地ID <> S2.勤務地ID

JOIN 支店 AS K1
ON S1.勤務地ID = K1.支店ID

JOIN 支店 AS K2
ON S2.勤務地ID = K2.支店ID
-- 違う種類の人物なのでそれぞれJOINする

