package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	@RequestMapping(value="/chat/chat.html")
	public ModelAndView chat() {
		ModelAndView mav=new ModelAndView("chat"); 
		return mav;
		
	}
	@RequestMapping(value="/chat/chat2.html")
	public ModelAndView chat2() {
		ModelAndView mav=new ModelAndView("chat2"); 
		return mav;
		
	}
}
