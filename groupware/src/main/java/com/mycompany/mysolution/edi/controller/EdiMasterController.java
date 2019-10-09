package com.mycompany.mysolution.edi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mysolution.common.paging.PageCreator;
import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;
import com.mycompany.mysolution.edi.service.EdiMasterService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class EdiMasterController {
	
	@Autowired
	private EdiMasterService ediService;
	
	@GetMapping("/ediList/{pageNum}")
	public ModelAndView getEdiMasterAll(ModelAndView mv, @PathVariable Integer pageNum, 
						@ModelAttribute("search") Search paging) {
		
		paging.setPage(pageNum);
		List<EdiMaster> ediList = ediService.getEdiMasterAll(paging);
		
		Integer totalCount = ediService.getEdiTotalCount();
		PageCreator pageCreator = new PageCreator(pageNum, totalCount);
		
		mv.addObject("ediList", ediList);
		mv.addObject("pageCreator", pageCreator);		
		
		mv.setViewName("edi/ediList");
		
		return mv;
	}
	
	@GetMapping("/ediWrite")
	public ModelAndView createEdiForm(ModelAndView mv) {
		mv.setViewName("edi/ediWrite");
		return mv;
	}
	
	@PostMapping("/ediWrite")
	public ModelAndView createEdi(ModelAndView mv, EdiMaster edi, EdiSett ediSett,	
			String[] coWorkDeptCode, String[] informDeptCode) {
		
		Map<String, Object> ediDatas = new HashMap<>();
		ediDatas.put("edi", edi);
		ediDatas.put("ediSett", ediSett);
		ediDatas.put("coWorkDeptCode", coWorkDeptCode);
		ediDatas.put("informDeptCode", informDeptCode);
		
		if (edi.getEdiType().equals("0001")) {
			ediService.createEdiOrdinary(ediDatas);
		} else if (edi.getEdiType().equals("0002") ) {
			ediService.createEdiWorkDay(ediDatas);
		} else {
			ediService.createEdiRefund(ediDatas);
		}
		
		
		mv.setViewName("redirect:/ediList/1");
		return mv;
	}
	
	@GetMapping("/ediSett")
	public ModelAndView settEdi(ModelAndView mv) {
		mv.setViewName("edi/ediSett");
		return mv;
	}
}
