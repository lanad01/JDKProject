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
		System.out.println("post수신");
		ModelAndView mav = new ModelAndView("bbs/postfreebbs");
		return mav;
	}

	@RequestMapping(value = "/post/bbsview.html") // 자유게시판에서 글쓰기
	public ModelAndView bbsview(HttpServletRequest request, Model model,int num) { // 변수 이름을 key와 동일하게 지정하면 자동으로 파라미터를 받는다.
		/* int num = Integer.parseInt(request.getParameter("num")); */
		System.out.println("num x 10 :" + (num * 10));
		String postNum=request.getParameter("num");
		System.out.println("ddd"+postNum);
		
		ModelAndView mav = new ModelAndView("freebbs/bbsmain");
		mav.addObject("postNum",postNum); // 요렇게 두가지로 해야 받아진단다.
		return mav;
	}
}
