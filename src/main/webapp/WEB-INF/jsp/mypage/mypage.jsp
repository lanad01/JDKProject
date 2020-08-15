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

<link href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'	rel='stylesheet' type='text/css'>
<style type="text/css">
.main {	margin: 20px 0 0 10px;}

@font-face {font-family: 'BMDOHYEON';	src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff');	format('woff');
	font-weight: normal;	font-style: normal;}
.msg {	font-size: 1em;	font-family: 'BMDOHYEON';	font-color: red;	border-top: 3px solid black; width: 700px;}
.msg a{ color: black;}
.xr{ margin-top:-10px;}
.xr li { position: relative;    top: 6px;    height: 26px;    list-style-type: none;    float: left;    border-top: #dfdfdf solid 1px;  border-right: #dfdfdf solid 1px;
    border-bottom: #dfdfdf solid 1px;    background: #f9f9f9;    cursor: pointer;    color: #666666; float:right; margin-left:10px; }
.morebox { display:none; }
.xr li .morebox li { margin-left:10px;   list-style-type: none;   float: none;    height: 15px;  margin-top:7px;  background: #ffffff; }
.xr li .morebox li a{ text-decoration:none;}
</style>
</head>
<script type="text/javascript">
function morebox(){ document.getElementById("morebox").style.display = "block"; }
function moreboxClose(){ document.getElementById("morebox").style.display = "none"; }
</script>
<body>
	<div class="main">
		<div class="header">
			<h2><font face='BMDOHYEON'>마이페이지</font></h2>
		</div>
		<div class="msg">
			<div class="xr">
			<ul>
			<li><a onclick="morebox();">회원정보</a><img src="../img/dropClose.gif" onClick="moreboxClose()" height=10 width=10>
				<div id="morebox" class="morebox">
				<ul><li style="margin-top:2px;"><a href="" id="1" onmouseover="focus(this)">정보수정</a></li>
					<li><a href="" id="2" onmouseover="focus(this)">비번변경</a></li>	
					<li><a href="" id="3" onmouseover="focus(this)">회원탈퇴</a></li>
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
			</div><br/><br/>
			<div class="main2" style="float:left">
				<div class="photo" style="float:left"><img alt="" src="../img/profile.jpg"></div>
				<div class="Explain" style="float:left">이 곳은 권상우(덴데)님을 위한 공간입니다. <br/>
				회원님의 활동내역을 실시간으로 확인하실 수 있습니다.<br/>
				회원등급 : 레벨11(11/25)   포인트 : 1,362   가입일 : 2015.10.21 (1759일전)</div>
			</div>
		</div><!-- Ui종료  -->
	</div>
</body>
</html>