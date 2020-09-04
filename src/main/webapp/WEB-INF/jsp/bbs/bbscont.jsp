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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style type="text/css">
</style>
</head>
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
function myFunction4(seqno){ // 수정
	var bbstype=document.getElementById("bbstype").value;
	$.ajax({
	 		async: true,
			type : 'POST',
			data : { "seqno": seqno, "bbstype" : bbstype } ,
			dataType : "json",
		url : "../bbs/bbsmodvalid.html",
	    success : function(data){
	    	if(data==1) {
	    	swal("아이디가 일치합니다!", "success");
	    	location.href="../bbs/bbsupd.html?seqno="+seqno+"&bbstype="+bbstype;}
	   		if(data==0) swal("","해당 게시글의 작성자가 아닙니다!!", "error");
	    	if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
	   	},error : function(e){
	   		swal("","실패", "error");
	  		}
	  	})
}
function myFunction3(seqno) { // 삭제
	swal({
        title: "정말 삭제하시겠습니까?",
        text: "삭제된 대댓글은 복구되지 않습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "예 삭제하겠습니다.",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
    	 if (isConfirm){
			var bbstype=document.getElementById("bbstype").value;
			$.ajax({
   	 		async: true,
   			type : 'POST',
   			data : { "seqno": seqno } ,
  			dataType : "json",
			url : "../bbs/delbbsvalid.html",
		    success : function(data){
		    	if(data==1) {
		    	swal("성공적으로 삭제되었습니다!!", "");
		    	location.href="../bbs/bbs.html?bbstype="+bbstype;}
		   		if(data==0) swal("","해당 댓글의 작성자가 아닙니다!!", "error");
		    	if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
		   	},error : function(e){
		   		swal("","실패", "error");
		  		}
		  	})
			}else{
			swal("","삭제 취소", "success");
			}
  		  });
};
</script>
<body>
	<input type="hidden" id="bbstype" value="${BBS.bbstype }">
	<div class="main" style="width:730px;">
		<div class="topbox">
		<div class="topside" style="margin-right:10px;"><span class="sp_btn00"><a href="../bbs/bbs.html?bbstype=${BBS.bbstype }">목록으로</a></span></div>
		</div>
	</div>
	<div class="sbjbox" style="width:730px;">
		<div class="subject" style="height:60px"> 
			<h1><span class="category" style="margin-top:15px;"><strong> ${BBS.title } </strong></span>
			<font color="blue" size="1"><span>(${REPNUM }+${RERENUM})</span></font>
			<span class="date">Read ${BBS.hit }<br />추천수 : ${BBS.point}<br />${BBS.register_date }<br/>작성자 : ${WRITER }</span></h1> 
		</div> 
	</div>
	<div class="sbjbox" style="width:730px;">
		<div id="vContent" class="content" style="width:730px; margin:10px 50px 10px 10px; padding-right:40px;">${BBS.content }
		<br/><br/>
		<div style="text-align:center; margin-bottom:-10px;" ><img src="../img/like.png" alt="추천"><img src="../img/dislike.png" alt="반대"></div>
		</div>
		
	</div>
	<div class="bottom">
		<span class="sp_btn00" style="margin-left:-100px;"><a href="../bbs/prepost.html?seqno=${BBS.seqno}&bbstype=${BBS.bbstype}">이전글</a></span>
		<span class="sp_btn00" ><a href="" onclick="alert('다음글이 없습니다.')">다음글</a></span>
	<div class="bottomside">
	<font face="BMDOHYEON" size="1.0em" color="blue">
		<span class="sp_btn00"><input type="button" onclick="location.href='../write/bbs.html?bbstype=${BBS.bbstype}'" value="글쓰기"></span>
		<span class="sp_btn00"><input type="button" onclick="myFunction3(${BBS.seqno})" value="삭제"></span>
		<span class="sp_btn00"><input type="button" onclick="myFunction4(${BBS.seqno})" value="수정"></span>
		<span class="sp_btn00"><input type="button" onclick="location.href='../bbs/bbs.html?bbstype=freebbs'" value="목록으로"></span>
	</font>
	</div>
	
</div>
<!-- <div class="commentBox"> -->
<%-- <jsp:include page="/reply/replyview.html" flush="false"/> --%>
<div class="commentHeader" style="float:left;">
		<img src="../img/comment.gif" alt="">
		<span>댓글(${REPNUM }+${RERENUM})</span>
</div>	
<jsp:include page="/reply/replylist.html?seqno=${BBS.seqno}" flush="false"/>

<div class="sbjbox" style="width:730px; margin-top:29px;">
	<c:choose>
		<c:when test="${sessionScope.loginUser == null}">
				<h2 class="loginheader"><span><strong>댓글 쓰기 - </strong> <font color="#c0c0c0"> 로그인 한 후 댓글 작성 권한이 있을 경우 이용하실 수 있습니다.</font></span></h2>
				<a href="../login/login.html" class="logbtn"><button class="loginbtn">로그인</button></a>
		</c:when>
		<c:otherwise>
			<h2 class="repheader"><strong>댓글 쓰기 - </strong> <font color="#c0c0c0"> 타인을 비방하거나 개인정보를 유출하는 댓글을 삼가주세요.</font></h2>
			<form:form action="../reply/reply.html?seqno=${BBS.seqno }" method="post" modelAttribute="reply">
			<form:hidden path="repgroupno" value="0"/>
			<!--  자 보자 내가 여기서 보낼 수 있는 정보가 뭐야? 우선 댓글내용. 게시글 속성(게시글 번호),  -->
			<table>
				<tr><td class="tarea"><form:textarea path="content" rows="3" cols="90"/></td>
				<tr><td class="repbtn"><input type="submit" value="댓글등록" ></td>
			</table>
			</form:form> 
		</c:otherwise>
	</c:choose>
</div>
<!-- </div>  commentBox종료 -->
</body>
</html>