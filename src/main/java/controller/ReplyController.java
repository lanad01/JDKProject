package controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.RepDao;
import dao.UserDao;
import dao.WriteDao;
import model.Reply;

@Controller
public class ReplyController {
	@Autowired
	WriteDao writeDao;
	@Autowired
	RepDao repDao;
	@Autowired
	UserDao userDao;
	@RequestMapping(value="/reply/rerep.html")
	public ModelAndView rerepPost(Reply rep, HttpSession session, HttpServletRequest request,Integer seqno,Integer repgroupno,Integer repno) {
		ModelAndView mav=new ModelAndView("bbs/rereList");

		//우선 repno가 같은 모든 대댓글을 출력
		List<Reply> rereList=repDao.getRereList(repno); //rep를 통해서 대댓글리스트 생성
		List<String> rereplierPic=new ArrayList<String>();
		List<String> rereplierName=new ArrayList<String>();
		//대댓글 작성자 아이디를 얻기 위한 로직 
		for( int t = 0; t < rereList.size(); t++){ //대댓글리스트를 통해서 얻어오기
			String rereplier=repDao.getReplier(rereList.get(t).getUser_no());
			String pictureUrl=repDao.getPicture(rereList.get(t).getUser_no());
			rereplierPic.add(pictureUrl);
			rereplierName.add(rereplier);
		}
		mav.addObject("REREPLIER",rereplierName);
		mav.addObject("RERELIST",rereList);
		mav.addObject("REREPIC",rereplierPic);
		return mav;
	}
	
	@RequestMapping(value="/reply/replylist.html")
	public ModelAndView replyPost2(Reply rep, HttpSession session, HttpServletRequest request,Integer seqno) { //bbscont에서 보내주는 게시판 seqno정보
		// 우선 받아온 seqno를 토대로 rpList를 만들어보자
		ModelAndView mav=new ModelAndView("bbs/reList");
		//받아온 seqno를 가진 게시글의 모든 댓글목록을 가져온다
		List<Reply> rpList=repDao.getRepList(seqno); //seqno는 jsp에서 파라미터로 보내준다. ${seqno}말이다
		if(rpList.size()==0) {
			mav.addObject("NOCOM",rpList.size());
		}
		//댓글 작성자 아이디를 얻기 위한 로직 
		ArrayList<String> replierList=new ArrayList<String>();
		List<String> replierPicUrl=new ArrayList<String>();
		for( int i = 0; i < rpList.size(); i++){
			String replier=repDao.getReplier(rpList.get(i).getUser_no());
			String pictureUrl=repDao.getPicture(rpList.get(i).getUser_no());
			replierList.add(replier);
			replierPicUrl.add(pictureUrl);
			System.out.println(rpList.get(i).getContent());
		}
		mav.addObject(new Reply());
		mav.addObject("REPLIERPIC",replierPicUrl);
		mav.addObject("REPLIERLIST",replierList);
		mav.addObject("REP",rpList);
		return mav;
	}
	@RequestMapping(value="/reply/reply.html") //replypost
	public ModelAndView replyPost(Reply rep, HttpSession session, HttpServletRequest request,Integer seqno,Integer repgroupno,Integer repno) { //bbscont에서 보내주는 게시판 seqno정보
		//컨트롤러 set 목록 : user_no, seqno, content
		//Dao set 목록 : repno, register_Date, repgroupno(원댓글일 경우 gropuno는 0) // 대댓글 버튼을 통한 댓글추가일 경우에는 repno를 유지시키면서 repgroupno만을 증가시키는 로직
		System.out.println("----------------------reply/reply수신---------------------------");
		System.out.println(" 댓글 내용 : "+ rep.getContent());
		//과연
		String id=(String)session.getAttribute("loginUser");
		Integer user_no=writeDao.getWriter(id);
		if(repgroupno == 0) {
			System.out.println("원댓글 추가");
			rep.setRepgroupno(repgroupno); //원댓글 추가를 통한 댓글 추가 시 원댓글만 추가 
			rep.setContent(rep.getContent()); // 게시글 내용
			rep.setUser_no(user_no); //유저번호로 다시 원댓글의 user_no를 결정??아니야 유저번호는 유지되고 있어 
			rep.setSeqno(seqno); //게시글번호
//			Integer repno=repDao.getMaxRepNo(); repno를 여기서 추가하면안대
//			System.out.println("reply/reply repno : "+repno); //여기가 핵심 . 원댓글 이므로 
//			rep.setRepno(repno);
			repDao.entryRep(rep); //insert
		}else if(repgroupno != 0) { // 대댓글 처리 , jsp에서는 repgroupno==1로 보낼거야 
			System.out.println("대댓글추가");
			//이 때, 원댓글 추가가 아닌 댓글 추가시 대댓글 형식으로 시작 / repno는 대댓글 버튼을 가진 해당 리플에서 가져와야함 
			rep.setRepno(repno); // 대댓글이니까 속하는 곳은 부모댓글인 repno
			System.out.println("reply/reply 대댓글 repno :"+repno);
//			rep.setRepgroupno(repgroupno); 여기서 다시 repgroupno가 하나씩 더해지는거야
			System.out.println(repgroupno);
			rep.setContent(rep.getContent());
			rep.setUser_no(user_no);
			rep.setSeqno(seqno); //속한 게시글은 댓글과 함께 가두 좋다
			repDao.entryRep(rep);
		}
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+seqno);
	}
	@ResponseBody
	@RequestMapping(value = "/reply/del.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public int delRep(HttpSession session,HttpServletRequest request) throws Exception {
		int result=0; // 결과값 보낼 int
		String repno=request.getParameter("repno"); //받아온 댓글번 String
		Integer repnoInt=Integer.parseInt(repno); //검색을 위한 parsing
		System.out.println("reply/del.html 수신된 repno : "+repno);
		//분기 1 - 비로그인 상태
		String id=(String)session.getAttribute("loginUser"); //세션정보
		if(id==null) {
			return 2;
		}
		//분기 2 - 로그인상태이지만 작성자와 일치하지않는 경우
		if(!id.contentEquals(repDao.getReplierByRepno(repnoInt))) { //해당 repno의 Replier를 수신하고 세션id와 불일치하는지 확인
			System.out.println("세션 id "+id);
			System.out.println("DB에서 얻어온 repno를 통한 작성자이름 :"+repDao.getReplierByRepno(repnoInt));
			return result;
		}else if(id.contentEquals(repDao.getReplierByRepno(repnoInt))){ //분기 3- 일치하는 경우
			System.out.println("일치분기");
			repDao.deleteRep(repnoInt);
			result=1;
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/reply/modi.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public int reValid(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("reply/modi 수신");
		int result=0;
		String repno=request.getParameter("repno"); //받아온 댓글번 String
		Integer repnoInt=Integer.parseInt(repno); //검색을 위한 parsing
		String id=(String)session.getAttribute("loginUser"); //세션정보
		if(id==null) {
			return 2;
		}
		// 분기 2 - 로그인상태이지만 작성자와 일치하지않는 경우
		if (!id.contentEquals(repDao.getReplierByRepno(repnoInt))) { // 해당 repno의 Replier를 수신하고 세션id와 불일치하는지 확인
			System.out.println("세션 id " + id);
			System.out.println("DB에서 얻어온 repno를 통한 작성자이름 :" + repDao.getReplierByRepno(repnoInt));
			return result;
		} else if (id.contentEquals(repDao.getReplierByRepno(repnoInt))) { // 분기 3- 일치하는 경우
			System.out.println("일치분기");
			
			result = 1;
		}
		return result;
	}
	@RequestMapping(value = "/reply/rpUpd.html", method = RequestMethod.POST)
	public ModelAndView repUP(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("reply/rpUpd 수신");
		String newCon=request.getParameter("content");
		String repno=request.getParameter("repno");
		String seqno=request.getParameter("seqno");
		Integer repnoInt=Integer.parseInt(repno);
		Integer seqnoInt=Integer.parseInt(seqno);
		System.out.println("content:  "+newCon+" // repno : "+repno+" // seqno : "+seqno);
		//우선 댓글 객체 검색하자
		Reply rep=repDao.getRep(repnoInt);
		rep.setContent(newCon);
		repDao.updateRep(rep);
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+seqnoInt);
	}
	@ResponseBody
	@RequestMapping(value = "/reply/rerevalid.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public int rereValid(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("reply/rerevalid 수신");
		int result=0;
		String repno=request.getParameter("repno"); //받아온 댓글번 String
		String repgroupno=request.getParameter("repgroupno");
		Integer groupnoInt=Integer.parseInt(repgroupno);
		Integer repnoInt=Integer.parseInt(repno); //검색을 위한 parsing
		String id=(String)session.getAttribute("loginUser"); //세션정보
		if(id==null) {
			return 2; //로그인 요구 페이지
		}
		// 분기 2 - 로그인상태이지만 작성자와 일치하지않는 경우
		List<Reply> list=repDao.getRereList(repnoInt); //먼저 해당 repno을 가진 모든 대댓글(repgroupno!=0)
		Reply rereply = null;
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getRepgroupno()==groupnoInt) { //대댓글리스트들 하나하나 돌리면서 만약 얻어온 groupNo와 일치하는 것이 있다면
				rereply=list.get(i);
				System.out.println("대댓글의 유저넘버 : "+rereply.getUser_no());
			}else {
				System.out.println("repgroupno불일치 --"+i+"번째 대댓글의 그룹No : "+list.get(i).getRepgroupno()+"이며, 게시글에서 넘어온 GroupNo :" + groupnoInt);
			}
		}
		String rereId=repDao.getRereplierByRere(rereply);
		System.out.println(rereId);
		
		if(!id.contentEquals(rereId)){ //검색된 대댓글의 작성자id와 세션정보가 불일치?
			System.out.println("대댓글작성자이름 : "+rereId+" Current Id:" +id);
			
			return result;
		}else if (id.contentEquals(rereId)) { // 분기 3- 일치하는 경우
			System.out.println("대댓글작성자이름 : "+rereId+" Current Id:" +id);
			System.out.println("일치분기");
			
			result = 1;
		}
		return result;
	}
	@RequestMapping(value = "/reply/rereUpd.html", method = RequestMethod.POST)
	public ModelAndView rereUP(HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("reply/rereUpd 수신");
		String newCon=request.getParameter("content");
		String repno=request.getParameter("repno");
		String seqno=request.getParameter("seqno");
		String repgroupno=request.getParameter("repgroupno");
		Integer groupnoInt=Integer.parseInt(repgroupno);
		Integer repnoInt=Integer.parseInt(repno);
		Integer seqnoInt=Integer.parseInt(seqno);
		System.out.println("content:  "+newCon+" // repno : "+repno+" // seqno : "+seqno);
		//우선 댓글 객체 검색하자
		Reply rereply=null;
		List<Reply> list=repDao.getRereList(repnoInt); // repno로 모든 대댓글 
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getRepgroupno()==groupnoInt) { //대댓글리스트들 하나하나 돌리면서 만약 얻어온 groupNo와 일치하는 것이 있다면
				rereply=list.get(i);
			}else {
				System.out.println("repgroupno불일치 --"+i+"번째 대댓글의 그룹No : "+list.get(i).getRepgroupno()+"이며, 게시글에서 넘어온 GroupNo :" + groupnoInt);
			}
		}
		System.out.println("rerepl의 내용 잘 들어있는지 확인"+rereply.getContent()+" // "+rereply.getRepgroupno()+" // "+rereply.getUser_no()+" // ");
		rereply.setContent(newCon);
		repDao.updateRere(rereply);
		System.out.println("대댓글 업데이트 결과 확인  "+rereply.getContent());
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+seqnoInt);
	}
	@ResponseBody
	@RequestMapping(value = "/reply/reredel.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public int delRere(HttpSession session,HttpServletRequest request) throws Exception {
		int result=0; // 결과값 보낼 int
		String repno=request.getParameter("repno"); //받아온 댓글번 String
		String groupno=request.getParameter("repgroupno");
		Integer groupnoInt=Integer.parseInt(groupno);
		Integer repnoInt=Integer.parseInt(repno); //검색을 위한 parsing
		System.out.println("reply/reredel.html 수신된 repno : "+repno +"  groupno : "+groupnoInt);
		//분기 1 - 비로그인 상태
		String id=(String)session.getAttribute("loginUser"); //세션정보
		if(id==null) {
			return 2;
		}
		Reply rereply=null;
		List<Reply> list=repDao.getRereList(repnoInt); // repno로 모든 대댓글 
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getRepgroupno()==groupnoInt) { //대댓글리스트들 하나하나 돌리면서 만약 얻어온 groupNo와 일치하는 것이 있다면
				rereply=list.get(i); 
			}else {
				System.out.println("repgroupno불일치 --"+i+"번째 대댓글의 그룹No : "+list.get(i).getRepgroupno()+"이며, 게시글에서 넘어온 GroupNo :" + groupnoInt);
			}
		}
		String writerId=repDao.getRereplierByRere(rereply);
		System.out.println("Session Id : "+id+"   writer : "+writerId);
		if(!id.contentEquals(writerId)) { //분기 2 - 로그인상태이지만 작성자와 일치하지않는 경우
			return result; //0
		}else if(id.contentEquals(writerId)) {  // 분기 3 - 전부 일치
			System.out.println("일치분기");
			repDao.deleteRere(rereply);
			result=1;
			return result;
		}
		return result; //0
	}
}
