package com.mycompany.mysolution.emp.repository;

import java.util.List;
import java.util.Map;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.emp.domain.EmpList;

public interface EmpListMapper {
	
	public String getEmpCodeSeq();
	
	void createEmp(EmpList emp);	
	
	//중복체크 (이메일, 연락처)
	int isDuplicate(Map<String, Object> datas);
	
	EmpList getBankInfo(String empCode);
	
	Integer getTotalCount(Search paging);
	
	List<EmpList> getEmpList();
	EmpList getEmp(String empCode);
	List<EmpList> getEmpListWithPaging(Search paging);
	
	void modifyEmpName(EmpList emp);
	
	void deleteEmp(String empCode);
	
}
