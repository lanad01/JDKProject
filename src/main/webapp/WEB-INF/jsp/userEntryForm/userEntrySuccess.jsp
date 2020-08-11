<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>가입자 등록 완료</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
<h2 align="center">가입자 등록 완료</h2>
<div align="center" class="body">
<b><font color="red">등록이 완료</font></b>
<table>
	<tr height="40px"><td>사용자ID</td><td>${user.id }</td></tr>
	<tr height="40px"><td>암호</td><td>${user.pwd }</td></tr>
	<tr height="40px"><td>이름</td><td>${user.name }</td></tr>
	<tr height="40px"><td>주소</td><td>${user.address }</td></tr>
	<tr height="40px"><td>이메일</td><td>${user.email }</td></tr>
	<tr height="40px"><td>성별</td><td>${user.gender }</td></tr>
	<tr height="40px"><td>직업</td><td>${user.job }</td></tr>
</table>
<a>목록으로 돌아가기</a><br/>
<a> 계산하러 가기</a>

</div>
</body>
</html>