-- 부서, 사원 테이블 생성
CREATE TABLE department(
    deptid      NUMBER,
    deptname    VARCHAR2(20) NOT NULL,
    loc_office  VARCHAR2(20) NOT NULL,
    PRIMARY KEY(deptid)
);

CREATE TABLE employee(
    empid   NUMBER,
    empname VARCHAR2(20) NOT NULL,
    age     NUMBER,
    deptid  NUMBER NOT NULL,
    -- 외래키 제약조건 설정
    CONSTRAINT emp_fk FOREIGN KEY(deptid) 
    REFERENCES department(deptid) ON DELETE CASCADE
);

-- 부서 자료 추가
INSERT INTO department VALUES (10, '전산팀', '서울');
INSERT INTO department VALUES (20, '총무팀', '인천');

-- 사원 자료 추가
INSERT INTO employee VALUES (101, '이강', 27, 10);
INSERT INTO employee VALUES (102, '김산', 28, 20);
INSERT INTO employee VALUES (103, '정들', 31, 30); -- 참조 무결성 제약

-- 부서코드가 20번인 부서 삭제
DELETE FROM department WHERE deptid = 20;

-- 자료 검색
SELECT * FROM department;
SELECT * FROM employee;

DROP TABLE department;
DROP TABLE employee;



