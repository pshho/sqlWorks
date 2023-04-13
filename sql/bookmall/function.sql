-- 숫자 타입 함수
-- 제공된 테이블: dual'
-- 절대값: ABS(수)
SELECT ABS(-10)
FROM dual;

-- 반올림: ROUND(수, 자리수)
SELECT ROUND(3.875, 2)
FROM dual;

-- sal을 30일로 나눈 후 소수 자리수에 따라 반올림
SELECT sal 급여,
       sal/30 일급,
       ROUND(sal/30, 1) 결과1,
       ROUND(sal/30, 0) 결과2,
       ROUND(sal/30, -1) 결과3
FROM employee;

-- sal을 30일로 나눈 후 소수 자리수에 따라 절삭(버림)
SELECT sal 급여,
       sal/30 일급,
       TRUNC(sal/30, 1) 결과1,
       TRUNC(sal/30, 0) 결과2,
       TRUNC(sal/30, -1) 결과3
FROM employee;

-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
SELECT custid 고객번호,
       ROUND(AVG(saleprice), -2) 평균주문금액,
       COUNT(*) 주문수,
       SUM(saleprice) 총액    
FROM orders
GROUP BY custid;

SELECT custid 고객번호,
       ROUND(SUM(saleprice)/COUNT(*), -2) 평균금액
FROM orders
GROUP BY custid;

-- 문자 타입 함수
SELECT LOWER('ABCD') RESULT
FROM dual;

-- SUBSTR(문자, 인덱스, 글자수)
SELECT SUBSTR('ABC', 1, 2) RESULT
FROM dual;

-- REPLACE(문자, 이전 문자, 새로운 문자)
SELECT REPLACE('ABC', 'A', 'E') RESULT
FROM dual;

-- CONCAT(문자1, 문자2) - 문자 연결
SELECT CONCAT('A', 'B') RESULT
FROM dual;
-- 연결연산자 - '||'와 CONCAT 동일
SELECT '안녕' || '하세요' RESULT
FROM dual;

-- LPAD(문자, 문자수, 추가할 문자(기호)) - 추가할 문자를 왼쪽부터 채움
-- RPAD - 오른쪽부터 채움
SELECT LPAD('cloud', 10, '*') RESULT
FROM dual;
SELECT RPAD('cloud', 10, '*') RESULT
FROM dual;

-- 부서이름에서 처음부터 시작해서 2개의 문자 출력
SELECT SUBSTR(deptname, 1, 2) 부서명
FROM dept;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경하여 검색
SELECT bookid,
       REPLACE(bookname, '야구', '농구') 책제목
FROM book
WHERE bookname LIKE '%야구%';

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 검색
-- 한글은 - 3byte/영어, 특수기호, 숫자 - 1byte
SELECT bookname 도서제목,
       LENGTH(bookname) 글자수,
       LENGTHB(bookname) 바이트수
FROM book
WHERE publisher = '굿스포츠';

-- 날짜함수
-- 현재 날짜의 20일전
SELECT SYSDATE - 20 FROM dual;

-- 현재 날짜와 시간
SELECT SYSTIMESTAMP FROM dual;

-- 3개월 후 날짜
SELECT ADD_MONTHS(SYSDATE, 3) 결과
FROM dual;
-- 3개월 전 날짜
SELECT ADD_MONTHS(SYSDATE, -3) 결과
FROM dual;
-- 3개월 전 특정 날짜
SELECT ADD_MONTHS('2023:4:1', -3) 결과
FROM dual;

-- 주문번호가 6에서 10사이인 도서의 주문일에 3개월 더한값을 구하시오
-- 1. 주문번호가 6~10인 도서 검색
SELECT  orderid 주문번호,
        ADD_MONTHS(orderdate, 3) 더하기결과,
        ADD_MONTHS(orderdate, -3) 빼기결과
FROM orders
WHERE orderid BETWEEN 6 AND 10;

SELECT  orderid 주문번호,
        ADD_MONTHS(orderdate, 3) 더하기결과,
        ADD_MONTHS(orderdate, -3) 빼기결과
FROM orders
WHERE orderid >= 6 AND orderid <= 10;

-- 주문번호가 10인 도서의 주문일로부터 오늘까지 총개월수를 구하시오
-- MONTHS_BETWEEN(이후날짜, 이전날짜)
SELECT  orderid 주문번호,
        orderdate 주문일,
        TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) 총개월수
FROM orders
WHERE orderid = 10;

-- 서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT  orderid 주문번호,
        orderdate 주문일,
        orderdate + 10 주문확정일
FROM orders;

-- 자동 타입 변환
SELECT 1 + '2' FROM dual;

-- 수동 타입 변환
-- 문자를 숫자 형식으로 변환
SELECT TO_NUMBER('120') 결과
FROM dual;

-- 날짜 형식
SELECT TO_DATE('2022-06-30', 'YY-MM-DD') 결과
FROM dual;
-- 날짜 형식 변환
SELECT  TO_CHAR(SYSDATE, 'YY-MM-DD') 날짜,
        TO_CHAR(SYSDATE, 'YYYY') 연도,
        TO_CHAR(SYSDATE, 'MM') 월,
        TO_CHAR(SYSDATE, 'DD') 일
FROM dual;

-- 시간 형식 변환
SELECT  TO_CHAR(SYSDATE, 'HH:MI:SS AM') 시간형식,
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') 날짜와시간
FROM dual;

-- 고객명에서 같은 성을 가진 사람의 인원수를 구하시오
-- 힌트, GROUP BY절, SUBSTR(), COUNT(*)
SELECT  SUBSTR(name, 1, 1) 성,
        COUNT(*) 총인원수
FROM customer
GROUP BY SUBSTR(name, 1, 1);

