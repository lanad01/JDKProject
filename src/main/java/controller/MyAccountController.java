package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class MyAccountController {
	@Autowired
	UserDao userDao;
	@RequestMapping(value="/myaccount/mypage.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session,HttpServletRequest request) {
		String body="mypage/mypage";
		ModelAndView mav=new ModelAndView("menu_header");
		mav.addObject("BODY",body);
		String id=(String) session.getAttribute("loginUser");
		User user=userDao.findByUserId(id);
		mav.addObject("USER",user);
		System.out.println("user정보"+user.getId());
		System.out.println("user정보"+user.getArea());
		System.out.println("user정보"+user.getBirth_date());
		return mav;
	}
}
