package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EdiBudgetUse {
	
	String ediCode;
	String deptCode;
	
	Long useBudget;
	Long planTotalBudget;
	Long planUseBudget;	
	Long availableBudget;
	
	String bankName;
	String bankAccount;
	String bankOwner;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date refundDate;
	Date inpDate;
	Date updateDate;
	
}
