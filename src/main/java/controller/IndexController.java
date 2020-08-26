package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.User;
@Controller
public class IndexController {
	@RequestMapping(value="/index/index.html")
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response,HttpSession session)throws Exception {
		ModelAndView mav=new ModelAndView("menu_header"); 
		String loginUser = (String)session.getAttribute("loginUser");
		if(loginUser !=null) { //로그인상태를 의미한다
			session.setAttribute("loginUser", loginUser);
		} // 세션을 유지시켜야 계속 로그아웃되는 상황을 없앨 수 있다.
		String main="freebbs/freebbs";
		mav.addObject(new User());
		mav.addObject("BODY",main);
		return mav;		
	}	
}
