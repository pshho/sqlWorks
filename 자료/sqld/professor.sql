-- 교수 테이블
CREATE TABLE professor(
    pnumber NUMBER(3) PRIMARY KEY,
    pname   VARCHAR2(20) NOT NULL,
    major   VARCHAR2(30) NOT NULL
);
-- 자료 설명
DESC professor;

-- 교수 자료 삽입
INSERT INTO professor(pnumber, pname, major) VALUES (301, '오용철', '데이터베이스');
INSERT INTO professor(pnumber, pname, major) VALUES (402, '송미영', '화학 개론');
INSERT INTO professor(pnumber, pname, major) VALUES (501, '박은종', '전기공학 개론');
INSERT INTO professor(pnumber, pname, major) VALUES (302, '남우창', '데이터베이스');
INSERT INTO professor(pnumber, pname, major) VALUES (601, '김운아', '전기공학 개론');

-- 교수 자료 검색
SELECT pnumber, pname, major FROM professor;

-- '송미영' 교수의 전공을 검색하시오(칼럼명 : 전공)
SELECT pname 교수, major as 전공 FROM professor WHERE pnumber = 402;


-- 전공이 '화학 개론'인 자료를 검색하시오
SELECT * FROM professor WHERE major = '화학 개론';

-- 문자열 검색(LIKE '%')
-- 전공에 '개론'이 포함된 자료를 검색하시오
SELECT * FROM professor WHERE major LIKE '%개론%';

-- 중복을 포함하지 않는 키워드(DISTINCT)
-- 전공 과목을 모두 검색하시오
SELECT DISTINCT major FROM professor;

-- OR 연산자 사용, IN(값1, 값2) 사용
-- 전공이 '데이터베이스' 또는(혹은) '화학개론'인 자료를 검색하시오
SELECT * FROM professor
WHERE major='데이터베이스' OR major='화학개론';

SELECT * FROM professor
WHERE major IN ('데이터베이스', '화학개론');

SELECT * FROM professor
WHERE major NOT IN ('데이터베이스', '화학개론');

-- 자료 수정(UPDATE SET)
UPDATE professor SET major = '전기공학개론' WHERE pnumber = 601;

-- 자료 삭제(DELET FROM)
DELETE FROM professor
WHERE pnumber = 301;  --참조 무결성 위배

-- 커밋 완료
COMMIT;



