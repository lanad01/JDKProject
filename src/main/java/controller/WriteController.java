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

import dao.WriteDao;
import model.Bbs;
@Controller
public class WriteController {
	@Autowired
	private WriteDao writeDao;
	@RequestMapping(value = "/write/bbs.html") // 자유게시판에서 글쓰기
	public ModelAndView bbsview(HttpServletRequest request,HttpSession session,String bbstype) { // 변수 이름을 key와 동일하게 지정하면 자동으로 파라미터를 받는다.
		System.out.println("write/bbs수신 for Bean Injection to postbbs"); //
		String id=(String)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("menu_header");
		if(id == null) { //로그인 상태가 아니라면
			System.out.println("idNull");
			mav.addObject("Loginmodal","toLogin");
//			mav.addObject("BODY","bbs/bbslist");
			return new ModelAndView("forward:/bbs/bbs.html?writelogin=1");
		} //로그인상태라면?
		mav.addObject("BODY","bbs/postbbs"); // postbbs에 Bbs 빈 주입
		mav.addObject(new Bbs());
		mav.addObject("bbsType",bbstype);
		return mav;
	}
	
	@RequestMapping(value="/write/inputbbs.html", method=RequestMethod.POST) // postbbs에서 보내는 bbs정보 수신
	public ModelAndView inputBBS(@Valid Bbs bbs, BindingResult bindingResult, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("inputBBS post 수신");
		ModelAndView mav = new ModelAndView("menu_header");
		if (bindingResult.hasErrors()) { // bidingError
			System.out.println("inputBBs / bindingErrors");
			mav.addObject("BODY", "bbs/postbbs"); // 에러메시지 객체를 postbbs에 송신
			mav.getModel().putAll(bindingResult.getModel()); // 그러기 위한 객체
			return mav;
		} // 컨트롤러에서 insert해야 하는 부분 : / bbsType, user_no / form form 으로 알아서 insert된 부분 : title content 
		System.out.println("bbsType :"+bbs.getBbstype());
		String bbsType=request.getParameter("bbstype"); //bbsType을 form으로 받아오고
		bbs.setBbstype(bbsType);
		
		String id=(String) session.getAttribute("loginUser");
		Integer user_no=writeDao.getWriter(id); //세션을 통해서 얻은 id를 DB에 보내서 등가조인
		bbs.setUser_no(user_no); // 받은 유저넘버를 실질적으로 bbs객체에 삽입
		//종합된 bbs를 최종적으로 insert, 작성일자는 Impl에서 처리
		writeDao.insertBBS(bbs);
		return new ModelAndView("redirect:/bbs/bbs.html?bbstype="+bbsType);
	}
}
