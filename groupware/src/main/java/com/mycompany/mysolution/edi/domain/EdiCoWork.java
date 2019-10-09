package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiCoWork {
	
	String ediCode;
	Integer ediSeq;
	String coWorkDeptCode;
	String ediCoWorkStatus;
	String ediCoWorkComments;
	Date inpDate;
	Date updateDate;
	
}
