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
import dao.UserDao;
import model.User;

@Controller
public class LoginController {
	@Autowired
	private LoginDao loginDao;
	@Autowired 
	private UserDao userDao;
	
	@RequestMapping(value="/login/loginpost.html" , method=RequestMethod.POST)
	public ModelAndView login(
		@Valid User user, BindingResult bindingResult, HttpSession session,HttpServletRequest request) {
		if(bindingResult.hasErrors()) {
			ModelAndView mav=new ModelAndView("menu_header");
			mav.getModel().putAll(bindingResult.getModel()); // 여기 해석 어떻게 해야함?
			return mav;
		}
		User loginUser=loginDao.findByIdAndPwd(user); //DB다녀오기 해당 아이디와 비번에 해당하는 유저의 전체 정보를 select때린다
		ModelAndView mav=new ModelAndView("menu_header");	
		if(loginUser !=null) { // 로그인 성공
			session.setAttribute("loginUser", user.getId()); //세션에 저장
		}else {
			// 로그인 실패
		}
		User usr=userDao.findByIdAndPwd(user);
		System.out.println(usr.getArea());
		mav.addObject("USER",usr); // User 전체를 받아온다 이걸 menu_header에 보낸다 로그아웃 jsp는 이를 출력해낼 수 있다
		String body="freebbs/freebbs"; // 로그인 성공 시 첫 보디 창 출력은 자유게시판
		mav.addObject("BODY",body); 
		return mav;
	}
	@RequestMapping(value="/login/login.html")
	public ModelAndView toLogin() {
		System.out.println("login/login 수신");
		ModelAndView mav=new ModelAndView("menu_header"); //원래는 login/login이었는데 상단바로만 로그인을 구현하니 이제는 메인으로 보내고
		String body="freebbs/freebbs"; // 우선 뽑아내는 화면은 이거고
		mav.addObject("BODY",body);
		mav.addObject(new User());
		mav.addObject("Loginmodal","toLogin");
		return mav;
	}
}
