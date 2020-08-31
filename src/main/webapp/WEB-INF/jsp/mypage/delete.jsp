<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			document.getElementById("error").innerHTML = "��ϵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�!!";
			
		} else if (pwd == userpwd) {
			document.getElementById("error").innerHTML = "��ϵ� ��й�ȣ�� ��ġ�մϴ�.";
			var but=document.getElementById("deletebutton");
			but.disabled=false;
		}
	}
	function button_event(){
		var form1=document.deleteForm;
		if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
		    form1.submit();
		}else{   //���
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
			<font size="2em" color="blue">ȸ��Ż�� ���Ͻø� ��й�ȣ�� �Է��Ͻ� �� ȸ��Ż�� ��ư��
				Ŭ���� �ּ���. <br />Ż���Ͻø� ȸ�������� �����ͺ��̽����� ������ �����˴ϴ�.
			</font><br /> <br />
			<table>
				<tr>
					<td class="pwd">��й�ȣ</td>
					<td><input type="password" name="prepwd" id="inputpwd" style="color:black;">
						<a onClick="pwdCheck()"	style="background: #dcdcdc; border: 1px solid black;"><font	size="1.5em">��ġ Ȯ��</font></a>
						<div id="error"	style="color: red; margin-top: 5px; font-size: 0.8em;"></div>
					</td>
					<td><form:button onClick="button_event()" id="deletebutton" style="margin-bottom:2px;" disabled="true">ȸ��Ż��</form:button></td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>