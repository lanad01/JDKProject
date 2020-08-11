package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;
import util.UserEntryValidator;

@Controller
public class UserEntryFormController {
	//입력된 정보 유효성검사
	@Autowired
	private UserEntryValidator userEntryValidator;
	//DB에 User를 삽입
	@Autowired
	private UserDao userDao;
	//가입자 등록 Form 일부에 메세지를 넣는다. [ 가입 시 필요합니다 ] 
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(method=RequestMethod.GET)
	public String toUserEntry() {
		System.out.println("GET OK");
		return "userentryform/userEntry"; // userEntry.jsp를 띄우는 기능
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView onSubmit(User user, BindingResult br) { // 버튼을 누른 경우 호출
		this.userEntryValidator.validate(user,br);
		ModelAndView mav=new ModelAndView();
		if(br.hasErrors()) { // 유효성 검사 중 에러가 존재?
			//화면을 바꾸지 않고 에러메시지를 출력
			// userEntry.jsp는 유지시킨다.
			mav.getModel().putAll(br.getModel());
			//br이 가지고 있는 에러 메시지를 mav가 가지고 있는 view에 출력
			return mav;
		}
		try {
			userDao.entryUser(user);
			mav.setViewName("userentryform/userEntrySuccess");
		}catch(DataIntegrityViolationException e) {
			//동일 계정이 존재하는 경우의 예외 설정
			br.reject("error.duplicate.user"); //중복 계정 에러메시지 출력
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		return mav; 
	}
	@ModelAttribute
	public User setUp() { //formform을 통한 객체 전송을 받을 곳
		User user=new User();
		MessageSourceAccessor ms=new MessageSourceAccessor(this.messageSource);
		//접근객체 Accessor를 통해 messageSource를 가져옴
		user.setId(ms.getMessage("user.id.default")); //from properties
		user.setName(ms.getMessage("user.name.default"));
		return user;
	}
}
