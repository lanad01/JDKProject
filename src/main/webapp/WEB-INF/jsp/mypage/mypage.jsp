<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link	href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/mypage.css">
<style type="text/css">

</style>
</head>
<script type="text/javascript">
	
	function morebox() {
		document.getElementById("morebox").style.display = "block";
	}
	function moreboxClose() {
		document.getElementById("morebox").style.display = "none";
	}
	function pwdChange(){
		window.open("../myaccount/pwdchangepop.html","_blank",'scrollbars=no, width=450,height=250,status=no,resizable=no,left=400,top=300').focus();

	}
</script>
<body>
	<div class="main">
		<div class="header">
			<h2><font face='BMDOHYEON'>마이페이지</font></h2>
		</div>
		<div class="msg">
			<div class="xr">
				<ul>
					<li><a onclick="morebox();">회원정보</a><img
						src="../img/dropClose.gif" onClick="moreboxClose()" height=10 width=10>
						<div id="morebox" class="morebox">
							<ul>
								<li style="margin-top: 2px;"><a href="../myaccount/pagecontrol.html?page=2" id="1"	onmouseover="focus(this)">정보수정</a></li>
								<li><a href="" id="2" onmouseover="focus(this)" onClick="pwdChange()">비번변경</a></li>
								<li><a href="../myaccount/pagecontrol.html?page=4" id="3" onmouseover="focus(this)">회원탈퇴</a></li>
							</ul>
						</div>
					</li>
					<li><a href="">게시물</a></li>
					<li><a href="">댓글</a></li>
					<li><a href="">한줄의견</a></li>
					<li><a href="">캐릭터</a></li>
					<li><a href="">포인트</a></li>
					<li><a href="">접속기록</a></li>
				</ul>
			</div>
			<br/>
			<br/>
			<div class="rcontent">
				<div class="photo">
					<img alt="내 사진" src="${pageContext.request.contextPath}/upload/${USER.picture_url }"  
					width="100" height="70" onerror="this.src='../img/noprofile.gif' ">

				</div>
				<div class="Explain">
					이 곳은 <strong>${USER.name }(${USER.nick })</strong>님을 위한 공간입니다. <br /> 회원님의 활동내역을 실시간으로 확인하실 수 있습니다.<br />
					회원등급 : 레벨11(11/25)   포인트 : ${USER.user_point} 가입일 : ${USER.register_date }
				</div>
			</div><br/><br/><br/><br/>
			
			<c:choose>
				<c:when test="${MPBODY==1 }">
					<div class="myAcitivity" style="border-top:3px solid black; border-bottom:3px solid black; " >
					<table class="posttable" rules="all" style="border:2px dotted silver; margin-top:20px; margin-bottom:20px;">
					<tr><td class="region"><h5>내가 등록한 게시물</h5>
						<c:forEach var="myPost" items="${MYBBS}" varStatus="status">
							<li style="list-style:none;">ㆍ <a href="../bbs/bbsview.html?seqno=${myPost.seqno }">${myPost.title}</a></li>
						</c:forEach>
						</td>
					
						<td class="region"><h5>내 게시물에 달린 댓글</h5>
						<c:forEach var="repleInMyBbs" items="${RELIST}" varStatus="status">
						<li style="list-style:none;">ㆍ <a href="../bbs/bbsview.html?seqno=${repleInMyBbs.seqno }" 
							style="CURSOR:hand;" title="">${repleInMyBbs.content}</a></li>
						</c:forEach>
						</td>
					</tr>
					<tr><td class="region"><h5>내가 등록한 댓글</h5>
						<c:forEach var="myRep" items="${MYREP}" varStatus="status">
							<li style="list-style:none;">ㆍ <a href="../bbs/bbsview.html?seqno=${myRep.seqno }">${myRep.content}</a></li>
						</c:forEach>
						</td>
					
						<td class="region"><h5>내 댓글에 달린 한줄 의견</h5>
						<c:forEach var="reRe" items="${RERELIST}" varStatus="status">
							<li style="list-style:none;">ㆍ  <a href="../bbs/bbsview.html?seqno=${reRe.seqno }">${reRe.content}</a></li>
						</c:forEach>
						</td>
					</tr>
				</table>
				</div>
				</c:when>
				<c:when test="${MPBODY=='2'}"> <!--  정보수정 버튼 클릭  -->
					<div style="border:none;">
					<jsp:include page="/myaccount/modify.html" flush="false"/>
					</div>
				</c:when>
				<c:when test="${MPBODY=='3' }">
					<div>
					<jsp:include page="/myaccount/pwdchange.html" flush="false"/>
					</div>
				</c:when>
				<c:when test="${MPBODY=='4' }">
					<div>
					<jsp:include page="/myaccount/deletepage.html" flush="false"/>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
<!-- Ui종료  -->
</body>
</html>