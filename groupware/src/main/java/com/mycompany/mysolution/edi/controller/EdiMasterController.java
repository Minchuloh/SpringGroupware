package com.mycompany.mysolution.edi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mysolution.budget.domain.BudgetMgr;
import com.mycompany.mysolution.budget.service.BudgetMgrService;
import com.mycompany.mysolution.common.paging.PageCreator;
import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiBudgetUse;
import com.mycompany.mysolution.edi.domain.EdiCoWork;
import com.mycompany.mysolution.edi.domain.EdiInform;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;
import com.mycompany.mysolution.edi.domain.EdiWorkDay;
import com.mycompany.mysolution.edi.service.EdiMasterService;
import com.mycompany.mysolution.emp.domain.EmpList;
import com.mycompany.mysolution.emp.service.EmpService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class EdiMasterController {
	
	@Autowired
	private EdiMasterService ediService;
	
	@Autowired
	private BudgetMgrService budgetMgrService;
	
	@Autowired
	private EmpService empService;
	
	@GetMapping("/ediList/{pageNum}")
	public ModelAndView getEdiMasterAll(
				ModelAndView mv, HttpSession session, @PathVariable Integer pageNum, 
				@ModelAttribute("search") Search paging, EdiMaster edi
					) {
		
		//세션정보 전달
		EmpList emp = empService.getEmpBySessionId(session.getId());
		mv.addObject("emp", emp);	
		
		//페이지세팅
		paging.setPage(pageNum);	
		
		//전자결재 검색
		List<EdiMaster> ediList = 
				ediService.getEdiMasterAll(edi, paging.getPage(), paging.getCountPerPage());
		
		log.info("검색단 조회 : " + ediList);
		
		Integer totalCount = ediService.getEdiTotalCount();
		PageCreator pageCreator = new PageCreator(pageNum, totalCount);
		
		mv.addObject("ediList", ediList);
		mv.addObject("pageCreator", pageCreator);		
		
		mv.setViewName("edi/ediList");
		
		return mv;
	}
	
	@GetMapping("/ediWrite")
	public ModelAndView createEdiForm(HttpSession session, ModelAndView mv) {
		
		//로그인 사원정보 세팅
		EmpList emp = empService.getEmpBySessionId(session.getId());
		
		log.info("emp : " + emp);
		
		//비용환급 정보 세팅
		BudgetMgr budgetMgr = budgetMgrService.getAvailableAmt(emp.getDeptCode());		
		
		mv.addObject("budgetMgr", budgetMgr);		
		mv.addObject("emp", emp);
		mv.setViewName("edi/ediWrite");
		
		return mv;
	}
	
	@Transactional
	@PostMapping("/ediWrite")
	public ModelAndView createEdi(
				ModelAndView mv, EdiMaster edi, EdiSett ediSett,	
				String[] coWorkDeptCodeArr, String[] informDeptCodeArr, 
				EdiWorkDay ediWorkDay, EdiBudgetUse ediBudgetUse, BudgetMgr budgetMgr) {		
		
		Map<String, Object> ediDatas = new HashMap<>();
		ediDatas.put("edi", edi);
		ediDatas.put("ediSett", ediSett);
		ediDatas.put("ediWorkDay", ediWorkDay);
		ediDatas.put("ediBudgetUse", ediBudgetUse);
		ediDatas.put("budgetMgr", budgetMgr);
		
		if (edi.getEdiType().equals("0001")) {
			ediService.createEdiOrdinary(ediDatas);
			if(coWorkDeptCodeArr != null) {
				ediService.createCoWork(coWorkDeptCodeArr, edi.getEdiCode());;
			}
			if(informDeptCodeArr != null) {
				ediService.createInform(informDeptCodeArr, edi.getEdiCode());;
			}
			log.info("일반품의 등록 완료: " + edi.getEdiCode());
		} else if (edi.getEdiType().equals("0002") ) {			
			ediService.createEdiWorkDay(ediDatas);
			if(coWorkDeptCodeArr != null) {
				ediService.createCoWork(coWorkDeptCodeArr, edi.getEdiCode());;
			}
			if(informDeptCodeArr != null) {
				ediService.createInform(informDeptCodeArr, edi.getEdiCode());;
			}
			log.info("근태신청 등록 완료: " + edi.getEdiCode());
		} else {
			ediService.createEdiRefund(ediDatas);
			if(coWorkDeptCodeArr != null) {
				ediService.createCoWork(coWorkDeptCodeArr, edi.getEdiCode());;
			}
			if(informDeptCodeArr != null) {
				ediService.createInform(informDeptCodeArr, edi.getEdiCode());;
			}
			log.info("비용환급 등록 완료: " + edi.getEdiCode());
		}		
		
		mv.setViewName("redirect:/ediList/1");
		return mv;
	}
	
	@GetMapping("/ediSett/{ediCode}")
	public ModelAndView settEdi(ModelAndView mv, HttpSession session,  @PathVariable String ediCode) {
		
		EmpList emp = empService.getEmpBySessionId(session.getId());
		mv.addObject("emp", emp);
		
		EdiMaster edi = ediService.getEdiMaster(ediCode);
		List<EdiSett> sett = ediService.getEdiSett(ediCode);
		List<EdiCoWork> coWork = ediService.getCoWork(ediCode);
		List<EdiInform> inform = ediService.getInform(ediCode);
		EdiWorkDay workDay = ediService.getWorkDay(ediCode);
		EdiBudgetUse refund = ediService.getRefund(ediCode);
		
		mv.addObject("edi", edi);
		mv.addObject("sett", sett);
		mv.addObject("coWork", coWork);
		mv.addObject("inform", inform);
		mv.addObject("workDay", workDay);
		mv.addObject("refund", refund);		
		mv.setViewName("edi/ediContent");
		
		mv.setViewName("edi/ediSett");
		return mv;
	}
	
	@GetMapping("/ediList/ediContent")
	public ModelAndView contentEdi(ModelAndView mv, HttpSession session, String ediCode) {
		
		EmpList emp = empService.getEmpBySessionId(session.getId());
		mv.addObject("emp", emp);
		
		EdiMaster edi = ediService.getEdiMaster(ediCode);
		List<EdiSett> sett = ediService.getEdiSett(ediCode);
		List<EdiCoWork> coWork = ediService.getCoWork(ediCode);
		List<EdiInform> inform = ediService.getInform(ediCode);
		EdiWorkDay workDay = ediService.getWorkDay(ediCode);
		EdiBudgetUse refund = ediService.getRefund(ediCode);
		
		mv.addObject("edi", edi);
		mv.addObject("sett", sett);
		mv.addObject("coWork", coWork);
		mv.addObject("inform", inform);
		mv.addObject("workDay", workDay);
		mv.addObject("refund", refund);		
		mv.setViewName("edi/ediContent");
		
		return mv;
	}
	
	@DeleteMapping("/ediList/del/{ediCode}")
	public String deleteEdi(@PathVariable String ediCode) {
		
		log.info("전자결재 삭제 요청: " + ediCode);
		
		ediService.deleteEdi(ediCode);

		return "delSuccess";
	}
	
	@PostMapping("/ediList/cowork")
	public String coWorkEdi(@RequestBody EdiCoWork ediCoWork) {
		
		log.info("전자결재 합의 요청: " + ediCoWork);
		
		ediService.coWorkEdi(ediCoWork);

		return "cowork Success";
	}
	
	
	
}
