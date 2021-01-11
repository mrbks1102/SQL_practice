-- 問題6-1
-- 1
SELECT SUM(降水量), AVG(最高気温), AVG(最低気温)
FROM 年別気象観測

-- 2
SELECT SUM(降水量), AVG(最高気温). AVG(最低気温)
FROM 都市別気象観測
WHERE 都市名 = '東京'

-- 3
SELECT 都市名, AVG(降水量), MIN(最高気温), MAX(最低気温)
FROM 都市別気象観測
GROUP BY 都市名

-- 4
SELECT 月, AVG(降水量), AVG(最高気温), AVG(最低気温)
FROM 都市別気象観測
GROUP BY　月

--5
SELECT 都市名, MAX(最高気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING  MAX(最高気温)　>= 38

--6
SELECT 都市名, MIN(最低気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MIN(最低気温) <= -10


-- 問題6-2
-- 1
SELECT COUNT(*) AS 社員数
FROM 入退室管理
WHERE 退出 IS NULL

-- 2
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
ORDER BY 2 DESC

-- 3
SELECT CASE 事由区分 WHEN '1' THEN 'メンテナンス'
                    WHEN '2' THEN 'リリース作業'
                    WHEN '3' THEN '障害対応'
                    WHEN '9' THEN 'その他' END AS 事由,
                    COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 事由区分

-- 4
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
HAVING COUNT(*) > 10

-- 5
SELECT 日付, COUNT(社員名) AS 障害対応社員数
FROM 入退室管理
WHERE 事由区分 = '3'
GROUP BY 日付
