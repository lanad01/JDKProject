package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyAccountController {
	@RequestMapping(value="/myaccount/mypage.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session) {
		System.out.println("post수신");
		ModelAndView mav=new ModelAndView("mypage/mypage");
		return mav;
	}
}
