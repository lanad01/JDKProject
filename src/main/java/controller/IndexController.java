package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ItemDao;
import model.Item;
import model.User;
@Controller
public class IndexController {
	@Autowired //자동주입
	//원래의 경우라면 의존성 주입을 위해 환경설정에서 bean설정을 해주어야한다
	// 생성자나 세터 등을 사용하여 의존성 주입을 하려고 할 때, 해당 빈을 찾아서 주입해주는 annotation이다. 
	// p: 을 잡아줄 필요가 없다.
	//required 값을 ture나 false로 줄 수 있다.  @Autowired or @Autowired(required = true)
	//true인 경우는 의존성주입에 필요한 객체가 무조건 bean으로 등록되어있어야한다.
	//false인 경우는 예를 들어, setter의 파라미터가 주입 되어야되는 경우, bean등록이 안되어 있어도, 오류가 나지않고 인스턴스는 만들어준다.
	//@Autowired(required = false) default값은 true이다.
	private ItemDao itemDao;
	public void setItemDao(ItemDao itemDao) { // DB접속을 위한 DAO객체 선언 및 Setter 
		this.itemDao = itemDao;
	}
	@RequestMapping
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response,HttpSession session)throws Exception {
		//임마는 콜백 메소드야 자동호출 됨 
		//ModelAndView 형태로 서블릿으로 보낸다. 국룰이다.
		//MV에 저장하는 방법이 몇 가지 있다.
		// 1. 작업의 결과를 Map에 담고, Map을 ModelAndView에 담는다. [ 자료가 多할 시]
		// 2. 작업의 결과를 직접 ModelAndView에 담는다
		List<Item> itemList=this.itemDao.findAll();
		ModelAndView mav=new ModelAndView();
		//1번 방법으로 작업의 결과를 넘겨주기 위해서는, 데이터 개수가 많아야한다.
		//연수원 프로젝트에서는 힘들다. 
		//그러나 1번 방법 연습을 위해서라도 데이터 개수가 적더라도 시도해보고자 합니다.
		// 당분간은 1번 방법으로 데이터를 DispatcherServlet으로 넘깁니다.
		Map<String,Object> map=new HashMap<String,Object>();
		User loginUser=(User)session.getAttribute("USER_KEY");
		if(loginUser !=null) { //로그인상태를 의미한다
			mav.addObject("loginUser",loginUser);
		} // 세션을 유지시켜야 계속 로그아웃되는 상황을 없앨 수 있다.
		map.put("list", itemList); //작업의 결과를 맵에 저장
		mav.addAllObjects(map);//맵을 ModelAndView에 저장
//		mav.setViewName("index"); //파일경로 삭제 이유 : viewResolver를 사용하면 뷰(jsp)값만 넣어주면 된다
		//클라이언트의 요청을 처리하고 , view의 이름을 리턴.
		return mav;
		
	}
	
}
