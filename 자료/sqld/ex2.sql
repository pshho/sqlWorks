-- 날짜 데이터 타입
CREATE TABLE ex2(
    col_date    DATE,    -- 날짜
    col_timestamp TIMESTAMP  --날짜, 시간
);

INSERT INTO ex2 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT * FROM ex2;