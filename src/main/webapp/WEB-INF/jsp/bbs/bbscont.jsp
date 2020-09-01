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

<link	href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/bbscont.css">
<style type="text/css">}
</style>
</head>
<script type="text/javascript">

</script>
<body>
	<div class="main" style="width:730px;">
		<div class="topbox">
			<span class="sp_btn00" style="margin-left:-8px;"><a href="">������</a></span>
			<span class="sp_btn00"><a href="" onclick="alert('�������� �����ϴ�.')">������</a></span>
		<div class="topside" style="margin-right:10px;"><span class="sp_btn00"><a href="../freebbs/freebbs.html?BODY=freebbs/freebbs">�������</a></span></div>
		</div>
	</div>
	<div class="sbjbox" style="width:730px;">
		<div class="subject" style="height:60px"> 
			<h1><span class="category" style="margin-top:15px;"><strong> ${BBS.title } </strong></span>
			<font color="blue" size="1"><span>(${REPNUM }+${RERENUM})</span></font>
			<span class="date">Read ${BBS.hit }<br />��õ�� : ${BBS.point}<br />${BBS.register_date }<br/>�ۼ��� : ${WRITER }</span></h1> 
		</div> 
	</div>
	<div class="sbjbox" style="width:730px;">
		<div id="vContent" class="content" style="width:730px; margin:10px 50px 10px 10px; padding-right:40px;">${BBS.content }
		<br/><br/>
		<div style="text-align:center; margin-bottom:-10px;" ><img src="../img/like.png" alt="��õ"><img src="../img/dislike.png" alt="�ݴ�"></div>
		</div>
		
	</div>
	<div class="bottom">
		<span class="sp_btn00" style="margin-left:-100px;"><a href="">������</a></span>
		<span class="sp_btn00" ><a href="" onclick="alert('�������� �����ϴ�.')">������</a></span>
	<div class="bottomside">
		<span class="sp_btn00"><a href="../write/freebbs.html">�۾���</a></span>
		<span class="sp_btn00"><a href="">����</a></span>
		<span class="sp_btn00"><a href="" onclick="return confirm('������ �����Ͻðڽ��ϱ�?');">����</a></span>
		<span class="sp_btn00"><a href="../bbs/freebbs.html">�������</a></span>
	</div>
	
</div>
<!-- <div class="commentBox"> -->
<%-- <jsp:include page="/reply/replyview.html" flush="false"/> --%>
<div class="commentHeader" style="float:left;">
		<img src="../img/comment.gif" alt="">
		<span>���(${REPNUM }+${RERENUM})</span>
</div>	
<jsp:include page="/reply/replylist.html?seqno=${BBS.seqno}" flush="false"/>

<div class="sbjbox" style="width:730px; margin-top:29px;">
	<c:choose>
		<c:when test="${sessionScope.loginUser == null}">
				<h2 class="loginheader"><span><strong>��� ���� - </strong> <font color="#c0c0c0"> �α��� �� �� ��� �ۼ� ������ ���� ��� �̿��Ͻ� �� �ֽ��ϴ�.</font></span></h2>
				<a href="../login/login.html" class="logbtn"><button class="loginbtn">�α���</button></a>
		</c:when>
		<c:otherwise>
			<h2 class="repheader"><strong>��� ���� - </strong> <font color="#c0c0c0"> Ÿ���� ����ϰų� ���������� �����ϴ� ����� �ﰡ�ּ���.</font></h2>
			<form:form action="../reply/reply.html?seqno=${BBS.seqno }" method="post" modelAttribute="reply">
			<form:hidden path="repgroupno" value="0"/>
			<!--  �� ���� ���� ���⼭ ���� �� �ִ� ������ ����? �켱 ��۳���. �Խñ� �Ӽ�(�Խñ� ��ȣ),  -->
			<table>
				<tr><td class="tarea"><form:textarea path="content" rows="3" cols="90"/></td>
				<tr><td class="repbtn"><input type="submit" value="��۵��" ></td>
			</table>
			</form:form> 
		</c:otherwise>
	</c:choose>
</div>
<!-- </div>  commentBox���� -->
</body>
</html>