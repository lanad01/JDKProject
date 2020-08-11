package util;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import model.User;

public class LoginValidator implements Validator {//Validator를 Controller에서 사용해야합니다
	
//	https://blog.outsider.ne.kr/825  -- 참고합시다

	public boolean supports(Class<?> clazz) { //유효성 검사의 대상이 되는 객체를 지정
		return User.class.isAssignableFrom(clazz);
	}
//	supports 메서드에서는 인자로 넘어온 객체의 클래스가 Event인지를 검사하는 로직이 들어가있다.
//  validate(Object, org.springframework.validation.Errors) - 
//	주어진 객체에 유효성검사를 하고 유효성검사에 오류가 있는 경우 주어진 객체에 이 오류들을 등록한다.
	public void validate(Object target, Errors errors) { //실제 유효성검사
		User user=(User)target; // 검증의 대상
		if(!StringUtils.hasLength(user.getId())) {//계정이 없는 경우
			errors.rejectValue("id", "error.required"); //메시지 출력
			//properties파일에서 에러메시지를 불러오자
		}
		if(!StringUtils.hasLength(user.getPwd())) { //암호가 없는 경우
			errors.rejectValue("pwd", "error.required"); //메시지 출력
		}
		if(errors.hasErrors()) {//전체 항목에 문제가 있는 경우
			errors.reject("error.login.user");
		}
	}
}
