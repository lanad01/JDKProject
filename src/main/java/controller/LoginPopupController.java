package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class LoginPopupController {
	@RequestMapping(value="/loginpopup/loginpopup.html") // sign.in
	public ModelAndView loginPopup(HttpSession session) {
//		ModelAndView mav=new ModelAndView("loginpopup/loginpopup");
		ModelAndView mav=new ModelAndView("gridBBS/test");
		return mav;
	}
}
