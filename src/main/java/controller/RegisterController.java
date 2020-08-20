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

	@RequestMapping(value = "/register/registerpost.html") // 자유게시판에서 글쓰기
	public ModelAndView entryUser(@Valid User user, BindingResult bindingResult, HttpSession session,
			HttpServletRequest request) throws Exception {
		System.out.println("Registerpost수신");
		String body = "freebbs/freebbs";
		if (bindingResult.hasErrors()) {
			ModelAndView mav = new ModelAndView("menu_header");
			mav.addObject("BODY", body);
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		// 이미지파일은 업로드
		// 업로드 할 때는 절대경로가 필요하다. upload폴더의 절대경로
		// 절대경로 획득을 위해 HttpServletRequest가 필요
		ServletContext ctx = request.getSession().getServletContext();
		String filePath = ctx.getRealPath("/upload");
		String encType = "euc-kr";
		MultipartRequest multipart = new MultipartRequest(request, filePath, 5 * 1024 * 1024, encType,
				new DefaultFileRenamePolicy());
		String pictureUrl = multipart.getFilesystemName("picture");
		System.out.println("이미지 파일명:"+pictureUrl);
		user.setName(request.getParameter("name")); 
		System.out.println("실명:"+request.getParameter("name"));
		user.setNick(request.getParameter("nick"));
		System.out.println("닉네임:"+request.getParameter("nick"));
		user.setBirth_date(request.getParameter("birth_date"));
		System.out.println("생일:"+request.getParameter("생일"));
		user.setGender(request.getParameter("gender"));
		System.out.println("성별:"+request.getParameter("gender"));
		user.setId(request.getParameter("id"));
		System.out.println("아이디:"+request.getParameter("id"));
		user.setPassword(request.getParameter("password"));
		System.out.println("암호:"+request.getParameter("password"));
		user.setPwdCheck(request.getParameter("pwdCheck"));
		System.out.println("암화재확인:"+request.getParameter("pwdCheck"));
		user.setQuiz(request.getParameter("quiz"));
		System.out.println("quiz:"+request.getParameter("quiz"));
		user.setAnswer(request.getParameter("answer"));
		System.out.println("대답:"+request.getParameter("answer"));
		user.setEmail(request.getParameter("email"));
		System.out.println("이메일:"+request.getParameter("email"));
		user.setPicture(pictureUrl);
		this.userDao.entryUser(user);
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
