package com.mycompany.mysolution.edi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.service.EdiMasterService;

@RestController
public class EdiMasterController {
	
	@Autowired
	private EdiMasterService ediService;
	
	@GetMapping("/ediList")
	public ModelAndView getEdiMasterAll(ModelAndView mv) {
		
		List<EdiMaster> edi = ediService.getEdiMasterAll();
		
		mv.addObject("edi", edi);
		mv.setViewName("edi/ediList");
		
		return mv;
	}

}
