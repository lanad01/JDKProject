<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="rere" items="RERELIST">
<table class="oneLine" style="margin:10px 10px 10px 15px;">
	<tr><td><img src="../img/oneline.PNG" style="display:inline"></td><td><img src="../img/noprofile.gif" alt="" width=40 height=60 style="position:static; display:inline" ></td>
		<td style="padding-left:19px;">
		<span style="font-weight:strong; font-size:15px;">${REREPLIER}</span><span style="font-weight:300"> (49.197.103.♡) 2020.08.17 01:36</span><br/><br/>
		<span> </span>
		</td>
	</tr>
</table>
</c:forEach>
</body>
</html>