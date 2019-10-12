package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiSett {
	
	String ediCode;
	int ediSeq;
	String settEmpCode;
	String settEmpName;
	String settDeptCode;
	String settDeptName;
	String ediComments;
	String ediSettStatus;
	String ediSettStatusName;
	String finishYn;
	Date inpDate;
	Date updateDate;
	
}
