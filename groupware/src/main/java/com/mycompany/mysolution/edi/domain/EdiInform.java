package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiInform {

	String ediCode;
	Integer ediSeq;
	String informDeptCode;	
	String informDeptName;
	Date inpDate;
	Date updateDate;
}
