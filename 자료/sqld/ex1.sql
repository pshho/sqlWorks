-- 태이블 생성
CREATE TABLE ex1(
    column1 CHAR(10),     -- 고정길이 10Byte
    column2 VARCHAR2(10)  -- 가변길이 10Byte
);

-- 데이터 삽입
INSERT INTO ex1(column1, column2) VALUES ('abc', 'abc');
INSERT INTO ex1(column1, column2) VALUES ('사과', '사과');

-- 데이터 검색(별칭-alias 사용 - 앞에 as를 붙인다. 생략해도 가능)
SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2
FROM ex1;