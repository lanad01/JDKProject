package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class LoginController {
	@Autowired
	private UserDao userDao;

	@ResponseBody
	@RequestMapping(value = "/login/loginpost.html", method = RequestMethod.POST, produces = "application/json")
	public int ajaxLogin(Model model, HttpSession session, @ModelAttribute("user") User user) throws Exception {
		int result = 0;

		if (userDao.findByIdAndPwd(user) != null) { // 로그인 한 아이디 비번이 DB에 있다
			model.addAttribute("login", userDao.findByIdAndPwd(user));
			session.setAttribute("loginUser", user.getId());// 유저 아디로 세션생성
			result = 1;
		}
		return result;
	}

	@RequestMapping(value = "/login/login.html")
	public ModelAndView toLogin() {
		System.out.println("login/login 수신");
		ModelAndView mav = new ModelAndView("menu_header"); // 원래는 login/login이었는데 상단바로만 로그인을 구현하니 이제는 메인으로 보내고
		String body = "bbs/bbslist"; // 우선 뽑아내는 화면은 이거고
		mav.addObject("PAGENO",1);
		mav.addObject("BODY", body);
		mav.addObject("Loginmodal", "toLogin");
		return mav;
	}

	@RequestMapping(value = "/login/logout.html")
	public ModelAndView logout(HttpSession session) {
		// 로그아웃 세션 비활성화
		session.invalidate();
		// mav.setViewName("logout/logout");
		return new ModelAndView("redirect:/bbs/bbs.html");
	}
}
