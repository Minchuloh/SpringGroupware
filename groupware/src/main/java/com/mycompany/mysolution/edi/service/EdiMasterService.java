package com.mycompany.mysolution.edi.service;

import java.util.List;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiMaster;

public interface EdiMasterService {
	
	public Integer getEdiTotalCount();
	
	public List<EdiMaster> getEdiMasterAll(Search paging);
	
}
