package com.mycompany.mysolution;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mysolution.emp.domain.EmpList;
import com.mycompany.mysolution.emp.service.EmpService;

/**
 * Handles requests for the application home page.
 */
@RestController
public class HomeController {
	
	@Autowired
	private EmpService empService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("/")
	public ModelAndView home(Locale locale, HttpSession session) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		
		EmpList emp = empService.getEmpBySessionId(session.getId());
		mv.addObject("emp", emp);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return mv;
	}
	
}
