CREATE TABLE EMP_LIST(
  EMP_CODE VARCHAR2(10) PRIMARY KEY,
  EMP_NAME VARCHAR2(10) NOT NULL,
  PASSWORD VARCHAR2(150) NOT NULL,
  EMAIL VARCHAR2(50) NOT NULL UNIQUE,
  PHONE VARCHAR2(20) NOT NULL UNIQUE,
  DEPT_CODE VARCHAR2(10) NOT NULL,
  POSITION VARCHAR2(40) NOT NULL,
  SALARY NUMBER(20,0) NOT NULL,
  BANK_NAME VARCHAR2(30) NOT NULL,
  BANK_ACCOUNT VARCHAR2(50) NOT NULL,
  PHOTO VARCHAR2(500),
  FIRE_YN VARCHAR2(1) DEFAULT 'N',
  HIRE_DATE DATE NOT NULL,
  FIRE_DATE DATE DEFAULT TO_DATE('99991231', 'YYYYMMDD'),
  SESSION_ID VARCHAR2(150),
  LIMIT_TIME DATE,
  INP_DATE DATE DEFAULT SYSDATE,
  UPDATE_DATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_EMP_LIST
    START WITH 12
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 1
    NOCYCLE;