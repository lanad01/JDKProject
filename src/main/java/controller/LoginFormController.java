package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class LoginFormController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private Validator loginValidator; // 사용할 Validator를 선언해주셔야죠
	// RequestMapping은 컨트롤러 내부에서의 맵핑 
	@ModelAttribute//Form:form에서 보내는 modelAttribute의 맵핑
	public User setUp() { //login.jsp에서 보낸 객체정보가 들어있어
		return new User(); //유저를 생성해서 setUpForm에 들어가
	}
	//현재 존재하는 RequestMapping은 두 가지 - 로그인 jsp를 띄우는 get맵핑과 로그인 정보를 전달받는 post맵핑
	@RequestMapping(method=RequestMethod.GET) //이건 기본맵핑. 로그인 눌러서 가는 것이 post맵핑
	public String setUpForm() {
		return "loginform/login";//객체 주입할 jsp이름 처리는 viewResolver가 해줌
								// 클래스 url로 찾기 때문에 controller
	}
	
	@RequestMapping(method=RequestMethod.POST) //일단 login.jsp form:form은 post로 보내고 있어
	public ModelAndView onSubmit(User user, BindingResult br, HttpSession session){ //Dispatcher서블릿으로 보낼 MAV리턴 -
		//Validator에서는 매개변수로 (User, Errors)로 받음
		// BindingResult? : Errors의 자식. 다형성 주입 
		//1. 유효성 검사
		this.loginValidator.validate(user, br); //진행
		ModelAndView mav=new ModelAndView();
		if(br.hasErrors()) { // br을 통한 유효성 검사 통과 여부  
			//로그인 화면을 그대로 유지,  단 에러메시지가 포함된 로그인화면.
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		//2. 유효성 검사 통과의 경우 계정과 암호로 DB에서 검색
		try {
			User loginUser=userDao.findByIdAndPwd(user);//DB에서 조회
			if(loginUser !=null) { //로그인 성공
				mav.setViewName("loginform/loginSuccess");
				mav.addObject("loginUser",loginUser); //view 모델을 바로 주입
				session.setAttribute("USER_KEY",loginUser);
				//계속 로그아웃되는 상황을 없애기 위해 세션을 생성해주자.
				//이제 세션 유지해야하는 항목에서는 항시 위 세션을 get해줘야한다.
				return mav;
			}
		}catch(Exception e) {
			br.reject("error.login.user"); //출력될 에러메시지 삽입
		}
		//3. 검색 결과에 따라 로그인성공 JSP(loginSuccess.jsp) 실패 JSP
		return null;
		
	}
}
