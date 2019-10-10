package com.mycompany.mysolution.budget.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BudgetMgr {
	String planYm;
	String deptCode;
	Long useBudget;
	Long planTotalBudget;
	Long planUseBudget;
	Long availableBudget;
	Date inpDate;
	Date updateDate;
}
