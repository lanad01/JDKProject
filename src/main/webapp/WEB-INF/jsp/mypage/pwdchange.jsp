<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style type="text/css">
@font-face {
	font-family: 'BMDOHYEON';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
.msg {
	font-size: 0.9em;
	font-family: 'BMDOHYEON';
	font-color: red;
	padding: 15px 0 0 20px;
	width: 700px;
}
.pwd{ border-bottom:2px solid #dcdcdc;}
</style>
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
function close3(){
	var result = confirm("정말로 변경하시겠습니까?");
	if(result == false)	return false;
	else {
		return true;	
	}
	
}
function pwdCheck(){
	var prepwd=document.getElementById("prepwd").value; 
	var userpwd=document.getElementById("userpwd").value;
	if(prepwd!=userpwd){
		document.getElementById("error").innerHTML="등록된 비밀번호와 일치하지 않습니다!!";
	}else if(prepwd==userpwd){
		document.getElementById("error").innerHTML="등록된 비밀번호와 일치합니다.";
	}
}
function pwdCheck2(){
	var newpwd=document.getElementById("newpwd").value;
	var userpwd=document.getElementById("userpwd").value;
	if(newpwd==userpwd){
		document.getElementById("error2").innerHTML="기존 비밀번호와 다른 비밀번호로 설정해주세요.";
	}else if(newpwd!=userpwd){
		document.getElementById("error2").innerHTML="유효한 비밀번호입니다 ^^";
	}
}
function pwdCheck3(){
	var newpwd=document.getElementById("newpwd").value;
	var pwdcheck=document.getElementById("pwdCheck").value;
	if(newpwd!=pwdcheck){
		document.getElementById("error3").innerHTML="비밀번호가 일치하지 않습니다!!";
	}else if(newpwd==pwdcheck){
		document.getElementById("error3").innerHTML="비밀번호가 일치합니다.";
	}
}
</script>
</head>
<body>
	<div id="main" style="display:block;">
		<div class="msg">
			<form:form action="../myaccount/pwdchange.html" onSubmit="return close3();" method="post" modelAttribute="user" name="fm">
				<form:hidden path="user_no" id="user_no"/>
				<form:hidden path="password" id="userpwd"/>
				<form:hidden path="id" id="id"/>
				<div class="msg">
					<span style="margin-left:30px; margin-bottom:10px;"></span><font size="1.3em" color="blue"> (*)비밀번호는 주기적으로 변경하는 것이 좋습니다.</font><br /> <br/>
					<table>
						<tr><td class="pwd">현재 비밀번호</td><td><input type="password" name="prepwd" id="prepwd" >
							<a onClick="pwdCheck()" style="background:#dcdcdc; border:1px solid black;"><font size="1.5">일치 확인</font></a>
							<div id="error" style="color:red; margin-top:5px; font-size:0.8em;"></div>
							</td>
						<tr><td class="pwd">변경 비밀번호</td><td><input type="password" name="newpwd" id="newpwd" onblur="pwdCheck2()">
							<div id="error2" style="color:red; margin-top:5px; font-size:0.8em;"></div>
							</td>
						<tr><td class="pwd">비밀번호 확인</td><td><input type="password" name="newpwdchk" id="pwdCheck" onblur="pwdCheck3()">
							<div id="error3" style="color:red; margin-top:5px; font-size:0.8em;"></div>
						<tr><td>&nbsp;</td></tr>
						<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="비밀번호 변경"></td>
						</tr>
					</table>
				</div>
			</form:form>
		</div>
	</div>
	
</body>
</html>