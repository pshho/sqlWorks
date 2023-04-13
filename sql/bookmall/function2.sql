-- function
-- NULL값 처리하기

SELECT *
FROM customer
WHERE phone IS NULL;

-- NVL(칼럼값, 특정값): 칼럼값이 NULL이면 특정값 출력, NULL이 아니면 칼럼값 출력
SELECT  custid,
        name,
        address,
        NVL(phone, '010-1234-5678') phone
FROM customer;

CREATE TABLE k1 (
    ID VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO k1 VALUES ('가', 5);
INSERT INTO k1 VALUES ('나', NULL);
INSERT INTO k1 VALUES ('다', 5);
INSERT INTO k1 VALUES ('라', NULL);
INSERT INTO k1 VALUES ('마', 10);

SELECT * FROM k1;

-- 전체 개수, 합계, 평균, 최소값
-- NULL값을 0으로 바꿈, COUNT에 NULL은 포함X
SELECT COUNT(NVL(CNT, 0)) COUNT -- 5
FROM k1;

SELECT SUM(NVL(CNT, 0))/4 SUM   -- 5
FROM k1;

SELECT AVG(NVL(CNT, 0)) AVG     -- 4
FROM k1;

-- NULL값을 5로
SELECT MIN(NVL(CNT, 5)) MIN     -- 5
FROM k1;

-- RANK() 함수
SELECT  ename,
        sal,
        RANK() OVER(ORDER BY sal DESC) 급여_RANK,
        DENSE_RANK() OVER(ORDER BY sal DESC) 급여_DENSE_RANK
FROM employee;



