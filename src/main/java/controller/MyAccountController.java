package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.BBSListDao;
import dao.RepDao;
import dao.UserDao;
import model.Bbs;
import model.Reply;
import model.User;

@Controller
public class MyAccountController {
	@Autowired
	UserDao userDao;
	@Autowired
	RepDao repDao;
	@Autowired
	BBSListDao bbsListDao;
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
		Integer user_no=user.getUser_no();
		
		//게시글 리스트 받아오기
		List<Bbs> myBbsList=bbsListDao.getMyBbs(user_no);
		
		//내 게시물에 달린 댓글들 가져오기
		List<Reply> reListOnMyBbs=repDao.getReListOnMyBbs(user_no); // 필요한 것 seqno List 
		
		// 내가 등록한 댓글
		List<Reply> myReple=repDao.getMyRep(user_no);
		
		// 내 댓글에 달린 한줄의견
		List<Reply> RereOnMyRep=repDao.getRereOnMyRep(user_no);
		
		mav.addObject("RERELIST",RereOnMyRep);
		mav.addObject("MYREP",myReple);
		mav.addObject("RELIST",reListOnMyBbs);
		mav.addObject("MYBBS",myBbsList);
		mav.addObject("MPBODY",1); //마이페이지 디폴트페이지
		mav.addObject("USER",user);
		return mav;
	}
	@RequestMapping(value="/myaccount/pagecontrol.html")
	public ModelAndView pageControl(HttpSession session,HttpServletRequest request,String page) {
		System.out.println("pagecontrol 수신 page :"+page);
		ModelAndView mav=new ModelAndView("menu_header");
		mav.addObject("MPBODY",page);
		// 회원 정보 수정
		String body = "mypage/mypage";
		String id = (String) session.getAttribute("loginUser");
		User user = userDao.findByUserId(id);
		mav.addObject("USER", user);
		System.out.println(user.getId());
		mav.addObject("BODY", body);
		return mav;
	}
	@RequestMapping(value="/myaccount/modify.html")
	public ModelAndView modify(HttpSession session) {
		System.out.println("myaccount/modify 수신 확인");
		ModelAndView mav=new ModelAndView("mypage/mypage_modify");
		String id=(String) session.getAttribute("loginUser");
		User user=this.userDao.findByUserId(id);
		mav.addObject("ID",user.getId());
		mav.addObject("PWD",user.getPassword());
		mav.addObject(user);
		return mav;
	}
	@RequestMapping(value="/myaccount/pwdchangepop.html") 
	public ModelAndView pwdChangepop(HttpSession session) { // 비밀번호 수정
		ModelAndView mav=new ModelAndView("mypage/pwdchange");
		String id=(String)session.getAttribute("loginUser");
		User user=this.userDao.findByUserId(id);
		mav.addObject(user);
		return mav;
	}
	@RequestMapping(value="/myaccount/pwdchange.html")
	public ModelAndView pwdChange(HttpSession session,HttpServletRequest request,User user) {
		System.out.println("myaccount/pwdchange수신");
		// 완료 되면 mypage의 디폴트로 간다
		System.out.println(user.getId());
		System.out.println(user.getPassword());
		String newpwd=request.getParameter("newpwd");
		user.setPassword(newpwd);
		System.out.println(user.getPassword());
		System.out.println(user.getUser_no());
		this.userDao.updatePwd(user);
		System.out.println("새로운 비밀번호: "+newpwd);
		ModelAndView mav=new ModelAndView("mypage/pwdchange");
		return mav;
	}
	@RequestMapping(value="/myaccount/deletepage.html")
	public ModelAndView delete(HttpSession session) {
		System.out.println("myaccount/deletepage 수신 확인");
		ModelAndView mav=new ModelAndView("mypage/delete");
		String id=(String) session.getAttribute("loginUser");
		User user=this.userDao.findByUserId(id);
		mav.addObject(user);
		return mav;
	}
	@RequestMapping(value="/myaccount/delete.html")
	public ModelAndView deleteUser(HttpSession session) {
		System.out.println("myaccount/delete 수신 확인");
		String id=(String) session.getAttribute("loginUser");
		User user=this.userDao.findByUserId(id);
		System.out.println(user.getUser_no());
		this.userDao.deleteUser(user.getUser_no());
		session.invalidate();
		return new ModelAndView("redirect:/bbs/bbs.html");
	}
}