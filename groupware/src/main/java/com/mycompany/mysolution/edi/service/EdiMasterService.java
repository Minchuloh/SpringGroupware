package com.mycompany.mysolution.edi.service;

import java.util.List;
import java.util.Map;

import com.mycompany.mysolution.edi.domain.EdiBudgetUse;
import com.mycompany.mysolution.edi.domain.EdiCoWork;
import com.mycompany.mysolution.edi.domain.EdiInform;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;
import com.mycompany.mysolution.edi.domain.EdiWorkDay;

public interface EdiMasterService {
	
	public Integer getEdiTotalCount();
	
	public List<EdiMaster> getEdiMasterAll(EdiMaster edi, int page, int countPerPage);
	
	public EdiMaster getEdiMaster(String ediCode);
	
	public List<EdiSett> getEdiSett(String ediCode);
	
	public List<EdiCoWork> getCoWork(String ediCode);
	
	public List<EdiInform> getInform(String ediCode);
	
	public EdiBudgetUse getRefund(String ediCode);
	
	public EdiWorkDay getWorkDay(String ediCode);
	
	public void createEdiOrdinary(Map<String, Object> ediDatas);
	
	public void createEdiWorkDay(Map<String, Object> ediDatas);
	
	public void createEdiRefund(Map<String, Object> ediDatas);
	
	public void createCoWork(String[] deptCodeArr, String ediCode);
	
	public void createInform(String[] deptCodeArr, String ediCode);
	
	public void deleteEdi(String ediCode);

	public void coWorkEdi(EdiCoWork ediCoWork);
	
}
