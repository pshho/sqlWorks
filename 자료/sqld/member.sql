-- member 테이블 생성
CREATE TABLE member(
  mid CHAR(3) PRIMARY KEY,
  name VARCHAR2(20) NOT NULL,
  age  NUMBER(3),
  phone VARCHAR2(15)
);

-- 자료 추가(INSERT 테이블이름 INTO VALUES(값))
INSERT INTO member VALUES ('100', '홍길동', 31, '010-1234-5678');
INSERT INTO member VALUES ('101', '이젠', 17, '010-1234-6789');
INSERT INTO member(mid, name, age) VALUES ('102', '이순신', 25);
--INSERT INTO member(mid, age) VALUES ('102', 25); name이 not null이므로 오류
--INSERT INTO member(mid, name, age) VALUES ('102', '유관순', 20); mid가 기본키이므로 중복 불가
INSERT INTO member(mid, name, age) VALUES ('103', '이순신', 40);
INSERT INTO member(mid, name, age) VALUES ('104', '가나다라마바', 40);

-- 자료 검색(SELECT 속성이름(*) FROM 테이블이름)
SELECT * FROM member;
SELECT name, phone FROM member;

-- 특정한 자료 검색(WHERE 조건절)
SELECT * FROM member WHERE name = '홍길동';
-- 나이가 40세인 이순신을 출력하세요
SELECT * FROM member WHERE mid = '103';

-- 자료 수정(UPDATE 테이블 SET 속성변경)
UPDATE member SET name='홍길순' WHERE name='홍길동';


-- 자료 삭제(DELETE FROM 테이블이름 WHERE절)
DELETE FROM member WHERE name='홍길순';

ROLLBACK;

COMMIT;

-- 테이블 삭제
DROP TABLE member;

-- 테이블의 구조 변경 : 속성값 변경(Modify), 칼럼추가(ADD)
ALTER TABLE member MODIFY name VARCHAR2(30);

-- 테이블 구조 출력
DESC member;

