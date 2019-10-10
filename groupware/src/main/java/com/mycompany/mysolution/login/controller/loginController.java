package com.mycompany.mysolution.login.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.mycompany.mysolution.emp.domain.EmpList;
import com.mycompany.mysolution.emp.service.EmpService;
import com.mycompany.mysolution.interceptor.SessionNames;
import com.mycompany.mysolution.login.domain.LoginUser;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class loginController {
	
	@Autowired
	private EmpService empService;
	
	@GetMapping("/login")
	public ModelAndView login(HttpSession session) {
		
		return new ModelAndView("/login/login");
	}
	
	//로그인 검증 요청처리 메서드
	@PostMapping("/loginCheck")
	public ModelAndView loginCheck(LoginUser loginUser,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		log.info("LoginUser: " + loginUser);
		
		ModelAndView mv = new ModelAndView();
		
		EmpList emp =  empService.getEmp(loginUser.getEmpCode());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(emp != null) {
			if(encoder.matches(loginUser.getPassword(), emp.getPassword())) {
				
				//최종 로그인 시간 갱신
				empService.modifyLastLoginTime(emp.getEmpCode());
				
				//자동로그인 DB처리
				long expiredDate = System.currentTimeMillis() + SessionNames.LIMIT_TIME * 1000;
				Date limitDate = new Date(expiredDate);
				empService.keepLogin(session.getId(), limitDate, loginUser.getEmpCode());
				
				log.info("emp: " + emp);
				
				mv.addObject("emp", emp);			
				
			} else {
				mv.addObject("loginResult", "pwFail");
			}			
		} else {
			mv.addObject("loginResult", "idFail");
		}
		mv.setViewName("login/loginCheck");
		return mv;
		
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		EmpList emp = (EmpList)session.getAttribute(SessionNames.LOGIN);
		
		log.info("emp: " + emp);
		
		if(emp != null) {			
						
			session.removeAttribute(SessionNames.LOGIN);
			session.invalidate(); //세션 객체 통채로 무효화
			empService.keepLogin("none", new Date(), emp.getEmpCode());
			
		}
		
		return new ModelAndView("redirect:/");
	}

}
