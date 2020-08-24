package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.User;

@Controller
public class BBSController {
	@RequestMapping(value="/bbs/freebbs.html") // 자유게시판
	public ModelAndView freeBBS(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("menu_header");
		String body="freebbs/freebbs";
		mav.addObject("BODY",body);
		mav.addObject(new User());
		return mav;
	}
}



