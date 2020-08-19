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

<style type="text/css">
.main {	margin: 30px 0 0 10px;}
@font-face {
	font-family: 'BMDOHYEON';
	src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff');
	format ('woff');
	font-weight: normal;
	font-style: normal;
}
span.sp_btn00 {
    display: inline-block;
    border: #DEDFDE solid 1px;
}
span.sp_btn00 {
    display: inline-block;
    border: #DEDFDE solid 1px;
}
span.sp_btn00 a {
    display: inline-block;
    padding: 4px 8px;
    color:black;
    font: 13px BMDOHYEON;
    letter-spacing: -1px;
    text-decoration: none;
    background: none repeat scroll 0 0 #FFFFFF;
    border-top: #FFFFFF 1px solid;
}
.topbox div.topside {
    float: right;
}

.sbjbox {
    margin-top: 10px;
    padding: 5px 10px 5px 10px;
    border: solid;
    border-width: 2px 1px 1px 1px;
}
.sbjbox .subject {
    margin: 0;
    padding: 10px 0 10px 0;
}
.sbjbox .subject h1 {
    margin: 0;
    padding: 0;
    font: bold 14px BMDOHYEON;
}

.sbjbox .subject .date {
    float: right;
    margin: -7px 0 0 0;
    text-align: right;
    font: 10px BMDOHYEON;
}
.sbjbox .content {
display: inline-block; white-space: pre-line; overflow: visible; 
 font: 11px BMDOHYEON;  
}
.bottom {
    padding: 10px 0 10px 0;
    text-align: left;
}
.bottom div.bottomside {
    float: right; margin-right:9px;
}
.commentHeader { font: 11px BMDOHYEON; } 
.commentTable{ margin:10px 10px 10px 15px; border-bottom:2px dotted silver;  }
.commentTable td{font: 10px BMDOHYEON; padding-bottom:20px;}
.oneLine { font: 10px BMDOHYEON;}
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
		<div class="subject"> 
			<h1><span class="category"></span> 34일 연속 근무 후기. <span class="date">Read 139<br />Score 1/0<br /> By. 2020.08.17 10:07</span></h1> 
		</div> 
	</div>
	<div class="sbjbox" style="width:730px;">
		<div id="vContent" class="content" style="width:730px; margin:10px 50px 10px 10px; padding-right:40px;">
불체자&운영자&밀두라전사<br />

저는 돈에 환장하지 않습니다.<br />
물론 싫어하는 건 아닙니다. 굳이 말하자면 쭉쭉빵빵한 얼짱몸짱 틱톡녀를 보는 것과 같은 마음으로 계좌에 찍히는 걸 구경할 뿐입니다.<br />
<br />
돈은 쓰는 게 아니라 구경하는거라 배웠습니다.<br />
여자는 탐하는 게 아니라 훔쳐보는 거라 배웠습니다.<br />
음식도 누군가 먹는 것을 빤히 구경하면 얻어진다고 배웠습니다.<br />
저의 눈빛에는 묘한 매력이 있습니다.<br />
<br />
오늘부터 다시 일합니다.<br />
다들 열심히 사세요.<br />
어차피 늙으면 몸 어디 하나는 고장난다고 합니다.<br />
몸은 소모품이니까, 최대한 돈으로 바꿔놓으세요.<br />
<br />
	
		</div>
	</div>
	<div class="bottom">
		<span class="sp_btn00" style="margin-left:-100px;"><a href="">이전글</a></span>
		<span class="sp_btn00" ><a href="" onclick="alert('다음글이 없습니다.')">다음글</a></span>
	<div class="bottomside">
		<span class="sp_btn00"><a href="../write/freebbs.html?BODY=bbs/postbbs">글쓰기</a></span>
		<span class="sp_btn00"><a href="">수정</a></span>
		<span class="sp_btn00"><a href="" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a></span>
		<span class="sp_btn00"><a href="../freebbs/freebbs.html?BODY=freebbs/freebbs">목록으로</a></span>
	</div>
	
</div>
<div class="commentHeader" style="float:left;">
		<img src="../img/comment.gif" alt="">
		<span>댓글</span>1개
</div>
<div class="sbjbox" style="width:730px; margin-top:29px;">
	<c:forEach  begin="0" end="7">
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
			<tr><td><img src="../img/oneline.PNG" style="display:inline"></td><td><img src="../img/noprofile.gif" alt="" width=40 height=60 style="position:static; display:inline"" ></td>
				<td style="padding-left:19px;">
				<span style="font-weight:strong; font-size:15px;">덴데쟈네카 ---</span><span style="font-weight:300"> (49.197.103.♡) 2020.08.17 01:36</span><br/><br/>
				<span>돈은 있다가도 없는 것 아니겠습니까?
				</span>
				</td>
			</tr>
		</table>
		
	</c:forEach>
</div>
</body>
</html>