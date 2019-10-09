package com.mycompany.mysolution.edi.repository;

import java.util.List;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiCoWork;
import com.mycompany.mysolution.edi.domain.EdiInform;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;

public interface EdiMasterMapper {
	
	public Integer getEdiTotalCount();
	
	public List<EdiMaster> getEdiMasterAll(Search paging);
	
	public String getEdiCodeSeq();
	
	public void createEdiMaster(EdiMaster edi);
	
	public void createEdiSett(EdiSett ediSett);
	
	public void createCoWork(EdiCoWork ediCoWork);
	
	public void createInform(EdiInform ediInform);
	
}
