<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/3-3.css">
</head>
<body>
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
<div align="center" class="body">
<!--  form태그의 commandName 또는 modelAttribute에 값을 제공할 객체의 지정은
	    보통 컨트롤러에서 하게 됩니다.
	    서블릿에서의 form은 input의 파라미터들이 제각각 action 서블릿으로 전송되지만,
	    스프링 Form에서는 모델객체가 form에 있는 전부를 포함해서 한번에 컨트롤러로 날아갑니다. 
	    그 객체의 이름이 modelAttribute인거죠.
	    여기서는 user라는 객체가 id,password를 가지고 컨트롤러로 날아가겠네요.
	    훨씬 자바에 가까운 로직구현이라고 할 수 있겠습니다. 
	    여기서 user라는 모델의 맵핑을 config에서 수행합니다 
-->
<form:form action="login.html" method="post" modelAttribute="user">
<spring:hasBindErrors name="user">
	<font color="red">
		<c:forEach items="${errors.globalErrors }" var="error">
			<spring:message code="${error.code }"/> 
			<!--   Validator의 errorsreject.value 값을 출력시키는 구문 -->
		</c:forEach>
	</font>
</spring:hasBindErrors>
<table>
	<tr height="40px"><td>사용자ID</td>
		<td><form:input path="id" cssClass="userId"/>
		<font color="red">
			<form:errors path="id"/> <!--  errors는 Validator의 errors를 불러와서 출력 -->
									 <!--  Validator는 properties에서 가져오는거고 ㅇㅇ -->
									 
		</font>
		</td>
	</tr>
	<tr height="40px"><td>패스워드</td>
		<td><form:password path="pwd" cssClass="password"/>
		<font color="red">
			<form:errors path="pwd"/> <!--  암호는 반드시 입력해야합니다! --> 
		</font>
		</td>
	</tr>
</table>
<table>
	<tr><td align="center"><input type="submit" value="로그인"/></td>
		<td align="center"><input type="reset" value="취소"/></td>
	</tr>
</table>
</form:form>
<a href="../userentryform/userEntry.html">신규 가입자 등록</a>
</div>
</body>
</html>