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
import model.User;

@Controller
public class WriteController {
	@Autowired
	private WriteDao writeDao;
	Bbs bbs;
	@RequestMapping(value = "/write/freebbs.html") // 자유게시판에서 글쓰기
	public ModelAndView bbsview(HttpServletRequest request,HttpSession session) { // 변수 이름을 key와 동일하게 지정하면 자동으로 파라미터를 받는다.
		System.out.println("write/freebbs수신 for Bean Injection to postbbs"); //
		String id=(String)session.getAttribute("loginUser");
		if(id == null) { //로그인 상태가 아니라면
			System.out.println("로그인필요");
			ModelAndView mav=new ModelAndView("menu_header");
			mav.addObject("Loginmodal","toLogin");
			mav.addObject("BODY","freebbs/freebbs");
			return mav;
		}
		ModelAndView mav = new ModelAndView("menu_header");
		mav.addObject("BODY","bbs/postbbs"); // postbbs에 Bbs 빈 주입
		mav.addObject(new Bbs());
		return mav;
	}
	
	@RequestMapping(value="/write/inputbbs.html", method=RequestMethod.POST) // postbbs에서 보내는 bbs정보 수신
	public ModelAndView inputBBS(@Valid Bbs bbs, BindingResult bindingResult, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("inputBBS post 수신");
		String body="freebbs/freebbs"; // 등록이 완료되면 freebbs목록으로 가야합니다.
		String bbsType=request.getParameter("bbstype");
		System.out.println("게시판 타입"+bbsType);
		if (bindingResult.hasErrors()) { // bidingError
			ModelAndView mav = new ModelAndView("menu_header");
			System.out.println("bindingErrors");
			System.out.println(bindingResult.getAllErrors());
			mav.addObject("BODY", "bbs/postbbs"); // 에러메시지 객체를 postbbs에 송신
			mav.getModel().putAll(bindingResult.getModel()); // 그러기 위한 객체
			return mav;
		} // 컨트롤러에서 insert해야 하는 부분 : / bbsType
		String id=(String) session.getAttribute("loginUser");
		bbs.setId(id); // 세션 로그인정보를 얻어와서 아이디로 치환
		bbs.setBbsType(bbsType);
		System.out.println("내용:"+bbs.getContent());
		System.out.println("내용:"+bbs.getId());
		this.writeDao.insertBBS(bbs);
		ModelAndView mav=new ModelAndView("menu_header");
		mav.addObject("BODY",body); //완료 후 게시판 목록으로
		
		return mav;
	}
}
