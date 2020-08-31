<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	font-family: 'BMDOHYEON';
	font-color: red;
	padding: 15px 0 0 0;
	width: 700px;
}
table td{padding-left:20px;}
</style>
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script>
	function pwdCheck() {
		var pwd = document.getElementById("inputpwd").value;
		var userpwd = document.getElementById("userpwd").value;
		if (pwd != userpwd) {
			document.getElementById("error").innerHTML = "등록된 비밀번호와 일치하지 않습니다!!";
			
		} else if (pwd == userpwd) {
			document.getElementById("error").innerHTML = "등록된 비밀번호와 일치합니다.";
			var but=document.getElementById("deletebutton");
			but.disabled=false;
		}
	}
	function button_event(){
		var form1=document.deleteForm;
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		    form1.submit();
		}else{   //취소
		    return false;
		}
	}
</script>
</head>
<body>
	<form:form action="../myaccount/delete.html" name="deleteForm" method="post" modelAttribute="user">
		<form:hidden path="user_no" id="user_no" />
		<form:hidden path="password" id="userpwd" />
		<div class="msg">
			<font size="2em" color="blue">회원탈퇴를 원하시면 비밀번호를 입력하신 후 회원탈퇴 버튼을
				클릭해 주세요. <br />탈퇴하시면 회원정보가 데이터베이스에서 완전히 삭제됩니다.
			</font><br /> <br />
			<table>
				<tr>
					<td class="pwd">비밀번호</td>
					<td><input type="password" name="prepwd" id="inputpwd" style="color:black;">
						<a onClick="pwdCheck()"	style="background: #dcdcdc; border: 1px solid black;"><font	size="1.5em">일치 확인</font></a>
						<div id="error"	style="color: red; margin-top: 5px; font-size: 0.8em;"></div>
					</td>
					<td><form:button onClick="button_event()" id="deletebutton" style="margin-bottom:2px;" disabled="true">회원탈퇴</form:button></td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>