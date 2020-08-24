package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.User;
@Controller
public class IndexController {
	//원래의 경우라면 의존성 주입을 위해 환경설정에서 bean설정을 해주어야한다
	// 생성자나 세터 등을 사용하여 의존성 주입을 하려고 할 때, 해당 빈을 찾아서 주입해주는 annotation이다. 
	// p: 을 잡아줄 필요가 없다.
	//required 값을 ture나 false로 줄 수 있다.  @Autowired or @Autowired(required = true)
	//true인 경우는 의존성주입에 필요한 객체가 무조건 bean으로 등록되어있어야한다.
	//false인 경우는 예를 들어, setter의 파라미터가 주입 되어야되는 경우, bean등록이 안되어 있어도, 오류가 나지않고 인스턴스는 만들어준다.
	//@Autowired(required = false) default값은 true이다.
	@RequestMapping(value="/index/index.html")
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response,HttpSession session)throws Exception {
		ModelAndView mav=new ModelAndView("menu_header");
		String loginUser = (String)session.getAttribute("loginUser");
		if(loginUser !=null) { //로그인상태를 의미한다
			session.setAttribute("loginUser", loginUser);
		} // 세션을 유지시켜야 계속 로그아웃되는 상황을 없앨 수 있다.
		String main="freebbs/freebbs";
		mav.addObject(new User());
		mav.addObject("BODY",main);
		return mav;
		
	}
	
}
