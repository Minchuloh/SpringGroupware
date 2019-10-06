package com.mycompany.mysolution.emp.service;

import java.util.List;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.emp.domain.EmpList;

public interface EmpService {
	
	boolean isDuplicate(String kind, String info);
	
	void createEmp(EmpList emp);
	
	Integer getTotalCount(Search paging);
	
	List<EmpList> getEmpList();
	EmpList getEmp(String empCode);
	List<EmpList> getEmpListWithPaging(Search paging);
	
	void modifyEmpName(EmpList emp);
	
	void deleteEmp(String empCode);
	
}
