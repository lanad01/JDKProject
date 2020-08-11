package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	@RequestMapping
	public ModelAndView logout(HttpSession session) {
		// 로그아웃 세션 비활성화
		session.invalidate();
		//jsp선언 logout/logout.jsp
		ModelAndView mav=new ModelAndView("logout/logout");
		//mav.setViewName("logout/logout");
		return mav;
	}
}
