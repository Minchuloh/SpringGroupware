package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.mycompany.mysolution.emp.domain.EmpList;

import lombok.Data;

@Data
public class EdiMaster {
	
	String ediCode;
	String inpEmpCode;
	String inpEmpName;
	String deptCode;
	String deptName;
	String ediTitle;
	String ediContents;
	String ediType;
	String ediTypeName;
	String ediStatus;
	String ediStatusName;
	String fileName;
	Date inpDate;
	Date updateDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date tDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date fDate;
	
	EdiSett ediSett;
	EdiCoWork ediCoWork;
	EdiInform ediInform;
	EdiBudgetUse ediBudgetUse;
	EmpList empList;
	
}
