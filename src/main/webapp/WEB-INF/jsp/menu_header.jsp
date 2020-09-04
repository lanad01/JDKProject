<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

  <title>JDK������Ʈ</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/shop-homepage.css" rel="stylesheet">
  <!--  ��Ʈ   -->
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
/* ��Ӹ޴� ��Ÿ�� */
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
#sub-menu > li { /* ����޴� ��椷 */
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
// 		alert('�α����� �ʿ��� �۾��Դϴ�!');
		swal("","�α����� �ʿ��մϴ�!", "error");

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
			alert("����");
		}
	})
}
function fnLoginBtn(){
    $.ajax({
       async: true,
       type : 'POST',
       data : {"id" : $("#id").val(), "password" : $("#password").val() }, //�Է� �� jquery ������� ��������
       url : "../login/loginpost.html",
       success : function(data) {         
          if(data == 1){
          swal("���� �޽���","�α��� �����ϼ̽��ϴ�!", "success");
          location.href="../bbs/bbs.html?bbstype=freebbs";
          }else{
          swal("","�α��ο� �����ϼ̽��ϴ�!", "error");
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
      <a class="navbar-brand" href="../bbs/bbs.html?bbstype=freebbs">JDK</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive" style="margin-right:40px;">
        <ul class="navbar-nav ml-auto">
        <!--  ��α��� ������ �� indexController���� ������ ���� ������ -->
        <c:choose>
         <c:when test="${sessionScope.loginUser == null}">
         <li class="nav-item">
            <a class="nav-link" href="../login/login.html" onclick="">Sign In
              <span class="sr-only">(current)</span>
            </a>
          </li>
          </c:when>
         <c:otherwise> <!--  �α��� ������ ���� ��� -->
         <li class="nav-item">
         	<h2 style="font-family:'BMDOHYEON'; font-size:1.8em; color:#dcdcdc;">${sessionScope.loginUser }�� ȯ���մϴ� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
          </li>
         <li class="nav-item">
            <a class="nav-link" href="../login/logout.html" onclick="">Sign Out
              <span class="sr-only">(current)</span>
            </a>
          </li>
         </c:otherwise>
        </c:choose>
         <!--  ��α��� ���� ���� -->
        <c:choose>
        	<c:when test="${sessionScope.loginUser == null}">
          <li class="nav-item">
            <a class="nav-link" href="../register/register.html">Register</a>
          </li>
          	</c:when>
          	<c:otherwise>
          	
          	</c:otherwise>
        </c:choose>
          <li class="nav-item">
            <a class="nav-link" href="../myaccount/mypage.html">Account</a>
          </li>
          <li class="nav-item">
          	<input type="text" name="keyword" placeholder="���հ˻�" class="keyword" style="width:130px;" ></li> 
          <li class="nav-item">
          	<input type="button" name="keyword" class="searchButton" value="�˻�" style="width:60px; margin-left:10px; margin-top:7px;" ></li> 
        </ul>
      </div>
    </div>
  </nav>
  <!--  ��� �׺���̼� ���� -->
  
  <!--  ���θ޴� ���� -->
  <div id="topmenu">
	<div class="wrap">
		<ul style="list-style:none;">
				<li><a href=""><span>��ü�ۺ���</span></a>	</li>
		<li class="vline"></li>
				<li><a href=""><span>�����</span></a></li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=freebbs" target=""><span>�����Խ���</span></a>	</li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=exp" ><span>�����&��</span></a></li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=info"><span>����&��</span></a></li>
		<li class="vline"></li>
				<li><a href="../bbs/bbs.html?bbstype=qna"><span>���� �亯</span></a></li>
		<li>
			<nav role="navigation" class="drop">
  				<ul id="main-menu">
  	  				<li><font face='BMDOHYEON'><a href="../lifestory/lifestorymain.html?BODY=lifestory/lifestorymain">��Ȱ��</a></font>
     					<ul id="sub-menu">
       						<li><font face='BMDOHYEON' size="1.3" ><a href="#" aria-label="subemnu"><span>��&nbsp;���ް� ���巰�Ÿ� �; ���� ��Ȱ��</span></a></font></li>
       						<li><font face='BMDOHYEON' size="1.3" ><a href="#" aria-label="subemnu">��&nbsp;�����÷����� ��Ȱ��</a></font></li>			
       						<li><font face='BMDOHYEON' size="1.3" ><a href="#" aria-label="subemnu">��&nbsp;���̽����д���</a></font></li>
      					</ul>
    				</li>
    			</ul>
   			</nav>
  		</li>
		</ul>
	</div>
</div>
  <!--  ���� �޴� ���� -->
  
  <!-- �´� �׺���̼� -->
   <div class="container">
    <div class="row">
      <div class="col-lg-3" style="margin-top:25px;" >
        <div style="border:1px solid; padding:0px;  background-color:#dcdcdc">
        	<font face='BMDOHYEON'>&nbsp; ȸ���α���</font> 
        </div>
        <div  style="border:1px solid; padding:10px 0 15px 20px;">
        	<table>
        		<tr style="margin-left:5px;">
        			<th><font face='BMDOHYEON' size="2em" color="red"><a href="#" id="hit" class="list-group-item" onClick="hitBbs('hit');">���� �� ��</a></font></th>
          			<th><font face='BMDOHYEON' size="2em" color="red"><a href="#" id="rep" class="list-group-item" onClick="hitBbs('rep');">��� ���� ��</a></font></th>
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
		<!--  ���� ������â include�������� �սô�  -->
		<jsp:include page="/WEB-INF/jsp/${BODY}.jsp" flush="false"/>
		</div>
     </div>
	
  <!-- �´� �׺���̼� ���� -->
  	
</div>	
  <!-- Footer -->
  <footer class="py-5 bg-dark" style="margin-top:100px;">
    <div class="container" >
      <p class="m-0 text-center text-white" style="font-family: 'BMDOHYEON';">Copyright &copy; Your Website 2020</p>
   	  <p style="text-align:center;"><font color="white" style="font-family: 'BMDOHYEON';" >Ȩ������ �̿��� | �������� ��޹�ħ | �Խù� �����Ģ <br>
		Copyright 2020 JDKProject.co.kr All rights reserved.<br><br>
		Runtime 0.298
      </font><p>
    </div>
    <!-- /.container -->
  </footer>
	
   <!-- �α��� ���â -->
   <script src="../resources/vendor/jquery/jquery.min.js"></script>
   <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!--  Classname���� ã�°Ŵϱ�.. ../ �ٿ��� ���� ������ ������Ѵ� ���� -->
   <form action="" method="post">
<%--    <form action="../login/loginpost.html" method="post"> --%>
   <div id="modal" class="searchModal">
      <div class="search-modal-content">
         <a>�α���</a>
         <div class="row">
            <div class="col-sm-12">
               <div class="row">
                  <div class="col-sm-12"><!-- ���� �ǵ� �� �ִ� ��.. -->
                     <table style="">
                        <tr><td><a>���̵�</a></td>
                        
                        <tr><td><input type="text" id="id" name="id" maxlength="20"><font color="red"></font></td>
                           <td id="social" rowspan="2" style="padding-left:10px;" ><img alt="" src="../img/social1.gif" width=35 height=35></td>
                           <td id="social" rowspan="2"><img alt="" src="../img/social2.gif" width=35 height=35></td>
                           <td id="social" rowspan="2"><img alt="" src="../img/social3.gif" width=35 height=35></td>
                           <td id="social" rowspan="2"><img alt="" src="../img/social4.gif" width=35 height=35></td>
                        <tr><td><a>��й�ȣ</a></td>
                        <tr><td><input type="password" id="password" name="password" maxlength="20"/><font color="red"></font></td>
                     </table>   
                  </div><!--  ���� �ǵ� �� �ִ� �� -->
               </div>
            </div>
         </div>
         
         <hr>
         <div style="float:left; text-align:center;">
            <div style="float:left; cursor: pointer; background-color: #dcdcdc; text-align: center; margin-bottom:13px; width:100px; " >
               <input type="button" style="font-family:'BMDOHYEON'; font-size:0.8em; width:100px;"  value="�α���" onClick="fnLoginBtn();"/></div>
               
            <div style="float:left;  cursor: pointer; background-color: #dcdcdc; text-align: center; margin-bottom:13px; width:100px; margin-left:20px;" onClick="closeModal()">
               <input type="button" style="font-family:'BMDOHYEON'; font-size:0.8em; width:100px;" 
                  value="ȸ������" onClick="location.href='../register/register.html';"></div>
            <div style="float:left;  cursor: pointer; background-color: #dcdcdc; text-align: center; margin-bottom:13px; width:100px; margin-left:20px;" onClick="closeModal()">
               <input type="button" style="font-family:'BMDOHYEON'; font-size:0.8em; width:100px;" 
                  value="������" onClick="closeModal()"></div>
         </div>
      </div>
    </div>
    </form>
</body>
</html>