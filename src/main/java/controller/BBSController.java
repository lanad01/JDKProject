package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BBSListDao;
import dao.RepDao;
import dao.WriteDao;
import model.Bbs;
import model.Reply;

@Controller
public class BBSController {
	@Autowired
	BBSListDao bbsListDao;
	@Autowired
	WriteDao writeDao;
	@Autowired
	RepDao repDao;
	@RequestMapping(value="/bbs/bbs.html") // 자유게시판 목록 여기서 받은 게시판 LIST 목록을 ADD해야한다.
	public ModelAndView freeBBS(HttpServletRequest request,String bbstype) {
		ModelAndView mav=new ModelAndView("menu_header");
		//자유게시판 LIST 
		System.out.println("bbsType : "+bbstype);
		List<Bbs> fbList=bbsListDao.getBBSList(bbstype);
		mav.addObject("LIST",fbList);
		String body="freebbs/freebbs";
		mav.addObject("BODY",body);
		return mav;
	}
	@RequestMapping(value="/bbs/bbsview.html") 
	public ModelAndView bbsview(Integer seqno) {  // 게시판 뷰, seqno를 수신하고 이를 토대로 해당 게시글 DB에 접속하여 글 세부내용을 전부 뽑아온다
		ModelAndView mav=new ModelAndView("menu_header");
		//bbsDetail
		System.out.println("--------------------여기서부터는 bbs/bbsview seqno=" + seqno+"-----------------------");
		Bbs bbsDetail=bbsListDao.getBbsDetail(seqno);
		System.out.println("bbsDetail in Controller : "+bbsDetail);
		System.out.println("bbsType="+bbsDetail.getBbstype());
		System.out.println("bbsUser_no : "+bbsDetail.getUser_no());
		
		String writer=bbsListDao.getWriter(bbsDetail.getUser_no()); // 글 작성자를 얻기 위해 bbs의 user_no를 활용한다
		mav.addObject("WRITER",writer);
		mav.addObject("BBS",bbsDetail);
		//bbsDetail종료 
		
		//댓글 및 대댓글 갯수 정하는 메서드 구현
		System.out.println("댓글 갯수 정하는 메소드 결과 : "+repDao.getRepList(seqno).size());
		mav.addObject("REPNUM",repDao.getRepList(seqno).size());
		repDao.getRereNum(seqno);
		System.out.println("select count(*)의 결과:"+repDao.getRereNum(seqno));
		mav.addObject("RERENUM",repDao.getRereNum(seqno));
		//종료
		String body="bbs/bbscont";
		mav.addObject("BODY",body);
		mav.addObject(new Reply()); //리플객체 주입
		return mav;
	}
}



