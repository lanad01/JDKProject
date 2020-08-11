<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>가입자 등록화면</title>
</head>
<body>
<h2 align="center"> 가입자 등록 정보 입력</h2>
<div align="center" class="body">
<form:form action="userEntry.html" method="post" modelAttribute="user">
<spring:hasBindErrors name="user">
	<font color="red">
		<c:forEach items="${errors.globalErrors}" var="error">
			<spring:message code="${error.code }"/>
		</c:forEach>
	</font>
</spring:hasBindErrors>
<table>
	<tr height="40px"><td> 사용자id</td>
	  <td><form:input path="id" maxlength="20" cssClass="userId"/>
	  <font color="red"> <form:errors path="id"/></font></td></tr>
	<tr height="40px"><td>패스워드</td>
	  <td><form:input path="pwd" maxlength="20" cssClass="password"/>
	  <font color="red"> <form:errors path="pwd"/></font></td></tr>
	<tr height="40px"><td>이름</td>
	  <td><form:input path="name" maxlength="20" cssClass="userName"/>
	  <font color="red"> <form:errors path="name"/></font></td></tr>
	<tr height="40px"><td>우편번호</td>
	  <td><form:input path="address" maxlength="20" cssClass="address"/>
	  <font color="red"> <form:errors path="address"/></font></td></tr>
	<tr height="40px"><td>E-Mail</td>
	  <td><form:input path="email" maxlength="20" cssClass="email"/>
	  <font color="red"> <form:errors path="email"/></font></td></tr>
	<tr height="40px"><td>성별</td>
	  <td><form:radiobutton path="gender" value="M" label="남자" cssClass="gender"/>
	  	  <form:radiobutton path="gender" value="F" label="여자" cssClass="gender"/>
	  	  <font color="red"><form:errors path="gender"/></font></td></tr>
	<tr height="40px"><td>직업</td>
	  <td><form:select path="job" cssClass="job">
		  <form:option value="회사원" label="회사원"/>	
		  <form:option value="학생" label="학생"/>
		  <form:option value="주부" label="주부"/>
		  <form:option value="기타" label="기타"/>	
		  </form:select></td></tr>  
</table>
<table>
	<tr><td height="40px" align="center">
		<input type="submit" value="등록" name="btnSubmit"/></td>
		<td height="40px" align="center">
		<input type="reset" value="리셋" name="btnReset"/></td>
</table>
</form:form>
<a>목록으로 돌아가기</a>
</div>
</body>
</html>