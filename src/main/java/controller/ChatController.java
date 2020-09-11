package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
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
	@RequestMapping(value="/chat/chat2.html")
	public ModelAndView chat2(HttpSession session) {
		
		ModelAndView mav=new ModelAndView("chat2");
		
		return mav;
		
	}
}
