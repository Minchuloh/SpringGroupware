package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiMaster {
	
	String ediCode;
	String inpEmpCode;
	String inpEmpName;
	String ediTitle;
	String ediContents;
	String ediType;
	String ediTypeName;
	String ediStatus;
	String ediStatusName;
	String fileName;
	Date inpDate;
	Date updateDate;
	
}
