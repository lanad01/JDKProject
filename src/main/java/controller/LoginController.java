package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class LoginController {
	@Autowired 
	private UserDao userDao;
	
	@RequestMapping(value="/login/loginpost.html", method=RequestMethod.POST)
    public String boardPageMove(Model model,HttpSession session,@ModelAttribute("user") User user) throws Exception {
		System.out.println("login/loginpost수신");
       if(userDao.findByIdAndPwd(user) != null) { //로그인 한 아이디 비번이 DB에 있다
          model.addAttribute("login",userDao.findByIdAndPwd(user));
          System.out.println(user.getId()); 
          System.out.println(user.getPassword());
          session.setAttribute("loginUser", user.getId());//유저 아디로 세션생성
       }
       return "redirect:/index/index.html";
//       return "menu_header";
//       return new ModelAndView("redirect:/bbs/bbs.html?bbstype=freebbs");
    }
//	@RequestMapping(value="/login/loginpost.html" , method=RequestMethod.POST)
//	public ModelAndView login(
//		@Valid User user, BindingResult bindingResult, HttpSession session,HttpServletRequest request) {
//		System.out.println("/login/loginpost 수신");
//		ModelAndView mav=new ModelAndView("menu_header");
		
//		if(bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel()); // 여기 해석 어떻게 해야함?
//			System.out.println("에러메시지:"+bindingResult.getAllErrors());
//			return mav;
//		}
		
//		User loginUser=userDao.findByIdAndPwd(user); //DB다녀오기 해당 아이디와 비번에 해당하는 유저의 전체 정보를 select때린다
//		if(loginUser != null) { // DB다녀오고 로그인 있으면
//			System.out.println(user.getId());
//			System.out.println(user.getPassword());
//			session.setAttribute("loginUser", user.getId()); //세션에 저장
//			System.out.println("세션성공 시 로그인 아이디 :"+user.getId());
//			mav.addObject("USER",user);
//			String body="freebbs/freebbs"; // 로그인 성공 시 첫 보디 창 출력은 자유게시판
//			mav.addObject("BODY",body); 
//			return mav;
//		}else {	// 로그인 실패
//			mav.addObject("Loginmodal","toLogin");
//			return mav;
//		}
//		
//	}
	@RequestMapping(value="/login/login.html")
	public ModelAndView toLogin() {
		System.out.println("login/login 수신");
		ModelAndView mav=new ModelAndView("menu_header"); //원래는 login/login이었는데 상단바로만 로그인을 구현하니 이제는 메인으로 보내고
		String body="freebbs/freebbs"; // 우선 뽑아내는 화면은 이거고
		mav.addObject("BODY",body);
		mav.addObject("Loginmodal","toLogin");
		return mav;
	}
	
	@RequestMapping(value="/login/logout.html")
	public ModelAndView logout(HttpSession session) {
		// 로그아웃 세션 비활성화
		session.invalidate();
		//jsp선언 logout/logout.jsp
		ModelAndView mav=new ModelAndView("menu_header");
		String body="freebbs/freebbs";
		mav.addObject("BODY",body);
		//mav.setViewName("logout/logout");
		return new ModelAndView("redirect:/index/index.html"); //메인페이지
	}
}
