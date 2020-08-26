package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.BBSListDao;
import dao.WriteDao;
import model.Bbs;
import model.Reply;

@Controller
public class BBSController {
	@Autowired
	BBSListDao bbsListDao;
	@Autowired
	WriteDao writeDao;
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
		System.out.println("bbs/bbsview seqno 수신 :"+seqno);
		Bbs bbsDetail=bbsListDao.getBbsDetail(seqno);
		System.out.println("bbsDetail in Controller : "+bbsDetail);
		System.out.println(bbsDetail.getBbstype());
		System.out.println(bbsDetail.getUser_no());
		String writer=bbsListDao.getWriter(bbsDetail.getUser_no()); // 글 작성자를 얻기 위해 bbs의 user_no를 활용한다
		mav.addObject("WRITER",writer);
		mav.addObject("BBS",bbsDetail);
		String body="bbs/bbscont";
		mav.addObject("BODY",body);
		mav.addObject(new Reply());
		return mav;
	}
}



