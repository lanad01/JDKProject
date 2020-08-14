package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LifeStoryController { 
		@RequestMapping(value="/lifestory/lifestorymain.html") // 자유게시판에서 글쓰기
		public ModelAndView test(HttpSession session) {
			System.out.println("생활기 클릭");
			ModelAndView mav=new ModelAndView("lifestory/lifestorymain");
			return mav;
		}
}
