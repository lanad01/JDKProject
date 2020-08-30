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
		ModelAndView mav=new ModelAndView("menu_header");
		String body="mypage/mypage";
		mav.addObject("BODY",body);
		String id=(String) session.getAttribute("loginUser");
		if(id==null) { //로그인 중이 아니라면
			mav.addObject("Loginmodal","toLogin");
			return mav;
		} //로그인 상태라면 정보를 가져온다
		User user=userDao.findByUserId(id);
		mav.addObject("MPBODY",1); //마이페이지 디폴트페이지
		mav.addObject("USER",user);
		return mav;
	}
	@RequestMapping(value="/myaccount/pagecontrol.html")
	public ModelAndView pageControl(HttpSession session,HttpServletRequest request,String page) {
		System.out.println("pagecontrol 수신 page :"+page);
		ModelAndView mav=new ModelAndView("menu_header");
		mav.addObject("MPBODY",page);
		String body="mypage/mypage";
		String id=(String) session.getAttribute("loginUser");
		User user=userDao.findByUserId(id);
		mav.addObject("USER",user);
		System.out.println(user.getId());
		mav.addObject("BODY",body);
		
		return mav;
	}
	
	@RequestMapping(value="/myaccount/modify.html")
	public ModelAndView modify(HttpSession session) {
		System.out.println("myaccount/modify 수신 확인");
		ModelAndView mav=new ModelAndView("mypage/mypage_modify");
		String id=(String) session.getAttribute("loginUser");
		User user=this.userDao.findByUserId(id);
		mav.addObject(user);
		
		return mav;
	}
}
