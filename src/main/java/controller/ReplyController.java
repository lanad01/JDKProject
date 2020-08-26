package controller;

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
	@RequestMapping(value="/reply/replyview.html")
	public ModelAndView replyView(Reply rep, HttpSession session, HttpServletRequest request,Integer repno) {
		System.out.println("reply/replyView 수신");
		ModelAndView mav=new ModelAndView("bbs/rereList");
		System.out.println("reply/replyview repno : "+repno);
		return mav;
	}
	@RequestMapping(value="/reply/reply.html")
	public ModelAndView replyPost(Reply rep, HttpSession session, HttpServletRequest request,Integer seqno,Integer repgroupno,Integer repno) { //bbscont에서 보내주는 게시판 seqno정보
		ModelAndView mav=new ModelAndView("menu_header");
		//컨트롤러 set 목록 : user_no, seqno, content
		//Dao set 목록 : repno, register_Date, repgroupno(원댓글일 경우 gropuno는 0) // 대댓글 버튼을 통한 댓글추가일 경우에는 repno를 유지시키면서 repgroupno만을 증가시키는 로직
		System.out.println("reply/reply수신");
		System.out.println("reply/reply.html seqno 수신 : "+seqno);
		System.out.println("reply/reply.html repgroupno 수신 : "+repgroupno);
		System.out.println(rep.getContent());
		String id=(String)session.getAttribute("loginUser");
		System.out.println("reply/reply user 로그인"+id);
		Integer user_no=writeDao.getWriter(id);
		System.out.println("reply/reply 최종 login user_no :"+user_no);
		String repType="";
		if(repgroupno == 0) {
			System.out.println("원댓글 추가");
			rep.setRepgroupno(repgroupno); //원댓글 추가를 통한 댓글 추가 시 원댓글만 추가 
			rep.setContent(rep.getContent()); // 게시글 내용
			rep.setUser_no(user_no); //유저번호
			rep.setSeqno(seqno); //게시글번호
//			Integer repno=repDao.getMaxRepNo(); repno를 여기서 추가하면안대
//			System.out.println("reply/reply repno : "+repno); //여기가 핵심 . 원댓글 이므로 
//			rep.setRepno(repno);
			repDao.entryRep(rep); //insert
		}else if(repgroupno != 0) { // 대댓글 처리 , jsp에서는 repgroupno==1로 보낼거야 
			System.out.println("대댓글추가");
			//이 때, 원댓글 추가가 아닌 댓글 추가시 대댓글 형식으로 시작 / repno는 대댓글 버튼을 가진 해당 리플에서 가져와야함 
			rep.setRepno(repno); // 대댓글이니까 속하는 곳은 부모댓글인 repno
//			rep.setRepgroupno(repgroupno); 여기서 다시 repgroupno가 하나씩 더해지는거야
			rep.setContent(rep.getContent());
			rep.setUser_no(user_no);
			rep.setSeqno(seqno); //속한 게시글은 댓글과 함께 가두 좋다
			repDao.entryReRep(rep);
			repType="대댓글";
		}
		System.out.println("최종 content: "+rep.getContent());
		System.out.println("최종 groupno: "+rep.getRepgroupno());
		System.out.println("최종 repno: "+rep.getRepno());
		System.out.println("최종 댓글 타입 : "+repType);
		String body="bbs/bbscont";
		mav.addObject("BODY",body);
		return mav;
	}
}
