package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.User;

@Controller
public class LifeStoryController { 
		@RequestMapping(value="/lifestory/lifestorymain.html") // 자유게시판에서 글쓰기
		public ModelAndView test(HttpSession session,HttpServletRequest request) {
			String body=request.getParameter("BODY");
			ModelAndView mav=new ModelAndView("menu_header");
			mav.addObject("BODY",body);
			return mav;
		}
}
