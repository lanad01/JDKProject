package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import util.UserEntryValidator;

@Controller
public class RegisterController {
	//입력된 정보 유효성검사
		@Autowired
		private UserEntryValidator userEntryValidator;
		//DB에 User를 삽입
		@Autowired
		private UserDao userDao;
		//가입자 등록 Form 일부에 메세지를 넣는다. [ 가입 시 필요합니다 ] 
		@Autowired
		private MessageSource messageSource;
		
	@RequestMapping(value="/register/register.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session) {
		System.out.println("Register수신");
		ModelAndView mav=new ModelAndView("register/register");
		return mav;
	}
}
