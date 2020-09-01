package controller;

import java.util.ArrayList;
import java.util.Date;
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
	public ModelAndView freeBBS(HttpServletRequest request,String bbstype,Integer PAGENO) {
		ModelAndView mav=new ModelAndView("menu_header");
		if(bbstype==null) bbstype="freebbs"; //bbstype이 널값일 경우에 디폴트는 자게
		//게시판에서 비로그인 상태로 글쓰기를 눌렀을 경우.
		String loginWrite=request.getParameter("writelogin");
		if(loginWrite =="1") {
			mav.addObject("Loginmodal","toLogin");
		}
		System.out.println("bbsType : "+bbstype);
		
		//공지사항 리스트 작업
		List<Bbs> notice=bbsListDao.getNotices(1);
		List<String> noticeRepAndrere=new ArrayList<String>();
		mav.addObject("NOTICES",notice);
		for(int i=0; i< notice.size(); i++) { //댓글 개수 가져오기
			Integer noticeRepNum=repDao.getRepList(notice.get(i).getSeqno()).size();
			Integer noticeRereNum=repDao.getRereNum(notice.get(i).getSeqno());
			System.out.println("공지사항 댓글 개수 :" + noticeRepNum);
			System.out.println("공지사항 대댓글 개수 :" + noticeRereNum);
			noticeRepAndrere.add(noticeRepNum+"+"+noticeRereNum);
		}
		mav.addObject("NOTICEREnRERE",noticeRepAndrere);
		//페이징 작업
		if(PAGENO == null) PAGENO = 1;
		List<Bbs> AllList=bbsListDao.getBBSList(bbstype); 
//		Collections.reverse(AllList);
		List<Bbs> bbsList=new ArrayList<Bbs>();
		List<String> timeList=new ArrayList<String>();
		System.out.println("이번 페이지넘버는 PAGENO : "+PAGENO);
		for(int i=((PAGENO-1)*5); i< ((PAGENO-1)*5)+5; i++) {
			// PAGENO * 5 + 1 부터  PAGENO *5 +5
			try {
			
			bbsList.add(AllList.get(i));
			}catch(IndexOutOfBoundsException e) {
				System.out.println("IndexOutOfBoundsException");
			}
		}
		System.out.println("bbsList 사이즈 : "+bbsList.size());
		//작성자와 대댓글 숫자 작성
		List<String> writerList=new ArrayList<String>();
		List<String> repAndrere=new ArrayList<String>();
		for( int t = 0; t < bbsList.size(); t++){ 
			String writer=bbsListDao.getWriter(bbsList.get(t).getUser_no()); //게시글 리스트들의 user_no들만큼 반복하며 writer집어넣기
			writerList.add(writer);
			mav.addObject("WRITER",writer); //저짝에서 새로운 forEach로 받는다
			// 게시글의 댓글과 대댓글 수를 구하는 로직
			Integer repNum=repDao.getRepList(bbsList.get(t).getSeqno()).size();
			Integer rereNum=repDao.getRereNum(bbsList.get(t).getSeqno());
			repAndrere.add(repNum+"+"+rereNum);
		}
		System.out.println(bbsList.get(0).getRegister_date());
		// 페이징 찾기
		int totalCnt = bbsListDao.getPageCnt(bbstype);//전체 글의 갯수 검색
		System.out.println("게시판 타입 : "+bbstype+"   총 게시글 수 :" + totalCnt);
		int pageCnt = 0;//페이지 갯수
		if(totalCnt > 0) {
			pageCnt = totalCnt / 5;
			if(totalCnt % 5 > 0) pageCnt++;
		}
		System.out.println("뿜어내야 할 페이지 수"+pageCnt);
		mav.addObject("PAGE_CNT", pageCnt); // 총 페이지 개수
		mav.addObject("REPANDRERE",repAndrere);
		mav.addObject("WRITERLIST",writerList);
		mav.addObject("LIST",bbsList);
		mav.addObject("BBSTYPE",bbstype);
		String body="bbs/bbslist";
		mav.addObject("BODY",body);
		return mav;
	}
	@RequestMapping(value="/bbs/bbsview.html") 
	public ModelAndView bbsview(Integer seqno) {  // 게시판 뷰, seqno를 수신하고 이를 토대로 해당 게시글 DB에 접속하여 글 세부내용을 전부 뽑아온다
		ModelAndView mav=new ModelAndView("menu_header");
		//bbsDetail
		System.out.println("--------------------여기서부터는 bbs/bbsview seqno=" + seqno+"-----------------------");
		Bbs bbsDetail=bbsListDao.getBbsDetail(seqno);
		mav.addObject("BBS",bbsDetail);
		//bbsDetail종료 
		
		//작성자 뿌리기 by seqno
		String writer=bbsListDao.getWriter(bbsDetail.getUser_no());
		mav.addObject("WRITER",writer);
		//조회수 증가 
		writeDao.addHit(seqno);
		
		//댓글 및 대댓글 갯수 정하는 메서드 구현
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



