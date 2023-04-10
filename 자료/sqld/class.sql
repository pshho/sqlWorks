-- 학과 테이블
CREATE TABLE class(
    --컬럼이름 자료형
    cname VARCHAR2(30),   --학과명(기본키)
    ctel  VARCHAR2(20),   --학과 전화번호
    location VARCHAR2(20),  --과사무실
    PRIMARY KEY(cname)
);

-- 학과 자료 삽입
INSERT INTO class VALUES ('소프트웨어학과', '02-1234-1234', 'B동 3층');
INSERT INTO class VALUES ('화학공학과', '02-1234-4567', 'B동 4층');
INSERT INTO class VALUES ('전기전자공학과', '02-1234-5678', 'B동 5층');
--INSERT INTO class VALUES ('화학공학과', '02-1111-2222', 'B동 6층'); --무결성 제약 조건(기본키 중복)

-- 학과 자료 검색
SELECT * FROM class;

-- '전기전자공학과'의 전화번호를 검색하시오
SELECT cname AS 학과이름, ctel AS 학과전화번호 FROM class WHERE cname = '전기전자공학과';

