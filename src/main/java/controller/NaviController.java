package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping(value = "/navi/hit.html", method = RequestMethod.POST, produces ="application/json; charset=UTF-8")
	public List<Bbs> naviBBSList(HttpSession session,HttpServletRequest request) throws Exception {
		String input=request.getParameter("input");
		System.out.println("값은 수신하고 있니? "+input);
		if(input==null) {
			input="hit";
		}
		List<Bbs> list=new ArrayList<Bbs>();
		if(input.equals("hit")) {
			System.out.println("hit로 수신");
			list=bbsListDao.getTop10ByHit();
			for(int i=0; i<list.size(); i++) {
			System.out.println(i+"번 째 리스트의 타이틀"+list.get(i).getTitle());
			System.out.println(i+"번 째 리스트의 seqno"+list.get(i).getSeqno());
			}
			return list;
		}else if(input.equals("rep")) {
			System.out.println("rep로 수신");
			list=bbsListDao.getTop10ByRep();
			for(int i=0; i<list.size(); i++) {
				System.out.println(i+"번 째 리스트의 타이틀"+list.get(i).getTitle());
				System.out.println(i+"번 째 리스트의 seqno"+list.get(i).getSeqno());
			}
			return list;
		}
		return list;
	}
	
	
	
	
	
}
