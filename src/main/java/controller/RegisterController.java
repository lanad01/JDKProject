package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
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
		MultipartFile multiFile=user.getPicture();
		String fileName=null; String path=null;
		OutputStream out=null; //쓰는 객체
		if(multiFile !=null) { //이미지 파일이 존재하는 경우
			fileName=multiFile.getOriginalFilename();
			path=request.getSession().getServletContext().getRealPath("/upload/"+fileName); //절대경로 획득
			File file=new File(path);//절대경로를 이용하여 파일 생성
			out=new FileOutputStream(path);//파일 출력 객체 생성'
			BufferedInputStream bis=new BufferedInputStream(multiFile.getInputStream());//파일 입력객체
			byte[] buffer=new byte[8196]; //8k크기의 공간
			int read=0;
			while((read=bis.read(buffer))> 0) { //파일을 읽음
				out.write(buffer,0,read); // 읽은 내용을 출력될 파일로 출력
			}
			if(out != null) out.close(); //출력에 사용한 객체를 닫음
			if(bis != null) bis.close(); //입력에 사용한 객체를 닫음
		}
		user.setPicture_url(fileName); //이미지 파일명을 설정
		this.userDao.entryUser(user);
		ModelAndView mav=new ModelAndView("menu_header"); //이게 없으면 새로고침 누를 시 중복등록이 발생
		mav.addObject("BODY",body);
		return mav; // 삽입 후 다시 목록을 띄운다
	}

	@RequestMapping(value = "/register/register.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session, HttpServletRequest request) {
		String body = request.getParameter("BODY"); // register/register.jsp
		ModelAndView mav = new ModelAndView("menu_header");
		mav.addObject("BODY", body);
		mav.addObject(new User()); // Bean 보내기
		return mav;
	}

}
