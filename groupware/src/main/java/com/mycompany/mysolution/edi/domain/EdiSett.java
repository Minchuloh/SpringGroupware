package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiSett {
	
	String ediCode;
	Integer ediSeq;
	String settEmpCode;
	String settEmpName;
	String settDeptCode;
	String settDeptName;
	String ediComments;
	String ediSettStatus;
	String ediSettStatusName;
	Date inpDate;
	Date updateDate;
	
}
