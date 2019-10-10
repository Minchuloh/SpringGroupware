package com.mycompany.mysolution.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mycompany.mysolution.emp.domain.EmpList;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionNames {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) != null)
			session.removeAttribute(LOGIN);
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//요청객체에서 세션객체 획득
		HttpSession session = request.getSession();
		
		//로그인이 성공한 이후 처리 로직
		EmpList emp = (EmpList)modelAndView.getModel().get("emp");
		
		if(emp != null) {
			log.info("로그인 성공!");
			session.setAttribute(LOGIN, emp);
			
			redirectAttempted(response, session);
		}
	}

	private void redirectAttempted(HttpServletResponse response, HttpSession session) throws IOException {
		//로그인 전 페이지로 리다이렉트
		String attempted = (String)session.getAttribute(ATTEMPTED);
		if(attempted != null) {
			response.sendRedirect(attempted);
			session.removeAttribute(ATTEMPTED);
		} else {			
			response.sendRedirect("/");
		}
	}

}
