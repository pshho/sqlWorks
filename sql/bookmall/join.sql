-- ����(JOIN)�� ��������

SELECT * FROM customer;
SELECT * FROM book;
SELECT * FROM orders;

-- ������ ������ �ֹ��� ���� �����͸� ��� �˻��Ͻÿ�
SELECT  cus.custid,
        cus.name,
        bok.bookname,
        bok.publisher,
        bok.price,
        ord.saleprice,
        ord.orderdate
FROM customer cus, orders ord, book bok
WHERE cus.custid = ord.custid
AND ord.bookid = bok.bookid
-- AND cus.name = '�迬��';        -- �迬�� ������ �ֹ�����
-- AND ord.saleprice >= 20000;    -- �ǸŰ����� 20000�� �̻��� �ֹ�����
AND ord.orderdate = '2018-07-08'; -- �ֹ����� 2018-07-08 �ֹ�����

-- �������� �ֹ��� ��� ������ ���Ǹž��� ���Ͻÿ�
SELECT  cus.name,
        SUM(saleprice) ���Ǹűݾ�,
        RANK() OVER(ORDER BY SUM(saleprice) DESC) ����
FROM customer cus, orders ord, book bok
WHERE cus.custid = ord.custid
AND ord.bookid = bok.bookid
GROUP BY cus.name;

-- ������ �̸��� ������ �ֹ��� ������ �̸��� �˻��Ͻÿ�
SELECT  cus.name,
        bok.bookname,
        ord.saleprice,
        ord.orderdate
FROM customer cus, orders ord, book bok
WHERE cus.custid = ord.custid
  AND ord.bookid = bok.bookid
  ORDER BY cus.name;    -- �����ϸ� �׷�ȭ�� ��

-- ���� ��� ������ �̸��� �˻��Ͻÿ�
-- SELECT  bookname, MAX(price) FROM book;  -- �����߻�
SELECT MAX(price) FROM book;    -- 35000
SELECT bookname FROM book
WHERE price = 35000;            -- �������̺�

-- ��ø ����
SELECT  bookname,
        publisher,
        price
FROM book
WHERE price =
    (SELECT MAX(price) FROM book);

-- ������ ������ ���ִ� ������ �̸��� �˻��Ͻÿ�
-- 1. �ֹ����̺����� �������̵� �˻�
SELECT custid FROM orders;
-- 2. �������̵� �ִ� �����̸� �˻�
SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);

SELECT name
FROM customer
WHERE custid
    IN(SELECT custid
        FROM orders);

-- ������ ������ ������ ������ �̸��� �˻��Ͻÿ�
SELECT name
FROM customer
WHERE custid
    NOT IN(SELECT custid
            FROM orders);

-- '�迬��' ������ �ֹ�����
-- 1. �迬�� ������ ���̵� �˻�
SELECT name
FROM customer
WHERE name = '�迬��';
-- 2. �迬�� ������ ���̵�� �ֹ����̺����� �˻�
SELECT *
FROM orders
WHERE custid = (SELECT custid
                    FROM customer
                    WHERE name =
                        '�迬��');









