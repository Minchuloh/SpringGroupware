CREATE TABLE BUDGET_MGR(
  PLAN_YM VARCHAR2(6),
  DEPT_CODE VARCHAR2(10),
  TOTAL_BUDGET NUMBER(10, 0) DEFAULT 0,
  INP_DATE DATE DEFAULT SYSDATE,
  UPDATE_DATE DATE DEFAULT SYSDATE,  
  CONSTRAINT PK_BUDGET_MGR PRIMARY KEY (PLAN_YM, DEPT_CODE)
);