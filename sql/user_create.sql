SHOW USER;

-- ����� ���� �����
-- DB�̸�, ��й�ȣ, ���̺� ���� ����(SYSTEM����)
CREATE USER C##mydb IDENTIFIED BY mydb
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP;

-- ���� ����
GRANT CONNECT, DBA TO C##mydb;

SELECT * FROM DBA_ROLES;







