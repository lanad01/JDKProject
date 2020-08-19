package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyAccountController {
	@RequestMapping(value="/myaccount/mypage.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session,HttpServletRequest request) {
		String body=request.getParameter("BODY");
		ModelAndView mav=new ModelAndView("menu_header");
		mav.addObject("BODY",body);
		return mav;
	}
}
