<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ��� �Ϸ�</title>
</head>
<body>
<%-- <%@ include file="/WEB-INF/jsp/menu_header.jsp" %> --%>
<h2 align="center">������ ��� �Ϸ�</h2>
<div align="center" class="body">
<b><font color="red">����� �Ϸ�</font></b>
<table>
	<tr height="40px"><td>�����ID</td><td>${user.id }</td></tr>
	<tr height="40px"><td>��ȣ</td><td>${user.pwd }</td></tr>
	<tr height="40px"><td>�̸�</td><td>${user.name }</td></tr>
	<tr height="40px"><td>�ּ�</td><td>${user.address }</td></tr>
	<tr height="40px"><td>�̸���</td><td>${user.email }</td></tr>
	<tr height="40px"><td>����</td><td>${user.gender }</td></tr>
	<tr height="40px"><td>����</td><td>${user.job }</td></tr>
</table>
<a>������� ���ư���</a><br/>
<a> ����Ϸ� ����</a>

</div>
</body>
</html>