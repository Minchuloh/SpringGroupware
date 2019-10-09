package com.mycompany.mysolution.edi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiCoWork;
import com.mycompany.mysolution.edi.domain.EdiInform;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;
import com.mycompany.mysolution.edi.repository.EdiMasterMapper;

import lombok.extern.log4j.Log4j;

@Log4j
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
	
	@Transactional
	@Override
	public void createEdiOrdinary(Map<String, Object> ediDatas) {
		
		//EDI_MASTER INSERT LOGIC
		EdiMaster edi = (EdiMaster)ediDatas.get("edi");	
		edi.setEdiCode(ediMapper.getEdiCodeSeq());
		edi.setEdiStatus("0");		
		ediMapper.createEdiMaster(edi);		
		log.info("EDI_MASTER 등록완료");
		
		//EDI_SETT INSERT LOGIC
		EdiSett ediSett = (EdiSett)ediDatas.get("ediSett");		
		ediSett.setEdiCode(edi.getEdiCode());		
		ediSett.setEdiSeq(1);
		ediSett.setEdiSettStatus("0");
		ediSett.setEdiComments("");
		ediMapper.createEdiSett(ediSett);		
		log.info("EDI_SETT 등록완료");
		
		//EDI_COWORK_DEPT INSERT LOGIC
		String[] coWorkDeptCode = (String[])ediDatas.get("coWorkDeptCode");
		if (coWorkDeptCode != null) {
			for(int i = 0 ; i < coWorkDeptCode.length ; i++) {
				
				EdiCoWork ediCoWork = new EdiCoWork();
				ediCoWork.setEdiCode(edi.getEdiCode());
				ediCoWork.setEdiSeq(1);
				ediCoWork.setCoWorkDeptCode(coWorkDeptCode[i]);
				ediCoWork.setEdiCoWorkStatus("0");
				ediCoWork.setEdiCoWorkComments("");
				ediMapper.createCoWork(ediCoWork);
			}
		}
		log.info("EDI_COWORK_DEPT 등록완료");
		
		//EDI_INFORM_DEPT INSERT LOGIC
		String[] informDeptCode = (String[])ediDatas.get("informDeptCode");
		if (informDeptCode != null) {
			for(int i = 0 ; i < informDeptCode.length ; i++) {
				
				EdiInform ediInform = new EdiInform();
				ediInform.setEdiCode(edi.getEdiCode());
				ediInform.setEdiSeq(1);
				ediInform.setInformDeptCode(informDeptCode[i]);				
				ediMapper.createInform(ediInform);
			}
		}
		log.info("EDI_INFROM_DEPT 등록완료");
				
		log.info("일반품의 등록성공, 문서번호: " + edi.getEdiCode());		
	}
	
	@Override
	public void createEdiWorkDay(Map<String, Object> ediDatas) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void createEdiRefund(Map<String, Object> ediDatas) {
		// TODO Auto-generated method stub
		
	}

}