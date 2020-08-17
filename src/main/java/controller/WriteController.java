package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WriteController {
	@RequestMapping(value = "/write/freebbs.html") // 자유게시판에서 글쓰기
	public ModelAndView bbsview(HttpServletRequest request, Model model,String bbstype) { // 변수 이름을 key와 동일하게 지정하면 자동으로 파라미터를 받는다.
		System.out.println("게시판타입?"+bbstype);
		String bbsType=request.getParameter("bbstype");	
		ModelAndView mav = new ModelAndView("bbs/postbbs");
		mav.addObject("bbstype",bbsType); // 요렇게 두가지로 해야 받아진단다.
		return mav;
	}
}
