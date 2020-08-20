package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class RegisterController {
	// DB에 User를 삽입
	@Autowired
	private UserDao userDao;

	@RequestMapping(value="/register/registerpost.html") // 자유게시판에서 글쓰기
	public ModelAndView entryUser(@Valid User user, BindingResult bindingResult, HttpSession session, HttpServletRequest request) {
		System.out.println("Registerpost수신");
		String body="freebbs/freebbs";
		if(bindingResult.hasErrors()) {
			ModelAndView mav=new ModelAndView("menu_header");
			mav.addObject("BODY",body);
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		ModelAndView mav=new ModelAndView("menu_header");
		mav.addObject("BODY", body);
		user.setName(name);
		
		return mav;
	}

	@RequestMapping(value="/register/register.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session, HttpServletRequest request) {
		System.out.println("Register/register");
		String body = request.getParameter("BODY"); //register/register.jsp
		ModelAndView mav = new ModelAndView("menu_header");
		mav.addObject("BODY", body);
		mav.addObject(new User()); // Bean 보내기
		return mav;
	}

	@RequestMapping(value = "/register/duplicationcheck.html")
	public ModelAndView duplicationCheck() {
		ModelAndView mav = new ModelAndView("menu_header");

		return mav;
	}
}
