package controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BBSListDao;
import dao.RepDao;
import dao.UserDao;
import dao.WriteDao;
import model.Bbs;
import model.PageMaker;
import model.Reply;
import model.Search;
import model.User;

@Controller
public class BBSController {
	@Autowired
	BBSListDao bbsListDao;
	@Autowired
	WriteDao writeDao;
	@Autowired
	RepDao repDao;
	@Autowired
	UserDao userDao;
	@RequestMapping(value="/bbs/bbs.html") // 자유게시판 목록 여기서 받은 게시판 LIST 목록을 ADD해야한다.
	public ModelAndView freeBBS(HttpSession session,HttpServletRequest request,String bbstype,Integer PAGENO,String search) {
		System.out.println("bbs/bbs.html 수신");
		ModelAndView mav=new ModelAndView("menu_header");
		if(bbstype==null) bbstype="whole"; //bbstype이 널값일 경우에 디폴트는 자게
		//게시판에서 비로그인 상태로 글쓰기를 눌렀을 경우.
		String loginWrite=request.getParameter("writelogin");
		try {
			if(loginWrite.equals("1")) {
				mav.addObject("Loginmodal", "toLogin");
			}
		}catch(NullPointerException e) {
			System.out.println("Null");
		}
		//공지사항 리스트 작업
		List<Bbs> notice=bbsListDao.getNotices(1);
		List<String> noticeRepAndrere=new ArrayList<String>();
		mav.addObject("NOTICES",notice);
		for(int i=0; i< notice.size(); i++) { //댓글 개수 가져오기
			Integer noticeRepNum=repDao.getRepList(notice.get(i).getSeqno()).size();
			Integer noticeRereNum=repDao.getRereNum(notice.get(i).getSeqno());
			noticeRepAndrere.add(noticeRepNum+"+"+noticeRereNum);
		}
		mav.addObject("NOTICEREnRERE",noticeRepAndrere);
		
		//페이징에 쓰일 데이터 초기화
		List<Bbs> AllList=new LinkedList<Bbs>(); // select 되는 모든 게시판을 담을 정보
		List<Bbs> bbsList=new LinkedList<Bbs>(); // 각 페이지마다 담을 게시판 리스트 // displayPerPage : 10
		if(PAGENO == null) PAGENO = 1; //PageNo가 Null이면 1로 Default
		int totalCnt = 0;	//전체 글의 갯수를 넣을 int
		
		//여기서부턴 Select 될 게시판 / 반드시 정의해야 할 데이터 - AllList, totalCnt
		if(bbstype.contentEquals("freebbs") || bbstype.contentEquals("info") || bbstype.contentEquals("qna") || bbstype.contentEquals("exp")) {
			System.out.println("개념글이나 전체글이 아닌 게시판");
			totalCnt=bbsListDao.getPageCnt(bbstype);
			AllList=bbsListDao.getBBSList(bbstype); 
		}else if(bbstype.contentEquals("ganyum")) { 
			System.out.println("개념글");
			AllList=bbsListDao.getGanyum();	
			totalCnt=AllList.size();
			mav.addObject("ganyumListSize",AllList.size());

		}else if(bbstype.contentEquals("whole")) {
			System.out.println("전체글");
			AllList=bbsListDao.getWhole();
			totalCnt=AllList.size();
			mav.addObject("wholeListSize",AllList.size());
		}else if(bbstype.contentEquals("life")) { // 생활기 게시판 네비게이션에서 검색
			System.out.println("생활기 게시판 분기");
			String NQualified=request.getParameter("nqu");
			System.out.println("nqu 값 :"+NQualified);
			if(NQualified==null) {
				System.out.println("nqu null분기 :"+NQualified);
				NQualified="";
			}else if(NQualified.contentEquals("1")) {
				System.out.println("nqu true 분기");
				mav.addObject("NQU",true);
			}
			String life=request.getParameter("life_no");
			System.out.println("life 값: " +life); //5
			if(life==null) life="0";
			Integer life_no=Integer.parseInt(life);
			AllList=bbsListDao.getLifeStory(life_no);
			for(int i=0; i<AllList.size(); i++) {
				System.out.println(life_no+"번 생활기 게시판 기록자의 "+i+"번 째 생활기 게시판");
			}
			mav.addObject("LIFENO",life);
			totalCnt=AllList.size();
			
		}
		
		// 검색작업을 통한 SelectList AllList에 넣는다
		try {
			System.out.println("search 여부 : "+search);
			if(bbstype.contains("main")) {
				bbstype="whole";
			}
			
			if(search.contentEquals("yes")) { //검색을 통한 bbs/bbs.html 호출
				System.out.println("search 프로세스 시작");
				List<Bbs> searchedBbs=new ArrayList<Bbs>();
				String searchKey = request.getParameter("searchKey");
				System.out.println(searchKey);
				String keyword = request.getParameter("keyword");
				System.out.println(keyword);
				if(searchKey==null) searchKey="";
				if(keyword==null) keyword="";
				Search sch=new Search();
				sch.setKeyword(keyword);
				sch.setSearchkey(searchKey);
				sch.setBbstype(bbstype);
				sch.setSearch(true);
				mav.addObject("SCH",sch);
				// bbslist jsp에서 페이징 클릭시 바람직한 페이징으로 가게 하기 위함
				if(bbstype.contentEquals("freebbs") || bbstype.contentEquals("info") || bbstype.contentEquals("qna") || bbstype.contentEquals("exp")) {
					System.out.println("자유게시판 정보 질답 경험담 게시판 검색 분기");
					sch.setBbstype(bbstype);
					try {
						searchedBbs = bbsListDao.searchBbs(sch);
						for (int i = 0; i < searchedBbs.size(); i++) {
							System.out.println(i + "번째 검색 글의 title : " + searchedBbs.get(i).getTitle());
						}
						AllList=searchedBbs;
						totalCnt=AllList.size();
						mav.addObject("SearchedBbsSize",totalCnt);
						if(searchedBbs.size()==0) {
							mav.addObject("SEARCHEDBBS","0");
						}
					} catch(NullPointerException e) {
						System.out.println("검색 Null");
					}
				//개념 및 전체글을 통한 AllList
				}else if(bbstype.contentEquals("ganyum") || bbstype.contentEquals("whole")){
					System.out.println("개념글 전체글 검색 분기");
					sch.setBbstype("wholeAndGanyum"); //전체글이나 개념글에서 수행된 검색은 bbsType을 wholeAndGanyum으로 한다
					try { 
						searchedBbs=bbsListDao.searchBbs(sch); // bbstype이 wholeAndGanyum이며 searchKey와 keyword는 위에서 Inject되었다.
						for (int i = 0; i < searchedBbs.size(); i++) {
							System.out.println(i + "번째 검색 글의 title : " + searchedBbs.get(i).getTitle());
						}
						AllList=searchedBbs;
						totalCnt=AllList.size();
						mav.addObject("SearchedBbsSize",totalCnt);
					}catch(Exception e) {
						System.out.println("전체글 검색");
					}
				}
			}
		}catch(Exception e) {
			System.out.println("Search를 통한 bbs/bbs.html 호출이 아님");
		}
		
		// 일반 게시판을 통한 검색 AllList Select
		// 페이징 수행 필요한 정보 - 각 Select 게시판목록(AllList)의 totalBbsCnt, PageNo, bbstype
		System.out.println("현재 페이지 : "+PAGENO+"게시판 타입 : "+bbstype+"   총 게시글 수 :" + totalCnt);
		PageMaker pm=new PageMaker();
		pm.setCurrentPage(PAGENO);
		pm.setTotalBbsCnt(totalCnt);
		pm.calcData();
		
		// 각 페이지별로 AllList 값 10개씩 넣기
		for(int i=((PAGENO-1)*10); i< ((PAGENO-1)*10)+10; i++) {
			try {
			bbsList.add(AllList.get(i));
			}catch(IndexOutOfBoundsException e) {
			}
		}
		//작성자와 대댓글 숫자 작성
		List<String> writerList = new ArrayList<String>();
		List<String> repAndrere = new ArrayList<String>();
		for (int t = 0; t < bbsList.size(); t++) {
			String writer = bbsListDao.getWriter(bbsList.get(t).getUser_no()); // 게시글 리스트들의 user_no들만큼 반복하며 writer집어넣기
			writerList.add(writer);
			mav.addObject("WRITER", writer); // 저짝에서 새로운 forEach로 받는다
			// 게시글의 댓글과 대댓글 수를 구하는 로직
			Integer repNum = repDao.getRepList(bbsList.get(t).getSeqno()).size();
			Integer rereNum = repDao.getRereNum(bbsList.get(t).getSeqno());
			repAndrere.add(repNum + "+" + rereNum);
		}
		
		mav.addObject("totalPost",totalCnt);
		mav.addObject("REPANDRERE",repAndrere);
		mav.addObject("WRITERLIST",writerList);
		mav.addObject("LIST",bbsList);
		mav.addObject("PM",pm);
		mav.addObject("BBSTYPE",bbstype);
		String body="bbs/bbslist";
		mav.addObject("BODY",body);
		return mav;
	}
	@RequestMapping(value="/bbs/bbsview.html") 
	public ModelAndView bbsview(Integer seqno,HttpServletRequest req,String nopage) {  // 게시판 뷰, seqno를 수신하고 이를 토대로 해당 게시글 DB에 접속하여 글 세부내용을 전부 뽑아온다
		ModelAndView mav=new ModelAndView("menu_header");
		//bbsDetail
		System.out.println("--------------------여기서부터는 bbs/bbsview seqno=" + seqno+"-----------------------");
		Bbs bbsDetail=bbsListDao.getBbsDetail(seqno);
		mav.addObject("BBS",bbsDetail);
		//댓글 삭제 버튼 누를 시 비로그인이면 해당 페이지 로드하면서 로그인요구
		String loginWrite=req.getParameter("loginwrite");
		try {
			if(loginWrite.equals("1")) {
				mav.addObject("Loginmodal", "toLogin");
			}
		}catch(NullPointerException e) {
			System.out.println("Null");
		}
		//작성자 뿌리기 by seqno
		String writer=bbsListDao.getWriter(bbsDetail.getUser_no());
		mav.addObject("WRITER",writer);
		//조회수 증가 
		writeDao.addHit(seqno);
		
		//댓글 및 대댓글 갯수 정하는 메서드 구현
		mav.addObject("REPNUM",repDao.getRepList(seqno).size());
		repDao.getRereNum(seqno); // 게시글을 통해 모든 대댓글 갯수
		mav.addObject("RERENUM",repDao.getRereNum(seqno));
		
		//이전글 다음글 없는 경우 처리
		try {
			if (nopage == null) {
				nopage = "";
			} else if (nopage.contentEquals("1")) {
				mav.addObject("NOPAGE", "next");
			} else if (nopage.contentEquals("0")) {
				mav.addObject("NOPAGE", "previous");
			}
		}catch(Exception e) {
			
		}
		//종료
		String body="bbs/bbscont";
		mav.addObject("BODY",body);
		mav.addObject(new Reply()); //리플객체 주입
		return mav;
	}
	@ResponseBody
	@RequestMapping(value = "/bbs/delbbsvalid.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public int delBbs(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("bbs/delbbsValid 수신");
		int result=0; // 결과값 보낼 int
		String seqno=request.getParameter("seqno"); //받아온 댓글번 String
		Integer seqnoInt=Integer.parseInt(seqno); //검색을 위한 parsing
		System.out.println("받아온 seqno : "+seqnoInt);
		
		//분기 1 - 비로그인 상태
		String id=(String)session.getAttribute("loginUser"); //세션정보
		if(id==null) {
			return 2;
		}
		Bbs bbs=bbsListDao.getBbsDetail(seqnoInt);
		String writerId=bbsListDao.getId(bbs.getUser_no());
		System.out.println("Session Id : "+id+"   writer : "+writerId);
		if(!id.contentEquals(writerId)) { //분기 2 - 로그인상태이지만 작성자와 일치하지않는 경우
			return result; //0
		}else if(id.contentEquals(writerId)) {  // 분기 3 - 전부 일치
			System.out.println("일치분기");
			bbsListDao.deleteBbs(seqnoInt);
			return 1;
		}
		return result; //0
	}
	@ResponseBody
	@RequestMapping(value = "/bbs/bbsmodvalid.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public int modBbs(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("bbs/bbsmodValid 수신");
		int result=0; // 결과값 보낼 int
		String bbstype=request.getParameter("bbstype");
		String seqno=request.getParameter("seqno"); //받아온 댓글번 String
		Integer seqnoInt=Integer.parseInt(seqno); //검색을 위한 parsing
		System.out.println("받아온 seqno : "+seqnoInt+" 받아온 bbstype : "+bbstype);
		
		//분기 1 - 비로그인 상태
		String id=(String)session.getAttribute("loginUser"); //세션정보
		if(id==null) {
			return 2;
		}
		Bbs bbs=bbsListDao.getBbsDetail(seqnoInt);
		String writerId=bbsListDao.getId(bbs.getUser_no());
		System.out.println("Session Id : "+id+"   writer : "+writerId);
		if(!id.contentEquals(writerId)) { //분기 2 - 로그인상태이지만 작성자와 일치하지않는 경우
			return result; //0
		}else if(id.contentEquals(writerId)) {  // 분기 3 - 전부 일치
			System.out.println("일치분기");
			return 1;
		}
		return result; //0
	}

	@RequestMapping(value="/bbs/bbsupd.html")
	public ModelAndView updateBbs(HttpSession session,HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("menu_header");
		System.out.println("bbs/bbsupd.html 수신");
		String seqno=request.getParameter("seqno");
		String bbstype=request.getParameter("bbstype");
		Integer seqnoInt=Integer.parseInt(seqno);
		Bbs bbs=bbsListDao.getBbsDetail(seqnoInt);
		mav.addObject(bbs);
		mav.addObject("UPDATE",1);
		mav.addObject("BODY","bbs/postbbs"); // postbbs에 Bbs 빈 주입
		mav.addObject("bbsType",bbstype);
		return mav;
	}
	
	@RequestMapping(value="/bbs/bbsupdimpl.html")
	public ModelAndView updateBbsImpl(@Valid Bbs bbs, BindingResult bindingResult, HttpSession session, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("menu_header");
		System.out.println("bbs/Updateimpl.html 수신");
		String seqno=request.getParameter("seqno");
		Integer seqnoInt=Integer.parseInt(seqno);
		if (bindingResult.hasErrors()) { // bidingError
			System.out.println("inputBBs / bindingErrors");
			mav.addObject("BODY", "bbs/postbbs"); // 에러메시지 객체를 postbbs에 송신
			mav.getModel().putAll(bindingResult.getModel()); // 그러기 위한 객체
			return mav;
		} // 컨트롤러에서 insert해야 하는 부분 : / bbsType, user_no / form form 으로 알아서 insert된 부분 : title content 
		bbsListDao.updateBbs(bbs);
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+seqnoInt);
	}
	@RequestMapping(value="/bbs/prepost.html")
	public ModelAndView prePost(String seqno,String bbstype) { //해당 게시판에 속하는 게시글들을 리스트업하고 seqno를 바탕으로 하나
		System.out.println("bbs/prepost 수신 / seqno = "+seqno+ " bbstype : "+bbstype);
		Integer seqnoInt=Integer.parseInt(seqno);
		Bbs bbs=bbsListDao.getBbsDetail(seqnoInt);
		Integer stdRownum=bbsListDao.getRownum(bbs);
		Integer rownum=stdRownum-1;
		bbs.setRn(rownum);
		Integer preSeqno=0;
		try {
			preSeqno=bbsListDao.getSeqnoByRownum(bbs);
			if(preSeqno==null) {
				preSeqno=seqnoInt;
				System.out.println("다음 seqno가 없으므로 현재 페이즈의 seqno를 출력합니다. "+seqnoInt);
				return new ModelAndView("redirect:/bbs/bbsview.html?nopage=0&seqno=" + seqnoInt);
			}
		}catch(Exception e) {
			System.out.println("No more previous Page");
		}
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+preSeqno);
	}
	@RequestMapping(value="/bbs/nextpost.html")
	public ModelAndView nextPost(String seqno) {
		System.out.println("bbs/nextpost 수신 / seqno = "+seqno);
		Integer seqnoInt=Integer.parseInt(seqno);
		Bbs bbs=bbsListDao.getBbsDetail(seqnoInt);
		Integer stdRownum=bbsListDao.getRownum(bbs);
		System.out.println("호출한 게시글의 Rown : "+stdRownum);
		Integer rownum=stdRownum+1;
		bbs.setRn(rownum);
		Integer nextSeqno=0;
		try {
			nextSeqno=bbsListDao.getSeqnoByRownum(bbs);
			if(nextSeqno==null) {
				nextSeqno=seqnoInt;
				System.out.println("다음 seqno가 없으므로 현재 페이즈의 seqno를 출력합니다. "+seqnoInt);
				return new ModelAndView("redirect:/bbs/bbsview.html?nopage=1&seqno=" + seqnoInt);
			}
		} catch (Exception e) {
			System.out.println("No more nextPage");
		}
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+nextSeqno);
	}
	@ResponseBody
	@RequestMapping(value = "/bbs/like.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public int likeBbs(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("bbs/like 수신");
		int result=0; // 결과값 보낼 int
		String seqno=request.getParameter("seqno"); //받아온 댓글번 String
		Integer seqnoInt=Integer.parseInt(seqno); //검색을 위한 parsing
		System.out.println("받아온 seqno : "+seqnoInt);
		String args=request.getParameter("args");
		System.out.println("받아온 추천 / 반대 여부 : "+args);
		//분기 1 - 비로그인 상태
		String id=(String)session.getAttribute("loginUser"); //세션정보
		if(id==null) {
			return 2; // 둘다 안됨
		}
		Bbs bbs=bbsListDao.getBbsDetail(seqnoInt);
		String writerId=bbsListDao.getId(bbs.getUser_no());
		System.out.println("Session Id : "+id+"   writer : "+writerId);
		//분기 2 - 작성자 본인이 아니면 추천/반대 가능
		Integer prePoint=bbs.getPoint();
		
		if(!id.contentEquals(writerId)) { 
			System.out.println("불일치로 오기는 하냐?");
			if(args.contentEquals("like")) {
				System.out.println("추천분기");
				bbs.setPoint(prePoint+1);
				bbsListDao.like(bbs);
			}else if(args.contentEquals("dislike")) {
				System.out.println("반대분기");
				bbs.setPoint(prePoint-1);
				bbsListDao.like(bbs);
			}
			System.out.println("추천/반대 한 후 포인트 : "+bbs.getPoint());
			return 1; //0
		}else if(id.contentEquals(writerId)) {  // 분기 3 - 전부 일치
			System.out.println("일치분기");
			return 0; 
		}
		return result; //0
	}
}