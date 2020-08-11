package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBBSController {
	@RequestMapping(value="/freebbs/freebbs.html") // 자유게시판
	public ModelAndView freeBBS(HttpSession session) {
		System.out.println("dddd");
		ModelAndView mav=new ModelAndView("freebbs/freebbs");
		return mav;
	}
}



