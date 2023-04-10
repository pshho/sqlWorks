-- 제약 조건
CREATE TABLE ex3(
    column1    VARCHAR2(10),
    column2    VARCHAR2(10) NOT NULL
);

-- 문자 입력시 홑따옴표
--INSERT INTO ex3 VALUES ('HELLO', '');
--INSERT INTO ex3 VALUES ('', '안녕');
INSERT INTO ex3 VALUES ('HELLO');

SELECT * FROM ex3;