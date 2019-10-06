package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EdiMaster {
	
	String ediCode;
	String inpEmpCode;
	String ediTitle;
	String ediContents;
	String ediType;
	String ediStatus;
	String fileName;
	Date inpDate;
	Date updateDate;
	
}
