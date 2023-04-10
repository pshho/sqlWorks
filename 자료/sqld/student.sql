-- 학생 테이블
CREATE TABLE student(
    snumber NUMBER(10) PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(3),
    gender  VARCHAR2(4),
    address VARCHAR2(50),
    cname   VARCHAR2(30),
    pnumber NUMBER(3),
    
    --외래키 제약조건(학과)
    CONSTRAINT fk_class FOREIGN KEY(cname) 
    REFERENCES class(cname),
    
    -- 외래키(교수)
    CONSTRAINT fk_professor FOREIGN KEY(pnumber)
    REFERENCES professor(pnumber)
);

-- 학생 자료 삽입
INSERT INTO student VALUES (20211234, '이강', 22, '여', '서울시 종로구', '소프트웨어학과', 301);
INSERT INTO student VALUES (20211235, '박대양', 25, '남', '서울시 성북구', '전기전자공학과', 501);
INSERT INTO student VALUES (20211236, '한비야', 33, '여', '수원시 장안구', '전기전자공학과', 501);
INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES (20211237, '김산', 33, '화학공학과', 402);
INSERT INTO student(snumber, sname, age, cname, pnumber) VALUES (20211238, '김산', 15, '소프트웨어학과', 302);


-- 학생 자료 검색
SELECT * FROM student;

-- 성별이 '여'인 학생을 검색하시오
SELECT * FROM student WHERE gender = '여';

-- 나이가 20대인 학생을 검색하시오
-- BETWEEN A AND B(A이상(>=) B이하(<=)
SELECT * FROM student 
WHERE age BETWEEN 20 AND 30;

SELECT * FROM student 
WHERE age >= 20 AND age <= 30;

-- 주소가 '수원시'인 자료를 검색하시오
SELECT * FROM student 
WHERE address LIKE '수원시%';

-- 정렬(ORDER BY 오름차순-ASC(생략가능), 내림차순 정렬-DESC)
SELECT *
FROM student
ORDER BY age ASC;

-- 이름순으로 정렬하시오
SELECT *
FROM student
ORDER BY sname;

-- NULL인 자료 - IS NULL문을 사용, IS NOT NULL문 사용
-- 주소가 없는 자료를 검색하시오
SELECT *
FROM student
WHERE address IS NULL;


select student.*, professor.pname
from student, professor
where professor.pnumber = student.pnumber;
