package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostController {
	@RequestMapping(value = "/post/freebbs.html") // 자유게시판에서 글쓰기
	public ModelAndView bbslist(HttpSession session) {
		ModelAndView mav = new ModelAndView("bbs/postfreebbs");
		return mav;
	}

	@RequestMapping(value = "/post/postbbs.html") // 자유게시판에서 글쓰기
	public ModelAndView bbsview(HttpServletRequest request) { // 변수 이름을 key와 동일하게 지정하면 자동으로 파라미터를 받는다.
		
		ModelAndView mav = new ModelAndView("menu_header");
		return mav;
	}
}
