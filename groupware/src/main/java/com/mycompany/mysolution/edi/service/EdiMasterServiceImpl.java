package com.mycompany.mysolution.edi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.mysolution.budget.domain.BudgetMgr;
import com.mycompany.mysolution.budget.repository.BudgetMgrMapper;
import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiBudgetUse;
import com.mycompany.mysolution.edi.domain.EdiCoWork;
import com.mycompany.mysolution.edi.domain.EdiInform;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;
import com.mycompany.mysolution.edi.domain.EdiWorkDay;
import com.mycompany.mysolution.edi.repository.EdiMasterMapper;
import com.mycompany.mysolution.emp.domain.EmpList;
import com.mycompany.mysolution.emp.repository.EmpListMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class EdiMasterServiceImpl implements EdiMasterService {

	@Autowired
	EdiMasterMapper ediMapper;
	
	@Autowired
	EmpListMapper empMapper;
	
	@Autowired
	BudgetMgrMapper budgetMgrMapper;
	
	@Override
	public List<EdiMaster> getEdiMasterAll(Search paging) {			
		return ediMapper.getEdiMasterAll(paging);	
	}
	
	@Override
	public EdiMaster getEdiMaster(String ediCode) {		
		return ediMapper.getEdiMaster(ediCode);
	}
	
	@Override
	public List<EdiSett> getEdiSett(String ediCode) {
		return ediMapper.getEdiSett(ediCode);
	}
	
	@Override
	public List<EdiCoWork> getCoWork(String ediCode) {
		return ediMapper.getEdiCoWork(ediCode);
	}
	
	@Override
	public List<EdiInform> getInform(String ediCode) {		
		return ediMapper.getEdiInform(ediCode);
	}
	
	@Override
	public EdiWorkDay getWorkDay(String ediCode) {
		return ediMapper.getEdiWorkDay(ediCode);
	}
	
	@Override
	public EdiBudgetUse getRefund(String ediCode) {
		return ediMapper.getRefund(ediCode);
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
		
	}
	
	@Transactional
	@Override
	public void createEdiWorkDay(Map<String, Object> ediDatas) {
		
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

		//EDI_WORK_DAY INSERT LOGIC
		EdiWorkDay ediWorkDay = (EdiWorkDay)ediDatas.get("ediWorkDay");
		ediWorkDay.setEdiCode(edi.getEdiCode());
		ediWorkDay.setEdiEmpCode(edi.getInpEmpCode());
		ediMapper.createWorkDay(ediWorkDay);
		log.info("EDI_WORK_DAY 등록완료");
		
	}
	
	@Transactional
	@Override
	public void createEdiRefund(Map<String, Object> ediDatas) {
		
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
		
		//EDI_BUDGET_USE INSERT LOGIC			
		EdiBudgetUse ediBudgetUse = (EdiBudgetUse)ediDatas.get("ediBudgetUse");			
		//작성자 기준 은행정보 조회
		EmpList emp = empMapper.getBankInfo(edi.getInpEmpCode());		
		
		ediBudgetUse.setEdiCode(edi.getEdiCode());
		ediBudgetUse.setBankOwner(edi.getInpEmpCode());
		ediBudgetUse.setBankAccount(emp.getBankAccount());
		ediBudgetUse.setBankName(emp.getBankName());		
		ediMapper.createBudgetUse(ediBudgetUse);
		log.info("EDI_BUDGET_USE 등록완료");
		
		//BUDGET_MGR UPDATE LOGIC
		BudgetMgr budgetMgr = (BudgetMgr)ediDatas.get("budgetMgr");
		budgetMgrMapper.updateBudgetMgr(budgetMgr);
		log.info("BUDGET_MGR 업데이트 완료");
	}
	
	@Override
	public void createCoWork(String[] deptCodeArr, String ediCode) {

		for(int i=0 ; i < deptCodeArr.length ; i++) {
			EdiCoWork ediCoWork = new EdiCoWork();
			ediCoWork.setEdiCode(ediCode);
			ediCoWork.setCoWorkDeptCode(deptCodeArr[i]);
			ediCoWork.setEdiCoWorkComments("");
			ediCoWork.setEdiCoWorkStatus("0");
			ediCoWork.setEdiSeq(1);
			ediMapper.createCoWork(ediCoWork);
		}
		log.info("EDI_COWORK_DEPT 등록완료");
	}
	
	@Override
	public void createInform(String[] deptCodeArr, String ediCode) {
		
		for(int i=0 ; i < deptCodeArr.length ; i++) {
			EdiInform ediInform = new EdiInform();
			ediInform.setEdiCode(ediCode);
			ediInform.setInformDeptCode(deptCodeArr[i]);		
			ediInform.setEdiSeq(1);
			ediMapper.createInform(ediInform);
		}
		log.info("EDI_INFORM_DEPT 등록완료");
		
	}
	
	@Transactional
	@Override
	public void deleteEdi(String ediCode) {	
		
		if (ediMapper.getEdiInformChk(ediCode) >= 1) {
			ediMapper.deleteEdiInform(ediCode);
		}
		if (ediMapper.getEdiCoWorkChk(ediCode) >= 1) {
			ediMapper.deleteEdiCoWork(ediCode);
		}
		if (ediMapper.getRefundChk(ediCode) >= 1) {
			EdiBudgetUse budgetUse = ediMapper.getRefund(ediCode);
			
			BudgetMgr budgetMgr = new BudgetMgr();
			budgetMgr.setDeptCode(budgetUse.getDeptCode());
			budgetMgr.setUseBudget(budgetUse.getUseBudget() * (-1));	
			
			budgetMgrMapper.updateBudgetMgr(budgetMgr);
			ediMapper.deleteRefund(ediCode);			
		}
		if (ediMapper.getEdiWorkDayChk(ediCode) >= 1) {
			ediMapper.deleteEdiWorkDay(ediCode);
		}		
		if (ediMapper.getEdiSettChk(ediCode) >= 1) {
			ediMapper.deleteEdiSett(ediCode);
		}
		
		if (ediMapper.getEdiMasterChk(ediCode) >= 1) {
			ediMapper.deleteEdiMaster(ediCode);
		} else {
			log.info("EdiMaster 삭제할 데이터 없음");
		}	
		
	}

}