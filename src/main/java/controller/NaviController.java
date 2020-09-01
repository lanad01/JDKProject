package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BBSListDao;
import model.Bbs;

@Controller
public class NaviController {
	@Autowired
	BBSListDao bbsListDao;
	@ResponseBody
	@RequestMapping(value = "/navi/hit.html", method = RequestMethod.POST, produces = "application/json")
	public List<Bbs> naviBBSList(HttpSession session,String input) throws Exception {
		System.out.println("값은 수신하고 있니? "+input);
		
		if(input=="hit") {
//			List<Bbs> list=bbsListDao.
		}else if(input=="rep") {
			
		}
		
		
		return null;
	}

}
