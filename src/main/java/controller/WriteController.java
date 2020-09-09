package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import dao.WriteDao;
import model.Bbs;
import model.User;
@Controller
public class WriteController {
	@Autowired
	private WriteDao writeDao;
	@Autowired
	private UserDao userDao;
	@RequestMapping(value = "/write/bbs.html") // 자유게시판에서 글쓰기
	public ModelAndView bbsview(HttpServletRequest request,HttpSession session,String bbstype, HttpServletResponse response) { // 변수 이름을 key와 동일하게 지정하면 자동으로 파라미터를 받는다.
		System.out.println("write/bbs수신 for Bean Injection to postbbs"); //
		String id=(String)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("menu_header");
		if(id == null) { //로그인 상태가 아니라면
			System.out.println("idNull");
			mav.addObject("Loginmodal","toLogin");
//			mav.addObject("BODY","bbs/bbslist");
			return new ModelAndView("forward:/bbs/bbs.html?writelogin=1");
		} //로그인상태라면?
		User user=userDao.findByUserId(id); // 세션 접속 중인 id의 user_no를 얻어 오기 위한 객체
		Integer user_no=user.getUser_no();
		String life=request.getParameter("life_no");
		if(life==null) life="0";
		Integer life_no=Integer.parseInt(life);
		try {
			if(bbstype.contentEquals("life") && user_no!=life_no) { // 생활기 게시판에서 누른 글쓰기이며, 받아온 생활기 유저 번호와 현재 세션 정보가 불일치
				System.out.println("생활기 게시판 글쓰기 자격 없는 작성자 입니다. 생활기 게시판 번호 : "+life_no);
				return new ModelAndView("redirect:/bbs/bbs.html?bbstype=life&life_no="+life_no+"&nqu=1");
			}else if(bbstype.contentEquals("life") && user_no==life_no) { // 생활기 게시판에서 누른 글쓰기이며, 현재 세션정보와 게시판 소유자가 일치
				System.out.println("게으른철학자님 환영합니다. 생활기 게시판 번호 "+life_no);
				mav.addObject("BODY","bbs/postbbs"); // postbbs에 Bbs 빈 주입
				mav.addObject(new Bbs());
				mav.addObject("bbsType",bbstype);
				mav.addObject("LIFENO",life_no);
				return mav;
				
			}else if(bbstype.contentEquals("freebbs") || bbstype.contentEquals("info") || bbstype.contentEquals("qna") || bbstype.contentEquals("exp")) {
				//생활기 게시판에서 누른 것이 아니며 글쓰기가 유효하여야 한다
				mav.addObject("BODY","bbs/postbbs"); // postbbs에 Bbs 빈 주입
				mav.addObject(new Bbs());
				mav.addObject("bbsType",bbstype);
				return mav;
			}
		}catch(Exception e){
			
		}
		return null;
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
		try {
			Integer maxRow=writeDao.getMaxRownum(bbsType);
			if(maxRow==null) {
				maxRow=0;
			}
			bbs.setRn(maxRow+1);
			System.out.println("MAx Ronwnum in wrtieController : "+maxRow);
		}catch(Exception e) {
			
		}
		writeDao.insertBBS(bbs);
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+bbs.getSeqno());
	}
}
