<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">	
function rereShow(repno){
	document.getElementById("repnoSend").value=repno;
// 	alert(document.getElementById("repnoSend").value);
 	document.getElementById(repno).style.display="block";
 
}
</script>
<body>
<div class="sbjbox" style="width:730px; margin-top:29px;">
	<c:choose>
		<c:when test="${NOCOM==0 }">
			<h2 align="center" style="margin-top:15px;"> No comment by guest.<br/> 댓글을 등록해주세요! </h2>
		</c:when>
	</c:choose>
	<c:forEach  var="rep" items="${REP}" varStatus="status"  >
		<table class="commentTable">
			<tr><td><img src="../img/noprofile.gif" alt="" width=40 height=60 style="position:static;"></td>
				<td><span style="font-weight:strong; font-size:15px; margin-left:10px;">
				
				 <c:forEach begin="${status.index}" end="${status.index}" var="replier" items="${REPLIERLIST}">
				 ${replier}
				 </c:forEach>
				
				<font size="0.8em" color="blue">${rep.register_date }</font></span><span style="font-weight:300"></span><br/><br/><br/>
				<span style=" margin-left:10px;">${rep.content } Rep Groupno = ${rep.repgroupno } Repno = ${rep.repno } User_no : ${rep.user_no }</span>
				</td>
				<td class="crud" style="float:right; margin-left:180px;">
				<input type="button" onClick="rereShow(${rep.repno})" value="댓글">
				<input type="button" value="수정">
				<input type="button" value="삭제">
				<input type="button" value="신고">
				</td>				
			</tr>
		</table>		
		<!--  대댓글 div 평소엔 display none -->
		<div id="${rep.repno}" style="display:none; border-bottom:2px dotted silver;">
		<form:form action="../reply/reply.html" method="post" modelAttribute="reply">
		<form:hidden id="repnoSend" path="repno" value="${rep.repno}"/>
		<form:hidden path="repgroupno" value="1"/>
		<form:hidden path="seqno" value="${BBS.seqno }"/> 
		<table>
			<tr><td class="tarea"> repno가 ${rep.repno }인 댓글의 대댓글을 추가합니다 ${rep.content } Rep Groupno = ${rep.repgroupno } Repno = ${rep.repno } User_no : ${rep.user_no }
			 <form:textarea path="content" rows="3" cols="92"/></td>
			<tr><td class="repbtn"><input type="submit" value="댓글등록" ></td>
		</table>
		</form:form> 
		</div>
		
		<jsp:include page="/reply/rerep.html?repno=${rep.repno}&seqno=${BBS.seqno }&repgroupno=1" flush="false"/>
	</c:forEach>
</div>
</body>
</html>