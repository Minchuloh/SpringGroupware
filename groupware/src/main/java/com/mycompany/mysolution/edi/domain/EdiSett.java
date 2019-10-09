package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiSett {
	
	String ediCode;
	Integer ediSeq;
	String settEmpCode;
	String ediComments;
	String ediSettStatus;
	Date inpDate;
	Date updateDate;
	
}
