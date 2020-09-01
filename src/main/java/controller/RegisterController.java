package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
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
		ModelAndView mav = new ModelAndView("menu_header");
		System.out.println("Registerpost수신");
		if (bindingResult.hasErrors()) { // 오류로 인한 로그인 실패
			System.out.println("bindingErrors");
			System.out.println(bindingResult.getAllErrors());
			mav.addObject("BODY", "register/register");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		} // BindingResult를 벗어난 뒤 이미지 등록작업 
		MultipartFile multiFile=user.getPicture();
		String fileName=null; String path=null;
		OutputStream out=null; //쓰는 객체
		if(multiFile != null) { //이미지 파일이 존재하는 경우
			System.out.println("multiFile!=null");
			fileName=multiFile.getOriginalFilename();
			ServletContext ctx=session.getServletContext();
			path=ctx.getRealPath("/upload/"+fileName);
			try {
				out=new FileOutputStream(path); 
				BufferedInputStream bis=new BufferedInputStream(multiFile.getInputStream());
				byte [] buffer=new byte[8156];
				int read=0;
				while((read = bis.read(buffer)) > 0 ) {
					out.write(buffer,0,read);
				}
				if(out != null) out.close();
				if(bis != null) bis.close();
			}catch(Exception e) {
				e.printStackTrace();
			} //이미지 설정 후 저장
			System.out.println("fileName:"+fileName);
			System.out.println("path경로:"+path);	
			user.setPicture_url(fileName); //이미지 파일명을 설정
			System.out.println("세션에 들어갈 id : "+user.getId());
			session.setAttribute("loginUser", user.getId());
			this.userDao.entryUser(user);
			return new ModelAndView("redirect:/bbs/bbs.html?bbstype=freebbs");
		}
		return new ModelAndView("redirect:/bbs/bbs.html?bbstype=freebbs");
	}
	
	@RequestMapping(value = "/register/register.html") // 자유게시판에서 글쓰기
	public ModelAndView test(HttpSession session, HttpServletRequest request) {
		System.out.println("register/register수신");
		String body = "register/register"; // register/register.jsp
		ModelAndView mav = new ModelAndView("menu_header");
		mav.addObject("BODY", body);
		mav.addObject(new User()); // Bean 보내기
		return mav;
	}
	@RequestMapping(value="/register/modify.html")
	public ModelAndView modify(@Valid User user, BindingResult bindingResult, HttpSession session,
			HttpServletRequest request, String page) throws Exception {
		System.out.println("register/modify 수신");
		ModelAndView mav=new ModelAndView("menu_header");
		mav.addObject("BODY", "mypage/mypage");
		mav.addObject("MPBODY",page);
		
		if (bindingResult.hasErrors()) { // 오류로 인한 로그인 실패
			System.out.println("bindingErrors");
			System.out.println(bindingResult.getAllErrors());
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		} // BindingResult를 벗어난 뒤 이미지 등록작업
		MultipartFile multiFile=user.getPicture();
		String fileName=null; String path=null;
		OutputStream out=null; //쓰는 객체
		if(multiFile != null) { //이미지 파일이 존재하는 경우
			System.out.println("multiFile!=null");
			fileName=multiFile.getOriginalFilename();
			ServletContext ctx=session.getServletContext();
			path=ctx.getRealPath("/upload/"+fileName);
			try {
				out=new FileOutputStream(path); 
				BufferedInputStream bis=new BufferedInputStream(multiFile.getInputStream());
				byte [] buffer=new byte[8156];
				int read=0;
				while((read = bis.read(buffer)) > 0 ) {
					out.write(buffer,0,read);
				}
				if(out != null) out.close();
				if(bis != null) bis.close();
			}catch(FileNotFoundException e) {
				e.printStackTrace();
			} //이미지 설정 후 저장
			System.out.println("fileName:"+fileName);
			System.out.println("path경로:"+path);	
			user.setPicture_url(fileName); //이미지 파일명을 설정
			this.userDao.updateUser(user);
			//성공시 성공메시지 출력을 위한 파라미터 송신
			mav.addObject("SUCCESS","success");
			return mav;
		}	
	return mav;
	}
}

