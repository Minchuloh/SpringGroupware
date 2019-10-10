package com.mycompany.mysolution.edi.repository;

import java.util.List;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiBudgetUse;
import com.mycompany.mysolution.edi.domain.EdiCoWork;
import com.mycompany.mysolution.edi.domain.EdiInform;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;
import com.mycompany.mysolution.edi.domain.EdiWorkDay;

public interface EdiMasterMapper {
	
	public Integer getEdiTotalCount();
	
	public List<EdiMaster> getEdiMasterAll(Search paging);	
	public EdiMaster getEdiMaster(String ediCode);	
	public List<EdiSett> getEdiSett(String ediCode);	
	public EdiWorkDay getEdiWorkDay(String ediCode);	
	public EdiBudgetUse getRefund(String ediCode);
	public List<EdiCoWork> getEdiCoWork(String ediCode);	
	public List<EdiInform> getEdiInform(String ediCode);	
	public String getEdiCodeSeq();
	
	public void createEdiMaster(EdiMaster edi);	
	public void createEdiSett(EdiSett ediSett);	
	public void createCoWork(EdiCoWork ediCoWork);	
	public void createInform(EdiInform ediInform);	
	public void createWorkDay(EdiWorkDay ediWorkDay);	
	public void createBudgetUse(EdiBudgetUse ediBudgetUse);
	
	public void deleteEdiMaster(String ediCode);	
	public void deleteEdiSett(String ediCode);	
	public void deleteEdiWorkDay(String ediCode);
	public void deleteRefund(String ediCode);
	public void deleteEdiCoWork(String ediCode);
	public void deleteEdiInform(String ediCode);
	
	public int getEdiMasterChk(String ediCode);
	public int getEdiSettChk(String ediCode);
	public int getEdiWorkDayChk(String ediCode);
	public int getRefundChk(String ediCode);
	public int getEdiCoWorkChk(String ediCode);
	public int getEdiInformChk(String ediCode);
	
}
