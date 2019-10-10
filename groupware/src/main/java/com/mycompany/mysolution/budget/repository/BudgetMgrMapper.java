package com.mycompany.mysolution.budget.repository;

import com.mycompany.mysolution.budget.domain.BudgetMgr;

public interface BudgetMgrMapper {
	
	public BudgetMgr getAvailableAmt(String deptCode);
	public void updateBudgetMgr(BudgetMgr budgetMgr);
	
}
