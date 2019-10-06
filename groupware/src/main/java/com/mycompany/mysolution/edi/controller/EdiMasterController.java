package com.mycompany.mysolution.edi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mysolution.common.paging.PageCreator;
import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiMaster;
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
		
		log.info(ediList);	
		
		Integer totalCount = ediService.getEdiTotalCount();
		PageCreator pageCreator = new PageCreator(pageNum, totalCount);
		
		mv.addObject("ediList", ediList);
		mv.addObject("pageCreator", pageCreator);		
		
		mv.setViewName("edi/ediList");
		
		return mv;
	}
	
	@GetMapping("/ediWrite")
	public ModelAndView createEdi(ModelAndView mv) {
		mv.setViewName("edi/ediWrite");
		return mv;
	}
}
