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
<c:forEach var="rere" items="${RERELIST}">
<table class="oneLine" style="margin:10px 10px 10px 15px;">
	<tr><td><img src="../img/oneline.PNG" style="display:inline"></td><td><img src="../img/noprofile.gif" alt="" width=40 height=60 style="position:static; display:inline" ></td>
		<td style="padding-left:19px;">
		<span style="font-weight:strong; font-size:15px;">${REREPLIER}</span><span style="font-weight:300"> (49.197.103.♡)${rere.register_date }</span><br/><br/>
		<span>${rere.content } repno: ${rere.repno } seqno : ${rere.seqno } user_no : ${rere.user_no } groupno : ${rere.repgroupno } </span>
		</td>
	</tr>
</table>
</c:forEach>
</body>
</html>