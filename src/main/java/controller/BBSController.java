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
												  // 여기서 리뷰도 리스트로 받아오자. 결국 bbscont뿌리는건 얘잖아.
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
		
		//ReplyList 뽑아내고 보낸다
		List<Reply> rpList=repDao.getRepList(seqno); //seqno는 jsp에서 파라미터로 보내준다. ${seqno}말이다
		mav.addObject("REP",rpList);
		System.out.println("---------------Reple List를 얻은 후의 테스트 --------------------");
		System.out.println("seqno가 "+seqno+"인 글의 댓글 갯수는 "+rpList.size());
		//댓글 작성자 아이디를 얻기 위한 로직 
		for( int i = 0; i < rpList.size(); i++){
			String replier=repDao.getReplier(rpList.get(i).getUser_no());
			System.out.println("Replier 반복자:"+replier);
			mav.addObject("REPLIER",replier);
			Integer repno=rpList.get(i).getRepno(); // 반복을 통해서 댓글리스트에 있는 각 댓글들의 repno를 얻어옴
			System.out.println("rpList를 통한  repno 수신 : "+ repno);
			List<Reply> rereList=repDao.getRereList(rpList.get(i).getRepno()); //rep를 통해서 대댓글리스트 생성
			System.out.println(" 댓글 "+repno+"의 대댓글리스트는   :  "+rereList);
			
			//대댓글 작성자 아이디를 얻기 위한 로직 
			for( int t = 0; t < rereList.size(); t++){ //대댓글리스트를 통해서 얻어오기
				String rereplier=repDao.getReplier(rereList.get(t).getUser_no());
				System.out.println("----------------여기서부터는 rereList----------------------");
				System.out.println("대댓글 작성자 반복자:"+rereplier);
				System.out.println("rereList 반복하면서 Repno 여긴 똑같이 나와야한다."+rereList.get(t).getRepno());
				mav.addObject("REREPLIER",rereplier);
			}
			mav.addObject("RERELIST",rereList);
		}
		String body="bbs/bbscont";
		mav.addObject("BODY",body);
		mav.addObject(new Reply()); //리플객체 주입
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null)
			ip = req.getRemoteAddr();
		mav.addObject("clientIP",ip);
		return mav;
	}
}



