package com.mycompany.mysolution.edi.service;

import java.util.List;
import java.util.Map;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiMaster;

public interface EdiMasterService {
	
	public Integer getEdiTotalCount();
	
	public List<EdiMaster> getEdiMasterAll(Search paging);
	
	public void createEdiOrdinary(Map<String, Object> ediDatas);
	
	public void createEdiWorkDay(Map<String, Object> ediDatas);
	
	public void createEdiRefund(Map<String, Object> ediDatas);
	
	public void createCoWork(String[] deptCodeArr, String ediCode);
	
	public void createInform(String[] deptCodeArr, String ediCode);
	
}
