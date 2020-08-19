package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBBSController {
	@RequestMapping(value="/freebbs/freebbs.html") // 자유게시판
	public ModelAndView freeBBS(HttpServletRequest request,String BODY) {
		ModelAndView mav=new ModelAndView("menu_header");
		String body=request.getParameter("BODY");
		mav.addObject("BODY",body);
		return mav;
	}
}



