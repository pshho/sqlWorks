-- 기본키 제약 조건
CREATE TABLE login(
    id  VARCHAR2(10),
    passwd VARCHAR2(10) NOT NULL,
    PRIMARY KEY(id)
);

-- 자료 삽입
INSERT INTO login VALUES ('sky2023', '1234abc');
INSERT INTO login VALUES ('sky2023', '12345678'); -- 개체무결성 제약조건 위배
INSERT INTO login VALUES ('moon', '12345678', '가나다라마바사');
INSERT INTO login(id, passwd, name, create_date) 
VALUES ('moon4', 'qwer', 'abc', SYSDATE);

-- 자료 검색
SELECT * FROM login;

-- 정렬하기(ASC, DESC) : 내림차순인 경우 NULL이 가장 상위에 위치
-- 처리 순서 1.FROM절 2.WHERE절 3.SELECT절 4.ORDER BY절(가장 마지막)
SELECT * 
FROM login 
ORDER BY create_date DESC;

-- 특정 자료 검색(WHERE절)
-- id가 'moon'인 자료를 검색
SELECT * 
FROM login 
WHERE id = 'moon';

-- 자료 수정(UPDATE 테이블이름 SET 칼럼속성 WHERE절)
-- 이름이 'abc'인 자료를 'def'로 변경하시오
UPDATE login 
SET name = 'def'
WHERE id = 'moon3';

-- 자료 삭제(DELETE FROM 테이블 WHERE절)
DELETE FROM login;

COMMIT;
ROLLBACK;

-- 칼럼 추가 (속성 - name)
ALTER TABLE login ADD name VARCHAR2(20);
ALTER TABLE login ADD create_date DATE;

-- 칼럼 변경
ALTER TABLE login MODIFY name VARCHAR2(30);

-- 테이블의 구조 보기
DESC login;