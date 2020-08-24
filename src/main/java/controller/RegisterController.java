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
//		if( user.getPicture().getOriginalFilename().equals("")) { //존재하지않는 경우
//			System.out.println("빈칸으로 입력되는 경우");
//			fileName="C:\\Users\\권상우\\Desktop\\JDKProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\3-5_\\upload\\default.jpg";
//			File file=new File(fileName);
//			out=new FileOutputStream(fileName);//파일 출력 객체 생성'
//			BufferedInputStream bis=new BufferedInputStream(multiFile.getInputStream());//파일 입력객체
//			byte[] buffer=new byte[8196]; //8k크기의 공간
//			int read=0;
//			while((read=bis.read(buffer))> 0) { //파일을 읽음
//				out.write(buffer,0,read); // 읽은 내용을 출력될 파일로 출력
//			}
//			if(out != null) out.close(); //출력에 사용한 객체를 닫음
//			if(bis != null) bis.close(); //입력에 사용한 객체를 닫음
//		}
		if(multiFile != null) { //이미지 파일이 존재하는 경우
			System.out.println("multiFile!=null");
			fileName=multiFile.getOriginalFilename();
			path=request.getSession().getServletContext().getRealPath("/upload/"+fileName); //절대경로 획득
			user.setPicture_url(path);
			File file=new File(path);
			System.out.println("file:"+file);
			System.out.println("fileName:"+fileName);
			System.out.println("path경로:"+path);
			//search-ms:displayname=.plugins의%20검색%20결과&crumb=location:C%3A%5CUsers%5C권상우%5CDesktop%5CJDKProject%5C.metadata%5C.plugins\org.eclipse.wst.server.core
			//절대경로를 이용하여 파일 생성
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
		System.out.println("register/register수신");
		String body = "register/register"; // register/register.jsp
		ModelAndView mav = new ModelAndView("menu_header");
		mav.addObject("BODY", body);
		mav.addObject(new User()); // Bean 보내기
		return mav;
	}

}
