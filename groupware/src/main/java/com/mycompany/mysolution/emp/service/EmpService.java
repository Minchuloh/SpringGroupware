package com.mycompany.mysolution.emp.service;

import java.util.Date;
import java.util.List;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.emp.domain.EmpList;

public interface EmpService {
	
	boolean isDuplicate(String kind, String info);
	
	void createEmp(EmpList emp);
	
	Integer getTotalCount(Search paging);
	
	List<EmpList> getEmpList();
	EmpList getBankInfo(String empCode);
	EmpList getEmp(String empCode);
	EmpList getEmpBySessionId(String sessionId);
	List<EmpList> getEmpListWithPaging(Search paging);	
	
	void modifyEmpName(EmpList emp);
	
	void modifyLastLoginTime(String empCode);
	
	void deleteEmp(String empCode);
	
	void keepLogin(String sessionId, Date limitTime, String account);
	
	List<EmpList> getEmpByName(String empName);
	
}
