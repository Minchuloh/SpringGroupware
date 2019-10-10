package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiCoWork {
	
	String ediCode;
	Integer ediSeq;
	String inpEmpCode;
	String inpEmpName;
	String coWorkDeptCode;
	String coWorkDeptName;
	String mgrEmpCode;
	String mgrEmpName;
	String ediCoWorkStatus;
	String ediCoWorkStatusName;
	String ediCoWorkComments;
	Date inpDate;
	Date updateDate;
	
}
