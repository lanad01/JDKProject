package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.Bbs;
import model.User;

@Controller
public class ChatController {
	@Autowired
	UserDao userDao;
	@RequestMapping(value="/chat/chat.html")
	public ModelAndView chat(HttpSession session) {
		ModelAndView mav=new ModelAndView("chat"); 
		String id=(String) session.getAttribute("loginUser");
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
		String picture_url=user.getPicture_url();
		System.out.println(picture_url);
		return picture_url; //0
	}
	
	@RequestMapping(value="/chat/chat2.html")
	public ModelAndView chat2(HttpSession session) {
		
		ModelAndView mav=new ModelAndView("chat2");
		
		return mav;
		
	}
}
