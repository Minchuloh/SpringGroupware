package com.mycompany.mysolution.budget.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.mysolution.budget.domain.BudgetMgr;
import com.mycompany.mysolution.budget.repository.BudgetMgrMapper;

@Service
public class BudgetMgrServiceImpl implements BudgetMgrService {
	
	@Autowired
	private BudgetMgrMapper budgetMgrMapper;

	@Override
	public BudgetMgr getAvailableAmt(String deptCode) {
		return budgetMgrMapper.getAvailableAmt(deptCode);
	}

}
