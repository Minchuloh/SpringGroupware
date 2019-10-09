CREATE TABLE EDI_COWORK_DEPT (
    EDI_CODE VARCHAR2(20),
    EDI_SEQ NUMBER(6,0),
    COWORK_DEPT_CODE VARCHAR2(10),
    EDI_COWORK_STATUS VARCHAR2(1),
    INP_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT PK_EDI_COWORK_DEPT PRIMARY KEY(EDI_CODE, EDI_SEQ, COWORK_DEPT_CODE)
);