package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class ChatController {
	@Autowired
	UserDao userDao;
	@RequestMapping(value="/chat/chat.html")
	public ModelAndView chat(HttpSession session,HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView("chat"); 
		String id=(String) session.getAttribute("loginUser");
		if(id==null) { //로그인 중이 아니라면
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			String str = "";
			str = str + "<script type='text/javascript'>";
			str = str + "alert('로그인이 필요합니다');";
			str = str + "window.close();";
			str = str + "</script>";
			out.print(str);
			///popup창을 닫는다. 끝
		} //로그인 상태라면 정보를 가져온다
		mav.addObject("ID",id);
		User user=userDao.findByUserId(id);
		mav.addObject("USER",user);
		return mav;
		
	}
	@ResponseBody
	@RequestMapping(value = "/chat/chatid.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public String senderPicture_url(HttpServletRequest request) throws Exception {
		System.out.println("chat/chatId 수신?");
		String sender=request.getParameter("sender");
		System.out.println("Sender는 수신? " +sender);
		User user=userDao.findByUserId(sender);
		try {
			String picture_url=user.getPicture_url();
			System.out.println("그림이 없다");
			if(picture_url==null || picture_url.isEmpty()) {
				picture_url="noprofile.gif";
			}
			return picture_url; 
		}catch(NullPointerException e) {
			
		}
		return null;
		//0
	}
	
	@RequestMapping(value="/chat/chat2.html")
	public ModelAndView chat2(HttpSession session) {
		
		ModelAndView mav=new ModelAndView("chat2");
		
		return mav;
		
	}
}
