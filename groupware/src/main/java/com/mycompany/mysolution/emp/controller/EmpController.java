package com.mycompany.mysolution.emp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.mysolution.common.paging.PageCreator;
import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.emp.domain.EmpList;
import com.mycompany.mysolution.emp.service.EmpService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class EmpController {
	
	@Autowired
	private EmpService empService;
	
	@GetMapping("/empList/{pageNum}")
	public ModelAndView getEmpList(ModelAndView mv, @PathVariable Integer pageNum, 
				@ModelAttribute("search") Search paging, HttpSession session) {
		
		EmpList emp = empService.getEmpBySessionId(session.getId());
		mv.addObject("emp", emp);
		
		paging.setPage(pageNum);
		List<EmpList> empList = empService.getEmpListWithPaging(paging);
		
		Integer totalCount = empService.getTotalCount(paging);
		PageCreator pageCreator = new PageCreator(pageNum, totalCount);				
		
		
		mv.addObject("empList", empList);
		mv.addObject("pageCreator", pageCreator);		
		
		mv.setViewName("emp/empList");
		
		return mv;
	}
	
	@GetMapping("/check")
	public ResponseEntity<String> check(String info, String kind) {
		
		try {
			boolean flag = empService.isDuplicate(kind, info);
			if(flag) { //데이터가 중복데이터임!
				return new ResponseEntity<>("true", HttpStatus.OK);
			} else { //중복데이터가 아님!
				return new ResponseEntity<>("false", HttpStatus.OK);
			}
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/empWrite")
	public ModelAndView createEmp(HttpSession session, ModelAndView mv) {
		
		EmpList emp = empService.getEmpBySessionId(session.getId());
		mv.addObject("emp", emp);
		mv.setViewName("emp/empWrite");
		
		return mv;
	}
	
	@PostMapping("/empWrite")
	public ModelAndView createEmp(EmpList emp, RedirectAttributes ra) {
		
		log.info("클라이언트에서 전달된 emp: " + emp);
		log.info("클라이언트에서 전달된 파일명 목록: " + emp.getPhoto());
		
		empService.createEmp(emp);
		
		ra.addFlashAttribute("message", "regSuccess");
		ModelAndView mv = new ModelAndView("redirect:/empList/1");
		
		return mv;
	}
}
