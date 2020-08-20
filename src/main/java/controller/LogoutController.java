package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
	
@Controller
public class LogoutController {

	@RequestMapping(value="/logout/logout.html")
	public ModelAndView logout(HttpSession session) {
		// 로그아웃 세션 비활성화
		session.invalidate();
		//jsp선언 logout/logout.jsp
		ModelAndView mav=new ModelAndView("menu_header");
		String body="freebbs/freebbs";
		mav.addObject("BODY",body);
		//mav.setViewName("logout/logout");
		return mav;
	}
}
