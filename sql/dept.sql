-- 부서 테이블(dept)
CREATE TABLE dept (
    -- 칼럼이름 자료형
    deptno   VARCHAR2(4) PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL,
    office   VARCHAR2(10)
);
-- 이상 현상 해결
-- 부서코드: 식별자(Identifier) - 기본키(PRIMARY KEY) 속성 추가
-- 부서명: 필수 입력 사항 (NOT NULL 속성 추가)

DESC dept;

-- 부서 추가
INSERT INTO dept (deptno, deptname, office) VALUES (
    '1000', '인사팀', '서울'
);
INSERT INTO dept(deptno, deptname, office) VALUES (
    '1001', '전산팀', '수원'
);
INSERT INTO dept(deptno, deptname, office) VALUES (
    '1002', '전산팀', '수원'
);
INSERT INTO dept(deptno, deptname) VALUES ('1003', '영업팀');

-- 실행 완료: 트랜잭션의 한 부분(작업의 끝)
COMMIT;

-- 부서 자료검색 (as 별칭 - alias)
SELECT * FROM dept;
SELECT deptno as 부서코드, deptname as 부서명 FROM dept;

-- 특정한 자료검색: WHERE 절 조건
SELECT * FROM dept WHERE deptno = '1002';

-- 자료 정렬: ORDER BY 칼럼명(ASC/DESC)
SELECT * FROM dept ORDER BY deptno ASC /* DESC */;

-- 부서번호 1002인 부서를 '회계팀'으로 변경하시오
UPDATE dept
SET deptname = '회계팀'
WHERE deptno = 1002;

/* 부서 테이블 삭제 */
DROP TABLE dept;

DELETE FROM dept
WHERE deptno = '1003';