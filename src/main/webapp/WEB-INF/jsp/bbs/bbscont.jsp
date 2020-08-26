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
	<div> ${postNum }</div>
	<div class="main" style="width:730px;">
		<div class="topbox">
			<span class="sp_btn00" style="margin-left:-8px;"><a href="">이전글</a></span>
			<span class="sp_btn00"><a href="" onclick="alert('다음글이 없습니다.')">다음글</a></span>
		<div class="topside" style="margin-right:10px;"><span class="sp_btn00"><a href="../freebbs/freebbs.html?BODY=freebbs/freebbs">목록으로</a></span></div>
		</div>
	</div>
	<div class="sbjbox" style="width:730px;">
		<div class="subject" style="height:60px"> 
			<h1><span class="category" style="margin-top:15px;"><strong> ${BBS.title }</strong> </span> 
			<span class="date">Read 139<br />Score 1/0<br />${BBS.register_date }<br/>작성자 : ${WRITER }</span></h1> 
		</div> 
	</div>
	<div class="sbjbox" style="width:730px;">
		<div id="vContent" class="content" style="width:730px; margin:10px 50px 10px 10px; padding-right:40px;">${BBS.content }
		<br/><br/>
		<div style="text-align:center; margin-bottom:-10px;" ><img src="../img/like.png" alt="추천"><img src="../img/dislike.png" alt="반대"></div>
		</div>
		
	</div>
	<div class="bottom">
		<span class="sp_btn00" style="margin-left:-100px;"><a href="">이전글</a></span>
		<span class="sp_btn00" ><a href="" onclick="alert('다음글이 없습니다.')">다음글</a></span>
	<div class="bottomside">
		<span class="sp_btn00"><a href="../write/freebbs.html">글쓰기</a></span>
		<span class="sp_btn00"><a href="">수정</a></span>
		<span class="sp_btn00"><a href="" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a></span>
		<span class="sp_btn00"><a href="../bbs/freebbs.html">목록으로</a></span>
	</div>
	
</div>
<div class="commentHeader" style="float:left;">
		<img src="../img/comment.gif" alt="">
		<span>댓글</span>1개
</div>
<div class="sbjbox" style="width:730px; margin-top:29px;">
	<c:forEach  begin="0" end="3">
		<table class="commentTable">
			<tr><td><img src="../img/noprofile.gif" alt="" width=40 height=60 style="position:static;"></td>
				<td style="padding-left:19px;">
				<span style="font-weight:strong; font-size:15px;">점심뭐먹지 ---</span><span style="font-weight:300"> (49.197.103.♡) 2020.08.17 01:36</span><br/><br/>
				<span>아니,,, 뭐지? 내가 쓴건데 ;;;
					암튼 다이빙 같이 갈 구댕이 찾습니다.다들 열심히 사세요.
					어차피 늙으면 몸 어디 하나는 고장난다고 합니다.
					몸은 소모품이니까, 최대한 돈으로 바꿔놓으세요.
				</span>
				</td>
			</tr>
		</table>
		<table class="oneLine" style="margin:10px 10px 10px 15px;">
			<tr><td><img src="../img/oneline.PNG" style="display:inline"></td><td><img src="../img/noprofile.gif" alt="" width=40 height=60 style="position:static; display:inline" ></td>
				<td style="padding-left:19px;">
				<span style="font-weight:strong; font-size:15px;">덴데쟈네카 ---</span><span style="font-weight:300"> (49.197.103.♡) 2020.08.17 01:36</span><br/><br/>
				<span>돈은 있다가도 없는 것 아니겠습니까?
				</span>
				</td>
			</tr>
		</table>
		
	</c:forEach>
</div>
<div class="sbjbox" style="width:730px; margin-top:29px;">
	<c:choose>
		<c:when test="${sessionScope.loginUser == null}">
			<h2>댓글 쓰기 - 로그인 한 후 댓글 작성 권한이 있을 경우 이용하실 수 있습니다.</h2>
			<a href="../login/login.html"><button value="로그인" class="loginbtn"></button></a>
		</c:when>
		<c:otherwise>
			<h2 class="repheader"><strong>댓글 쓰기 - </strong> <font color="#c0c0c0"> 타인을 비방하거나 개인정보를 유출하는 댓글을 삼가주세요.</font></h2>
			<form:form action="../reply/reply.html" method="post" modelAttribute="reply">
			<table>
				<tr><td class="tarea"><form:textarea path="content" rows="3" cols="90"/></td>
				<tr><td class="repbtn"><input type="submit" value="댓글등록" ></td>
			</table>
			</form:form> 
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>