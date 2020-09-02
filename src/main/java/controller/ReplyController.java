package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.RepDao;
import dao.WriteDao;
import model.Reply;

@Controller
public class ReplyController {
	@Autowired
	WriteDao writeDao;
	@Autowired
	RepDao repDao;
	@RequestMapping(value="/reply/rerep.html")
	public ModelAndView rerepPost(Reply rep, HttpSession session, HttpServletRequest request,Integer seqno,Integer repgroupno,Integer repno) {
		ModelAndView mav=new ModelAndView("bbs/rereList");
		System.out.println("#################### /reply/rerep.html 수신 #######################");

		//우선 repno가 같은 모든 대댓글을 출력
		List<Reply> rereList=repDao.getRereList(repno); //rep를 통해서 대댓글리스트 생성
		
		//대댓글 작성자 아이디를 얻기 위한 로직 
		for( int t = 0; t < rereList.size(); t++){ //대댓글리스트를 통해서 얻어오기
			String rereplier=repDao.getReplier(rereList.get(t).getUser_no());
			System.out.println("----------------여기서부터는 rereList----------------------");
			mav.addObject("REREPLIER",rereplier);
		}
		mav.addObject("RERELIST",rereList);
			
		return mav;
	}
	
	@RequestMapping(value="/reply/replylist.html")
	public ModelAndView replyPost2(Reply rep, HttpSession session, HttpServletRequest request,Integer seqno) { //bbscont에서 보내주는 게시판 seqno정보
		// 우선 받아온 seqno를 토대로 rpList를 만들어보자
		ModelAndView mav=new ModelAndView("bbs/reList");
		System.out.println("#################### /reply/replyList.html 수신 #######################");
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
		}
		mav.addObject(new Reply());
		mav.addObject("REPLIERPIC",replierPicUrl);
		mav.addObject("REPLIERLIST",replierList);
		mav.addObject("REP",rpList);
		return mav;
	}
	@RequestMapping(value="/reply/reply.html") //replypost
	public ModelAndView replyPost(Reply rep, HttpSession session, HttpServletRequest request,Integer seqno,Integer repgroupno,Integer repno) { //bbscont에서 보내주는 게시판 seqno정보
		ModelAndView mav=new ModelAndView("menu_header");
		//컨트롤러 set 목록 : user_no, seqno, content
		//Dao set 목록 : repno, register_Date, repgroupno(원댓글일 경우 gropuno는 0) // 대댓글 버튼을 통한 댓글추가일 경우에는 repno를 유지시키면서 repgroupno만을 증가시키는 로직
		System.out.println("----------------------reply/reply수신---------------------------");
		System.out.println(" 댓글 내용 : "+ rep.getContent());
		//과연
		String id=(String)session.getAttribute("loginUser");
		Integer user_no=writeDao.getWriter(id);
		String repType="";
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
			repType="원댓글";
		}else if(repgroupno != 0) { // 대댓글 처리 , jsp에서는 repgroupno==1로 보낼거야 
			System.out.println("대댓글추가");
			//이 때, 원댓글 추가가 아닌 댓글 추가시 대댓글 형식으로 시작 / repno는 대댓글 버튼을 가진 해당 리플에서 가져와야함 
			rep.setRepno(repno); // 대댓글이니까 속하는 곳은 부모댓글인 repno
			System.out.println("reply/reply 대댓글 repno :"+repno);
//			rep.setRepgroupno(repgroupno); 여기서 다시 repgroupno가 하나씩 더해지는거야
			rep.setContent(rep.getContent());
			rep.setUser_no(user_no);
			rep.setSeqno(seqno); //속한 게시글은 댓글과 함께 가두 좋다
			repDao.entryRep(rep);
			repType="대댓글";
		}
		return new ModelAndView("redirect:/bbs/bbsview.html?seqno="+seqno);
	}
}
