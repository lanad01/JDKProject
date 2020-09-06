<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.loginborder{ padding:10px 10px 10px 10px;}
</style>
<body>
<div class="loginborder" style="border:1px solid; padding-left:10px;">
<form action="../logout/logout.html"  method="get">
	<table>
	<tr><td> ${USER.name }님</td>
		<td> ${sessionScope.loginUser}님</td>
	<tr><td><a href="../myaccount/mypage.html?BODY=mypage/mypage"><input style="font-family:'BMDOHYEON'; font-size:0.8em;" type="button" value="마이페이지"></a>
		<td><input type="submit" style="font-family:'BMDOHYEON'; font-size:0.8em;"  value="로그아웃"/><br>
	</tr>
	</table>
</form>
</div>

<!--  HttpServletRequest의 경우 Request가 Default값이었기 때문에 
      EL내에서 requestScope는 생략을 해도 됐었다
            근데 session은 아니야 ㅋ
 ------------참고--------------------------------------------------------------------------
 pageContext JSP의 page 기본 객체와 동일하다. 
 pageScope  pageContext 기본 객체에 저장된 속성의 [속성, 값] 매핑을 저장한 Map 객체 
 requestScope  request 기본 객체에 저장된 속성의 [속성, 값] 매핑을 저장한 Map 객체 
 sessionScope session 기본 객체에 저장된 속성의 [속성, 값] 매핑을 저장한 Map 객체 
 applicationScope  application 기본 객체에 저장된 속성의  [속성, 값]  매핑을 저장한 Map 객체 
 param  요청 파라미터의 [파라미터이름, 값] 매핑을 저장한 Map 객체, 타입은 String (request.getParameter(이름)의 결과와 동일)
 paramValues 요청 파라미터의[파라미터이름, 값배열]매핑을 저장한 Map 객체, 타입은 String[] (request.getParameterValues(이름)의 결과와 동일)
 header 요청 정보의 [헤더이름, 값] 매핑을 저장한 Map 객체 (request.getHeader(이름)의 결과와 동일)
 headerValues 요청 정보의[헤더이름, 값 배열] 매핑을 저장한 Map 객체 (request.getHeaders(이름)의 결과와 동일)
 cookie [쿠키 이름, Cookie] 매핑을 저장한 Map 객체 (request.getCookies()로 구한 Cookie 배열로 부터 매핑을 생성) 
 initParam 초기화 파라미터의[이름, 값] 매핑을 저장한 Map 객체 (application.getInitParameter(이름)의 결과와 동일) 
 -->
</body>
</html>