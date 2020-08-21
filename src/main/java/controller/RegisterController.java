package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.UserDao;
import model.User;

@Controller
public class RegisterController {
	// DB에 User를 삽입
	@Autowired
	private UserDao userDao;
	@RequestMapping(value = "/register/registerpost.html")
	public ModelAndView entryUser(@Valid User user, BindingResult bindingResult, HttpSession session,
			HttpServletRequest request) throws Exception {
		System.out.println("Registerpost수신");
		String body = "freebbs/freebbs";
		if (bindingResult.hasErrors()) {
			ModelAndView mav = new ModelAndView("menu_header");
			System.out.println("bindingErrors");
			System.out.println(bindingResult.getAllErrors());
			mav.addObject("BODY", "register/register");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		ServletContext ctx=request.getSession().getServletContext();
		String filePath=ctx.getRealPath("/upload");
		String encType="euc-kr";
		MultipartRequest multipart=new MultipartRequest(request, filePath, 5*1024*1024,	encType, new DefaultFileRenamePolicy());
		String pictureUrl = multipart.getFilesystemName("picture");
		String name=multipart.getParameter("name");
		System.out.println("이름:"+name);
		System.out.println("이미지 파일명:"+pictureUrl);
		user.setName(multipart.getParameter("name")); 
		System.out.println("실명:"+multipart.getParameter("name"));
		user.setNick(multipart.getParameter("nick"));
		System.out.println("닉네임:"+multipart.getParameter("nick"));
		user.setBirth_date(multipart.getParameter("birth_date"));
		System.out.println("생일:"+multipart.getParameter("생일"));
		user.setGender(multipart.getParameter("gender"));
		System.out.println("성별:"+multipart.getParameter("gender"));
		user.setId(multipart.getParameter("id"));
		System.out.println("아이디:"+multipart.getParameter("id"));
		user.setPassword(multipart.getParameter("password"));
		System.out.println("암호:"+multipart.getParameter("password"));
		user.setPwdCheck(multipart.getParameter("pwdCheck"));
		System.out.println("암화재확인:"+multipart.getParameter("pwdCheck"));
		user.setQuiz(multipart.getParameter("quiz"));
		System.out.println("quiz:"+multipart.getParameter("quiz"));
		user.setAnswer(multipart.getParameter("answer"));
		System.out.println("대답:"+multipart.getParameter("answer"));
		user.setEmail(multipart.getParameter("email"));
		System.out.println("이메일:"+multipart.getParameter("email"));
		user.setArea(multipart.getParameter("area"));
		System.out.println("지역:"+multipart.getParameter("area"));
		user.setPicture(pictureUrl);
		userDao.entryUser(user);
		ModelAndView mav = new ModelAndView("menu_header");
		mav.addObject("BODY", body);
		return mav;
	}

	@RequestMapping(value = "/register/register.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session, HttpServletRequest request) {
		String body = request.getParameter("BODY"); // register/register.jsp
		ModelAndView mav = new ModelAndView("menu_header");
		mav.addObject("BODY", body);
		mav.addObject(new User()); // Bean 보내기
		return mav;
	}

	@RequestMapping(value = "/register/duplicationcheck.html")
	public ModelAndView duplicationCheck() {
		ModelAndView mav = new ModelAndView("menu_header");

		return mav;
	}
}
