package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		List<String> writerList=new ArrayList<String>();
		List<String> repAndrere=new ArrayList<String>();
		for( int t = 0; t < fbList.size(); t++){ //대댓글리스트를 통해서 얻어오기
			String writer=bbsListDao.getWriter(fbList.get(t).getUser_no()); //게시글 리스트들의 user_no들만큼 반복하며 writer집어넣기
			writerList.add(writer);
			mav.addObject("WRITER",writer); //저짝에서 새로운 forEach로 받는다
			System.out.println("----------bbs/bbs writer / fbList 번호 "+fbList.get(t)+"의 writer는 "+writer);
			// 게시글의 댓글과 대댓글 수를 구하는 로직
			Integer repNum=repDao.getRepList(fbList.get(t).getSeqno()).size();
			Integer rereNum=repDao.getRereNum(fbList.get(t).getSeqno());
			System.out.println("해당 개시글의 댓글개수는 :" +repNum+" 대댓글의 개수는 : "+ rereNum);
			repAndrere.add(repNum+"+"+rereNum);
			System.out.println("댓글 대댓글 수 출력 "+t+"번 째 게시글의 값: "+repAndrere);
		}
		mav.addObject("REPANDRERE",repAndrere);
		mav.addObject("WRITERLIST",writerList);
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
		System.out.println("bbsUser_no : "+bbsDetail.getUser_no());
		mav.addObject("BBS",bbsDetail);
		//bbsDetail종료 
		
		//작성자 뿌리기 by seqno
		String writer=bbsListDao.getWriter(bbsDetail.getUser_no());
		System.out.println("작성자 나오니? : "+writer);
		mav.addObject("WRITER",writer);
		//조회수 증가 
		writeDao.addHit(seqno);
		
		//댓글 및 대댓글 갯수 정하는 메서드 구현
		System.out.println("댓글 갯수 정하는 메소드 결과 : "+repDao.getRepList(seqno).size());
		mav.addObject("REPNUM",repDao.getRepList(seqno).size());
		repDao.getRereNum(seqno); // 게시글을 통해 모든 대댓글 갯수
		mav.addObject("RERENUM",repDao.getRereNum(seqno));
		//종료
		String body="bbs/bbscont";
		mav.addObject("BODY",body);
		mav.addObject(new Reply()); //리플객체 주입
		return mav;
	}
}



