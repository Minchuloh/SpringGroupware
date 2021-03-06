CREATE TABLE EDI_SETT(
  EDI_CODE VARCHAR2(20),
  EDI_SEQ NUMBER(6,0),
  SETT_EMP_CODE VARCHAR2(10),
  EDI_SETT_STATUS VARCHAR(1),
  EDI_COMMENTS VARCHAR2(100),
  INP_DATE DATE DEFAULT SYSDATE,
  UPDATE_DATE DATE,
  CONSTRAINT PK_EDI_SETT PRIMARY KEY (EDI_CODE, EDI_SEQ, SETT_EMP_CODE)
);