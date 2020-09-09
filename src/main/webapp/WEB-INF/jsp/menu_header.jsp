<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>JDK프로젝트</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/shop-homepage.css" rel="stylesheet">
  <!--  폰트   -->
  <link href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff' rel='stylesheet' type='text/css'>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<link href="<%=request.getContextPath()%>/WEB-INF/css/menuHeader.css" type="text/css" rel="stylesheet" />
<style type="text/css">
@font-face {
font-family: 'BMDOHYEON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff') format('woff');
font-weight: normal; font-style: normal; }
.navbar-brand { font-family: 'BMDOHYEON'; font-size:2.5em;}
#topmenu {padding-left:140px; padding-right:250px; padding-top:30px;}
#topmenu li{ float: left;    padding: 12px 4px 4px 4px;    margin-left: 22px;    height: 40px;}
#topmenu dt{ display:none;}
#topmenu .wrap {   height: 50px;  border-bottom: #000000 double 3px; border-top: #000000 double 3px; }
.wrap a { color: black; text-decoration: none; }
.wrap a:hover { background-color:#dcdcdc; }
.wrap li{ font-family: 'BMDOHYEON';}
.keyword{ margin-top:7px;}
.bottom{ margin-left:100px;}
#navbarResponsive{ padding-right:70px;}
/* 드롭메뉴 스타일 */
 .drop { /* nav */
   width: 100%;   display: flex;    justify-content: center; 
  position: relative;   z-index:1 
 } 
#main-menu > li {
  margin: -12px 60px 16px -27px	;
  position: relative;
  list-style: none
}
#main-menu > li > a {
  font-size: 0.85rem;
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
}
#sub-menu {
  border:1px solid black;
  width:220px; hegiht:20px;
  position: absolute;
  background:#ffffff;
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
  margin: 0px -40px 30px 0px;
}
#sub-menu > li { /* 서브메뉴 배경ㅇ */
  text-decoration: none;
  list-style: none;
  margin: -10px 100px 0px -40px;
  width:220px;
}
#sub-menu > li >  a {
  text-decoration: none;
  margin-right:100px;
  width:150px;
}
#main-menu > li:hover #sub-menu {
  opacity: 1;
  visibility: visible;
}
#sub-menu > li >  a:hover {
 text-decoration: none;
}
.hit > span{  text-align:left;}
/* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #dcdcdc;
border:5px double black;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
width: 30%; /* Could be more or less, depending on screen size */
height:40%;
}
.searchModal a{font-family:'BMDOHYEON'; size:1.3em; }
.search-modal-content table{ border-top:2px solid black; }
#social { padding-bottom:13px;}
.register {font-family:'BMDOHYEON'; font-size:0.8em; color:black; background:#f5f5f5; border:1px solid black; }
#pa{ }
</style>

<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script>
$(function(){
// 	message('notice','Hello World!');
	hitBbs('hit');
	var loginmodal = '${Loginmodal}';
	if(loginmodal == 'toLogin'){
// 		alert('로그인이 필요한 작업입니다!');
		swal("","로그인이 필요합니다!", "error");

	loginpopup(); 
	}else{
	}
	
});
function loginpopup() {
			$("#modal").show();
};
function closeModal() {
$('.searchModal').hide();
};
function hitBbs(input){
	$.ajax({
		async: true,
		type : 'POST',
		data : { "input": input } ,
		dataType : "json",
		url : "../navi/hit.html",
		success : function(data){
			var list_Length = Object.keys(data).length;
			for(i=0; i<list_Length; i++){
				if(data[i].title.length > 18 ) {
					data[i].title=data[i].title.substring(0,17)+"....";
				}
				document.getElementById("pa"+(i+1)).innerHTML=data[i].title;
				document.getElementById("li"+(i+1)).href="../bbs/bbsview.html?seqno="+data[i].seqno;
			}
		},error : function(e){
			alert("실패");
		}
	})
}
function fnLoginBtn(){
    $.ajax({
       async: true,
       type : 'POST',
       data : {"id" : $("#id").val(), "password" : $("#password").val() }, //입력 값 jquery 방식으로 가져오기
       url : "../login/loginpost.html",
       success : function(data) {         
          if(data == 1){
          swal("성공 메시지","로그인 성공하셨습니다!", "success");
          location.href="../bbs/bbs.html?bbstype=freebbs";
          }else{
          swal("","로그인에 실패하셨습니다!", "error");
          }
       },error : function(e){
       }
    });
 }
</script>

<body>        
  
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="../bbs/bbs.html">JDK</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive" style="margin-right:40px;">
        <form id="searchFromHeader" action="../bbs/bbs.html" method="post">
       	 	<input type="hidden" name="search" value="yes">
        	<input type="hidden" name="bbstype" id="bbstype" value="main" />
         	<input type="hidden" name="searchKey" id="bbstype" value="schTotal" />
        <ul class="navbar-nav ml-auto">
        <!--  비로그인 상태일 시 indexController에서 보낸다 세션 정보는 -->
        <c:choose>
         <c:when test="${sessionScope.loginUser == null}"> <!--  비로그인 ㅑ  -->
         <li class="nav-item">
            <a class="nav-link" href="../login/login.html" onclick="">Sign In
              <span class="sr-only">(current)</span>
            </a>
          </li>
          </c:when>
         <c:otherwise> <!--  로그인 정보가 있을 경우 -->
         <li class="nav-item">
         	<h2 style="font-family:'BMDOHYEON'; font-size:1.8em; color:#dcdcdc; margin-left:30px;">${sessionScope.loginUser }님 환영합니다 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
          </li>
         <li class="nav-item">
            <a class="nav-link" href="../login/logout.html" onclick="">Sign Out
              <span class="sr-only">(current)</span>
            </a>
          </li>
         </c:otherwise>
        </c:choose>
         <!--  비로그인 상태 종료 -->
        <c:choose>
        	<c:when test="${sessionScope.loginUser == null}">
          	<li class="nav-item">
            <a class="nav-link" href="../register/register.html">Register</a>
         	</li>
          	</c:when>
        </c:choose>
        	
         	<li class="nav-item">
            <a class="nav-link" href="../myaccount/mypage.html">Account</a>
          	</li>
         	<li class="nav-item" style="margin-left:10px;">
          	<input type="text" name="keyword" placeholder="통합검색" value="" size="22" ></li> 
         	<li class="nav-item">
          	<input type="submit" class="searchButton" value="검색" style="width:60px; margin-left:10px; margin-top:0px;" >
          	
            </li>   	
        </ul>
        </form>
      </div>
    </div>
  </nav>
  <!--  상단 네비게이션 종료 -->
  
  <!--  메인메뉴 시작 -->
  <div id="topmenu">
	<div class="wrap">
		<ul style="list-style:none;">
				<li><a href="../bbs/bbs.html?bbstype=whole"><span>전체글보기</span></a>	</li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=ganyum"><span>개념글</span></a></li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=freebbs" target=""><span>자유게시판</span></a>	</li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=exp" ><span>경험담&썰</span></a></li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=info"><span>정보&팁</span></a></li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=qna"><span>질문 답변</span></a></li>
		<li>
			<nav role="navigation" class="drop">
  				<ul id="main-menu">
  	  				<li><font face='BMDOHYEON'><a href="../lifestory/lifestorymain.html?BODY=lifestory/lifestorymain">생활기</a></font>
     					<ul id="sub-menu">
       						<li><font face='BMDOHYEON' size="1.3" ><a href="../bbs/bbs.html?bbstype=life&user=1" aria-label="subemnu"><span>▶&nbsp;별달고 꺼드럭거리 싶어서 쓰는 생활기</span></a></font></li>
       						<li><font face='BMDOHYEON' size="1.3" ><a href="#" aria-label="subemnu">▶&nbsp;에스컬레이터 생활기</a></font></li>			
       						<li><font face='BMDOHYEON' size="1.3" ><a href="#" aria-label="subemnu">▶&nbsp;보이쉬재패니즈</a></font></li>
      					</ul>
    				</li>
    			</ul>
   			</nav>
  		</li>
		</ul>
	</div>
</div>
  <!--  메인 메뉴 종료 -->
  
  <!-- 좌단 네비게이션 -->
   <div class="container">
    <div class="row">
      <div class="col-lg-3" style="margin-top:25px;" >
        <div style="border:1px solid; padding:0px;  background-color:#dcdcdc">
        	<font face='BMDOHYEON'>&nbsp; 회원로그인    ${sessionScope.loginUser }</font> 
        </div>
        <div  style="border:1px solid; padding:10px 0 15px 20px;">
        	<table>
        		<tr style="margin-left:5px;">
        			<th><font face='BMDOHYEON' size="2em" color="red"><a href="#" id="hit" class="list-group-item" onClick="hitBbs('hit');">많이 본 글</a></font></th>
          			<th><font face='BMDOHYEON' size="2em" color="red"><a href="#" id="rep" class="list-group-item" onClick="hitBbs('rep');">댓글 많은 글</a></font></th>
          		</tr>
          	</table>
          	<table class="hit" style=" font-family:'BMDOHYEON'; font-size:0.8em; color:black; margin-top:7px; ">
         		<tr><td>&#9312; &nbsp;</td><td><a href="" id="li1"><span id="pa1"></span></a></td></tr>
         		<tr><td>&#9313; &nbsp;</td><td><a href="" id="li2"><span id="pa2"></span></a></td></tr>
         		<tr><td>&#9314; &nbsp;</td><td><a href="" id="li3"><span id="pa3"></span></a></td></tr>
         		<tr><td>&#9315; &nbsp;</td><td><a href="" id="li4"><span id="pa4"></span></a></td></tr>
         		<tr><td>&#9316; &nbsp;</td><td><a href="" id="li5"><span id="pa5"></span></a></td></tr>
				<tr><td>&#9317; &nbsp;</td><td><a href="" id="li6"><span id="pa6"></span></a></td></tr>
				<tr><td>&#9318; &nbsp;</td><td><a href="" id="li7"><span id="pa7"></span></a></td></tr>
				<tr><td>&#9319; &nbsp;</td><td><a href="" id="li8"><span id="pa8"></span></a></td></tr>
				<tr><td>&#9320; &nbsp;</td><td><a href="" id="li9"><span id="pa9"></span></a></td></tr>
				<tr><td>&#9321; &nbsp;</td><td><a href="" id="li10"><span id="pa10"></span></a></td></tr>
			</table>
        </div>
      </div>
      <div id="changejsp">
		<!--  메인 콘텐츠창 include형식으로 합시다  -->
		<jsp:include page="/WEB-INF/jsp/${BODY}.jsp" flush="false"/>
		</div>
     </div>
	
  <!-- 좌단 네비게이션 종료 -->
  	
</div>	
  <!-- Footer -->
  <footer class="py-5 bg-dark" style="margin-top:100px;">
    <div class="container" >
      <p class="m-0 text-center text-white" style="font-family: 'BMDOHYEON';">Copyright &copy; Your Website 2020</p>
   	  <p style="text-align:center;"><font color="white" style="font-family: 'BMDOHYEON';" >홈페이지 이용약관 | 개인정보 취급방침 | 게시물 게재원칙 <br>
		Copyright 2020 JDKProject.co.kr All rights reserved.<br><br>
		Runtime 0.298
      </font><p>
    </div>
    <!-- /.container -->
  </footer>
	
   <!-- 로그인 모달창 -->
   <script src="../resources/vendor/jquery/jquery.min.js"></script>
   <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!--  Classname으로 찾는거니까.. ../ 붙여서 상위 폴더를 가줘야한다 상우야 -->
   <form action="" method="post">
<%--    <form action="../login/loginpost.html" method="post"> --%>
   <div id="modal" class="searchModal">
      <div class="search-modal-content">
         <a>로그인</a>
         <div class="row">
            <div class="col-sm-12">
               <div class="row">
                  <div class="col-sm-12"><!-- 내가 건들 수 있는 곳.. -->
                     <table style="">
                        <tr><td><a>아이디</a></td>
                        
                        <tr><td><input type="text" id="id" name="id" maxlength="20"><font color="red"></font></td>
                           <td id="social" rowspan="2" style="padding-left:10px;" ><img alt="" src="../img/social1.gif" width=35 height=35></td>
                           <td id="social" rowspan="2"><img alt="" src="../img/social2.gif" width=35 height=35></td>
                           <td id="social" rowspan="2"><img alt="" src="../img/social3.gif" width=35 height=35></td>
                           <td id="social" rowspan="2"><img alt="" src="../img/social4.gif" width=35 height=35></td>
                        <tr><td><a>비밀번호</a></td>
                        <tr><td><input type="password" id="password" name="password" maxlength="20"/><font color="red"></font></td>
                     </table>   
                  </div><!--  내가 건들 수 있는 곳 -->
               </div>
            </div>
         </div>
         
         <hr>
         <div style="float:left; text-align:center;">
            <div style="float:left; cursor: pointer; background-color: #dcdcdc; text-align: center; margin-bottom:13px; width:100px; " >
               <input type="button" style="font-family:'BMDOHYEON'; font-size:0.8em; width:100px;"  value="로그인" onClick="fnLoginBtn();"/></div>
               
            <div style="float:left;  cursor: pointer; background-color: #dcdcdc; text-align: center; margin-bottom:13px; width:100px; margin-left:20px;" onClick="closeModal()">
               <input type="button" style="font-family:'BMDOHYEON'; font-size:0.8em; width:100px;" 
                  value="회원가입" onClick="location.href='../register/register.html';"></div>
            <div style="float:left;  cursor: pointer; background-color: #dcdcdc; text-align: center; margin-bottom:13px; width:100px; margin-left:20px;" onClick="closeModal()">
               <input type="button" style="font-family:'BMDOHYEON'; font-size:0.8em; width:100px;" 
                  value="나가기" onClick="closeModal()"></div>
         </div>
      </div>
    </div>
    </form>
</body>
</html>