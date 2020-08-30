<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

<link
	href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/mypage.css">
<link
	href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'
	rel='stylesheet' type='text/css'>
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
	font-size: 1em;
	font-family: 'BMDOHYEON';
	font-color: red;
	border-top: 3px solid black;
	padding: 20px 0 20px 0;
	width: 700px;
}

.key {
	font-size: 1em;
	font-family: 'BMDOHYEON';
	font-color: red;
	background:silver;
}

.modify tr {
	height:60px; width:100px;
	border-bottom:1px solid silver;
	margin-top:5px; 
	margin-bottom:5px;
}
.modify td{ margin-top:5px; 
	margin-bottom:5px;}

h5 {color: #ff0000;}

input {
	height: 25px;
	
}

.submitbox {
	top: 50%;
	right: 50%;
}

.btngray {
	font-family: 'BMDOHYEON';
	cursor: pointer;
	border: #666666 solid 1px;
	background: #B3B3B3 left bottom repeat-x;
	color: #ffffff;
	height: 21px;
}

.btnblue {
	font-family: 'BMDOHYEON';
	cursor: pointer;
	border: #3399DD solid 1px;
	background: #33C9FD left bottom repeat-x;
	color: #ffffff;
	height: 21px;
}

#font {
	font-family: 'BMDOHYEON';
	font-size: 0.7em;
}
</style>
</head>
<script type="text/javascript">
	function morebox() {
		document.getElementById("morebox").style.display = "block";
	}
	function moreboxClose() {
		document.getElementById("morebox").style.display = "none";
	}
	function quizDisplay(quiztext) {
	    var selection = quiztext;
		document.getElementById("quiz").value=selection;
	    return true;
	}
</script>
<body>
	<div class="main">
		<div class="msg">
			<form:form action="../register/modify.html?page=2" modelAttribute="user" method="post" enctype="multipart/form-data">
				<div class="msg">
					<span>(*)</span> ǥ�ð� �ִ� �׸��� �ݵ�� �Է��ؾ� �մϴ�.<br /> ������ �ۼ��� ������ ��� ������
					�����ǰų� ���Ƿ� ����ó���� �� ������ ������ �ּ���.
				</div>
				<form:hidden path="user_no"/>
				<form:hidden path="register_date"/>
				<table class="modify">
					<tr><td>�̸� <font color="red" id="font">*</font> :  </td>
						<td><form:input path="name" maxlength="20"/>
						<font color="red" id="font" ><form:errors path="name"/></font></td>
					</tr>
					<tr><td>�г���  <font color="red" id="font">*</font> :  </td>
						<td><form:input path="nick" maxlength="20"/>
						<font color="red" id="font" ><form:errors path="name"/></font>
						<div><font size="1.0">�г����� �ڽ��� ǥ���� �� �ִ� �ܾ�� 20�ڱ��� �����Ӱ� ����� �� �ֽ��ϴ�.</font></div></td>
					</tr>
					<tr><td>����  <font color="red" id="font"></font> :  </td>
						<td>
						<form:select path="birth_date">
						<c:forEach var="i" begin="0" end="${2016-1930}">
  						  <c:set var="yearOption" value="${2016-i}" />
    						<form:option value="${yearOption}" label="${yearOption }"/>
						</c:forEach>
						</form:select>
						</td>
					</tr>
					<tr><td>���� : </td>
						<td><form:radiobutton path="gender" value="M" checked="checked"/><font face='BMDOHYEON' size="0.9em">����</font>
							<form:radiobutton path="gender" value="F" /><font face='BMDOHYEON' size="0.9em">����</font>
						</td>
					</tr>
					<tr><td>���̵� <font color="red" id="font">*</font> :  </td>
						<td><form:input path="id" maxlength="8" disabled="true"/>
						<font color="red" id="font" ><form:errors path="id"/></font>
						<div><font color="red" size="1.0">���̵�� �ٲ� �� �����ϴ�!!</font></div>
						</td>
					</tr>
					<tr><td>��й�ȣ <font color="red" id="font">*</font> :  </td>
						<td><form:input path="password" maxlength="20" disabled="true"/>
						<div><font color="red" size="1.0">��й�ȣ ���� ����� ������ּ���!!</font></div>
						</td>
					</tr>
					<tr><td>���ã�� ����  <font color="red" id="font">*</font> : </td>
						<td>
						<select class="pw_q1" onchange="quizDisplay(this.options[this.selectedIndex].text)">
						<option value="">&nbsp;+ �����Ͻʽÿ�.</option>
						<option value="" selected disabled>-------------------------------</option>
						<option value="���� �����ϴ� ĳ���ʹ�?">������ �����ϴ� ĳ���ʹ�?</option>
						<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">��Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
						<option value="�ڽ��� �λ� �¿����?">���ڽ��� �λ� �¿����?</option>
						<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">���ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
						<option value="������� ���� �������� ģ�� �̸���?">��������� ���� �������� ģ�� �̸���?</option>
						<option value="���� ��￡ ���� ������ ������?">������ ��￡ ���� ������ ������?</option>
						<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">��ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
						<option value="�ٽ� �¾�� �ǰ� ���� ����?">���ٽ� �¾�� �ǰ� ���� ����?</option>
						<option value="���� ������ �� ��ȭ��?">������ ������ �� ��ȭ��?</option>
						<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">������ å �߿��� �����ϴ� ������ �ִٸ�?</option>
						<option value="��￡ ���� �߾��� ��Ҵ�?">����￡ ���� �߾��� ��Ҵ�?</option>
						<option value="�λ� ��� ���� å �̸���?">���λ� ��� ���� å �̸���?</option>
						<option value="�ڽ��� ���� ��1ȣ��?">���ڽ��� ���� ��1ȣ��?</option>
						<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">���޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
						<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">���ڽ��� �ι�°�� �����ϴ� �ι���?</option>
						<option value="�ƹ����� ������?">���ƹ����� ������?</option>
						<option value="��Ӵ��� ������?">����Ӵ��� ������?</option>
						</select><br/>
						<div><font size="1.0"><form:input type="text" path="quiz" id="quiz" placeholder="���� �ۼ�" size="40" /></font></div>
						<font color="red" id="font" ><form:errors path="quiz"/></font>
						</td>
					</tr>
					<tr><td>��� ã�� �亯   <font color="red" id="font">*</font> : </td>
						<td><form:input type="text"  path="answer" class="input" />
						<font color="red" id="font" ><form:errors path="answer"/></font>
						<div>
						<font size="1.0">��й�ȣã�� ������ ���� �亯�� ȥ�ڸ� �� �� �ִ� �ܾ ��ȣ�� �Է��� �ּ���.<br />
						��й�ȣ�� ã�� �� �ʿ��ϹǷ� �ݵ�� ����� �ּ���.</font>
						</div>
						</td>
					</tr>
					<tr><td>�̸��� : </td>
						<td><form:input type="text" path="email" size="35" class="input" />
						<font color="red" id="font" ><form:errors path="email"/></font>
						</td>
					</tr>
					<tr><td>���� : </td>
						<td><form:input path="area" size="15" class="input" />
						</td>
					</tr>
					<tr><td>���� : </td>
						<td><input type="file" name="picture"/></td>
					</tr>
					<tr style="border-bottom:none; ">
					<td>
					<div class="submitbox" style="padding-left:50px;">
					<input type="submit" value="��������" class="btnblue" />
					</div>
					</td>
				</table>
			</form:form>
		</div>
	</div>
	<!-- Ui����  -->
</body>
</html>