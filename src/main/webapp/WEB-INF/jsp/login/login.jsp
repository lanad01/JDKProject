<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.loginborder{ padding:10px 10px 10px 10px;}
</style>
</head>
<body>
<div class="loginborder" style="border:1px solid; padding-left:10px;">
<form:form action="../login/loginpost.html"  method="post" modelAttribute="user">
	<table>
	<tr>
		<td>
			<form:input type="text" path="id" style="width:120px; height:20px; border-spacing:2px;"/>
			<font color="red"><form:errors path="id"/></font><br/>
			<form:input type="password" path="password" style="width:120px; height:20px; border-spacing:2px;"/>
			<font color="red"><form:errors path="password"/></font><br/>
		</td>
		<td style="padding-left:30px;">
			<input type="submit" style="font-family:'BMDOHYEON'; font-size:0.8em;"  value="로그인"/>
			<input type="button" style="font-family:'BMDOHYEON'; font-size:0.8em;" 
			value="회원가입" onClick="location.href='../register/register.html?BODY=register/register'">
		</td>
	</tr>
	</table>
</form:form>
</div>
</body>
</html>