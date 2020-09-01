<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
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
<script>
function close2(frm){
	document.getElementById("main").style.display = "none";
	self.close();
	window.opener.location.reload();
	var result = confirm("������ �����Ͻðڽ��ϱ�?");
	if(result == false) {
		alert('��й�ȣ ������ ��� �Ǿ����ϴ�.');
		return false;
	}else{
	return true;
	}
}
function pwdCheck(){
	var prepwd=document.getElementById("prepwd").value; 
	var userpwd=document.getElementById("userpwd").value;
	if(prepwd!=userpwd){
		document.getElementById("error").innerHTML="��ϵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�!!";
	}else if(prepwd==userpwd){
		document.getElementById("error").innerHTML="��ϵ� ��й�ȣ�� ��ġ�մϴ�.";
	}
}
function pwdCheck2(){
	var newpwd=document.getElementById("newpwd").value;
	var userpwd=document.getElementById("userpwd").value;
	if(newpwd==userpwd){
		document.getElementById("error2").innerHTML="���� ��й�ȣ�� �ٸ� ��й�ȣ�� �������ּ���.";
	}else if(newpwd!=userpwd){
		document.getElementById("error2").innerHTML="��ȿ�� ��й�ȣ�Դϴ� ^^";
	}
}
function pwdCheck3(){
	var newpwd=document.getElementById("newpwd").value;
	var pwdcheck=document.getElementById("pwdCheck").value;
	if(newpwd!=pwdcheck){
		document.getElementById("error3").innerHTML="��й�ȣ�� ��ġ���� �ʽ��ϴ�!!";
	}else if(newpwd==pwdcheck){
		document.getElementById("error3").innerHTML="��й�ȣ�� ��ġ�մϴ�.";
	}
}

</script>
</head>
<body>
	<div id="main" style="display:block;">
		<div class="msg">
			<form:form action="../myaccount/pwdchange.html" onSubmit="return close2(this);" method="post" modelAttribute="user" name="fm">
				<form:hidden path="user_no" id="user_no"/>
				<form:hidden path="password" id="userpwd"/>
				<form:hidden path="id" id="id"/>
				<div class="msg">
					<span style="margin-left:30px; margin-bottom:10px;"></span><font size="1.3em" color="blue"> (*)��й�ȣ�� �ֱ������� �����ϴ� ���� �����ϴ�.</font><br /> <br/>
					<table>
						<tr><td class="pwd">���� ��й�ȣ</td><td><input type="password" name="prepwd" id="prepwd" >
							<a onClick="pwdCheck()" style="background:#dcdcdc; border:1px solid black;"><font size="1.5">��ġ Ȯ��</font></a>
							<div id="error" style="color:red; margin-top:5px; font-size:0.8em;"></div>
							</td>
						<tr><td class="pwd">���� ��й�ȣ</td><td><input type="password" name="newpwd" id="newpwd" onblur="pwdCheck2()">
							<div id="error2" style="color:red; margin-top:5px; font-size:0.8em;"></div>
							</td>
						<tr><td class="pwd">��й�ȣ Ȯ��</td><td><input type="password" name="newpwdchk" id="pwdCheck" onblur="pwdCheck3()">
							<div id="error3" style="color:red; margin-top:5px; font-size:0.8em;"></div>
						<tr><td>&nbsp;</td></tr>
						<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="��й�ȣ ����"></td>
						</tr>
					</table>
				</div>
			</form:form>
		</div>
	</div>
	
</body>
</html>