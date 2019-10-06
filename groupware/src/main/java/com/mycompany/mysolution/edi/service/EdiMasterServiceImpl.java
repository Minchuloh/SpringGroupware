package com.mycompany.mysolution.edi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.repository.EdiMasterMapper;

@Service
public class EdiMasterServiceImpl implements EdiMasterService {

	@Autowired
	EdiMasterMapper ediMapper;
	
	@Override
	public List<EdiMaster> getEdiMasterAll(Search paging) {	
				
		return ediMapper.getEdiMasterAll(paging);
		
	}

	@Override
	public Integer getEdiTotalCount() {
		return ediMapper.getEdiTotalCount();
	}

}
