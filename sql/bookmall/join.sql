-- 조인(JOIN)과 서브쿼리

SELECT * FROM customer;
SELECT * FROM book;
SELECT * FROM orders;

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT  cus.custid,
        cus.name,
        bok.bookname,
        bok.publisher,
        bok.price,
        ord.saleprice,
        ord.orderdate
FROM customer cus, orders ord, book bok
WHERE cus.custid = ord.custid
AND ord.bookid = bok.bookid;
-- AND cus.name = '김연아';           -- 김연아 고객의 주문내역
-- AND ord.saleprice >= 20000;       -- 판매가격이 20000원 이상인 주문내역
-- AND ord.orderdate = '2018-07-08'; -- 주문일이 2018-07-08 주문내역

-- 고객별로 주문한 모든 도서의 총판매액을 구하시오
SELECT  cus.name,
        SUM(saleprice) 총주문금액,
        RANK() OVER(ORDER BY SUM(saleprice) DESC) 순위
FROM customer cus, orders ord, book bok
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 검색하시오
SELECT  cus.name,
        bok.bookname,
        ord.saleprice,
        ord.orderdate
FROM customer cus, orders ord, book bok
WHERE cus.custid = ord.custid
  AND ord.bookid = bok.bookid
ORDER BY cus.name;    -- 정렬하면 그룹화도 됨

-- 가장 비싼 도서의 이름을 검색하시오
-- SELECT  bookname, MAX(price) FROM book;  -- 오류발생
SELECT MAX(price) FROM book;    -- 35000
SELECT bookname                 -- 골프바이블
FROM book
WHERE price = 35000;

-- 중첩(서브) 쿼리
SELECT  bookname,
        publisher,
        price
FROM book
WHERE price =
    (SELECT MAX(price) FROM book);

-- 도서를 구매한 적있는 고객의 이름을 검색하시오
-- 1. 주문테이블에서 고객아이디 검색
SELECT custid FROM orders;
-- 2. 고객아이디가 있는 고객이름 검색
SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);

SELECT name
FROM customer
WHERE custid
    IN(SELECT custid
        FROM orders);

-- 도서를 구매한 적없는 고객의 이름을 검색하시오
SELECT name
FROM customer
WHERE custid
    NOT IN(SELECT custid
            FROM orders);

-- '김연아' 고객의 주문내역
-- 1. 김연아 고객의 아이디 검색
SELECT custid
FROM customer
WHERE name = '김연아';
-- 2. 김연아 고객의 아이디로 주문테이블에서 검색
SELECT *
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '김연아');

-- 인라인 뷰: FROM절 부속질의
-- 고객번호가 2이하인 고객의 판매액을 검색하시오
SELECT  cus.name,
        SUM(ord.saleprice) total
FROM
    (SELECT custid, name FROM customer WHERE custid <= 2) cus,
     orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- view(뷰) 테이블 생성
-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
-- CREATE VIEW 뷰이름
-- AS SELECT 문
CREATE VIEW vw_Customer
AS SELECT *
    FROM customer
    WHERE address LIKE '%대한민국%';

-- 뷰 검색
SELECT *
FROM vw_Customer;

-- 뷰 삭제
DROP VIEW vw_Customer;

-- 고객의 이름과 주문한 도서의 이름과 가격을 검색하시오
CREATE VIEW vw_Orders
AS SELECT cus.name, bo.bookname, ord.saleprice
    FROM customer cus, orders ord, book bo
    WHERE cus.custid = ord.custid
        AND bo.bookid = ord.bookid;

SELECT *
FROM vw_Orders;

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name ASC;
-- STANDARD JOIN - INNER JOIN ~ ON(동등조인): FROM 절에 사용
SELECT cus.name, ord.saleprice
FROM customer cus
    INNER JOIN orders ord
        ON cus.custid = ord.custid
ORDER BY cus.name ASC;

-- OUTER JOIN: 외부조인(JOIN 조건에 충족하는 데이터 아니어도 출력)
-- LEFT OUTER JOIN ~ ON, RIGHT OUTER JOIN ~ ON
-- 주문이 없는 고객을 포함하여 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus
    LEFT OUTER JOIN orders ord
        ON cus.custid = ord.custid
ORDER BY cus.name ASC;










