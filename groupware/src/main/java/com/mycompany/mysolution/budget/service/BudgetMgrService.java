package com.mycompany.mysolution.budget.service;

import com.mycompany.mysolution.budget.domain.BudgetMgr;

public interface BudgetMgrService {
	
	public BudgetMgr getAvailableAmt(String deptCode);
	
}
