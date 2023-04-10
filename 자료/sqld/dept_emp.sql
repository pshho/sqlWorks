-- 부서와 사원 테이블2
CREATE TABLE dept(
    deptno  VARCHAR2(4) PRIMARY KEY,
    deptname  VARCHAR2(20)
);

CREATE TABLE emp(
    empno   NUMBER(10),
    ename   VARCHAR2(20),
    sal     NUMBER(10, 2) default 0,
    createdate DATE DEFAULT SYSDATE,
    deptno  VARCHAR2(4) NOT NULL,
    CONSTRAINT emp_pk PRIMARY KEY(empno),  --emp 기본키
    CONSTRAINT dept_fk FOREIGN KEY(deptno)  -- 외래키
    REFERENCES dept(deptno) ON DELETE CASCADE
);

-- 칼럼 추가
ALTER TABLE emp 
  ADD (age NUMBER(3) DEFAULT 1);
  
-- 칼럼 변경
ALTER TABLE emp
  MODIFY ename VARCHAR2(40) NOT NULL;
  
-- 칼럼 삭제
ALTER TABLE emp
  DROP COLUMN age;
  
-- 칼럼명 변경
ALTER TABLE emp
  RENAME COLUMN ename TO new_ename;

-- 자료 삽입
INSERT INTO dept VALUES ('1000', '인사팀');
INSERT INTO dept VALUES ('1001', '총무팀');
INSERT INTO dept VALUES ('1002', '마케팅팀');

INSERT INTO emp VALUES (100, '임베스트', 2000000, SYSDATE, '1000');
INSERT INTO emp VALUES (101, '을지문덕', 3000000, SYSDATE, '1001');
INSERT INTO emp VALUES (102, '연개소문', 3000000, SYSDATE, '1002');
INSERT INTO emp VALUES (103, '세종대왕', 5000000, SYSDATE, '1000');
INSERT INTO emp VALUES (104, '신사임당', 3000000, SYSDATE, '1002');

-- 자료 검색
SELECT * FROM dept;
SELECT * FROM emp;

SELECT *
from emp, dept
where emp.deptno = dept.deptno
group by dept.deptno;

-- 부서별 급여 평균 구하기
-- 부서번호, 부서명, 급여평균 출력
SELECT dept.deptno, dept.deptname, avg(sal) 급여평균
from emp, dept
where emp.deptno = dept.deptno
group by dept.deptno, dept.deptname;

-- 부서 자료 삭제
DELETE FROM dept WHERE deptno = '1000';

DROP TABLE emp;
DROP TABLE emp CASCADE CONSTRAINTS;
DESC emp;