package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.User;

@Controller
public class LoginController {
	@Autowired
	private LoginDao loginDao;
	
	@RequestMapping(value="/login/loginpost.html" , method=RequestMethod.POST)
	public ModelAndView login(
		@Valid User user, BindingResult bindingResult, HttpSession session,HttpServletRequest request) {
		System.out.println("LoginPost수신");
		String body=request.getParameter("BODY");
		if(bindingResult.hasErrors()) {
			ModelAndView mav=new ModelAndView("menu_header");
			
			mav.addObject("HEADER","login.jsp");
			mav.addObject("BODY",body);
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		User loginUser=loginDao.findByIdAndPwd(user); //DB다녀오기
		ModelAndView mav=new ModelAndView("home/template");
		if(loginUser !=null) { // 로그인 성공
			session.setAttribute("loginUser", user.getId()); //세션에 저장
		}else { // 로그인 실패
			
		}
		mav.addObject("BODY","loginResult.jsp");
		return mav;
	}
	@RequestMapping(value="/login/login.html")
	public ModelAndView toLogin() {
		System.out.println("login/login수신?");
		ModelAndView mav=new ModelAndView("login/login");
		String body="register/register";
		mav.addObject("BODY",body);
		mav.addObject(new User());//form form을 위한 객체를 주입
		return mav;
	}
}
