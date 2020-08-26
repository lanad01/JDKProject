package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Reply;

@Controller
public class ReplyController {
	@RequestMapping(value="/reply/reply.html")
	public ModelAndView replyPost(Reply rep, HttpSession session, HttpServletRequest request) {
		//컨트롤러 set 목록 : user_no, seqno, content
		//Dao set 목록 : register_Date, repno, repgroupno
		System.out.println("reply/reply수신");
		ModelAndView mav=new ModelAndView("menu_header");
		System.out.println(rep.getContent());
		String body="bbs/bbscont";
		mav.addObject("BODY",body);
		return mav;
	}
}
