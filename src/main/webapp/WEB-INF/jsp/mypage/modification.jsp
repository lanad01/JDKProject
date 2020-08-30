<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JDK - ȸ�� ���� ����</title>
<link href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/modification.css">
<style type="text/css">
</style>
</head>
<script type="text/javascript">
function quizDisplay(quiztext) {
    var selection = quiztext;
	document.getElementById("quiz").value=selection;
    return true;
}</script>
<body>
<div style="padding:30px 0 0 15px;">
<form:form action="../register/registerpost.html" modelAttribute="user" method="post" enctype="multipart/form-data">
	<h2><font face='BMDOHYEON'>ȸ������</font></h2>
	<div class="msg">
		<span>(*)</span> ǥ�ð� �ִ� �׸��� �ݵ�� �Է��ؾ� �մϴ�.<br />
		������ �ۼ��� ������ ��� ������ �����ǰų� ���Ƿ� ����ó���� �� ������ ������ �ּ���.
	</div>
<table class="joinTable" summary="ȸ������ �⺻������ �Է¹޴� ǥ�Դϴ�.">
<colgroup> 
<col width="100"> 
<col> 
</colgroup>
<thead>
<tr>
	<th scope="col"></th>
	<th scope="col"></th>
</tr>
</thead>
<tbody> <!--  ������ �ۼ� ���� -->
<tr>
	<td class="key">�̸�(�Ǹ�)<h5>*</h5></td>
		<td><form:input type="text" path="name" maxlength="10" class="input" />
		<font color="red" id="font" ><form:errors path="name"/></font>
		<div>�̸��� �ݵ�� �����ּž� �մϴ�.</div>
		</td>
	</tr>
	<tr>
		<td class="key">�г���<h5>*</h5></td>
		<td><form:input type="text" path="nick" value="" maxlength="20" class="input" onblur=""/>
		<font color="red" id="font" ><form:errors path="nick"/></font>
	    <!--  onblur : ���콺 Ŀ���� ���������� ���� �̺�Ʈ -->
		<span class="hmsg" id="hLayernic"></span>
		<div>�г����� �ڽ��� ǥ���� �� �ִ� �ܾ�� 20�ڱ��� �����Ӱ� ����� �� �ֽ��ϴ�.</div>
		</td>
	</tr>
	<tr>
		<td class="key">�������</td>
		<td>
		<form:select path="birth_date">
		<c:forEach var="i" begin="0" end="${2016-1930}">
  		  <c:set var="yearOption" value="${2016-i}" />
    		<form:option value="${yearOption}" label="${yearOption }"/>
		</c:forEach>
		</form:select>
		</td>
	</tr>
<%-- 		<formselect name="birth_2"> --%>
<!-- 		<option value="">�� -->
<!-- 			<option value="01">1 -->
<!-- 			<option value="02">2 -->
<!-- 			<option value="03">3 -->
<!-- 			<option value="04">4 -->
<!-- 			<option value="05">5 -->
<!-- 			<option value="06">6 -->
<!-- 			<option value="07">7 -->
<!-- 			<option value="08">8 -->
<!-- 			<option value="09">9 -->
<!-- 			<option value="10">10 -->
<!-- 			<option value="11">11 -->
<!-- 			<option value="12">12 -->
<!-- 		</select> -->
<!-- 		<select name="birth_3"> -->
<!-- 		<option value="">�� -->
<%-- 		<c:forEach var="i" begin="1" end="31"> --%>
<%--   		  <c:set var="day" value="${i}" /> --%>
<%--     		<option value="${day}">${day} --%>
<%-- 		</c:forEach> --%>
<!-- 		</select> -->
<!-- 		</td> -->
<!-- 	</tr> -->
	<tr>
		<td class="key">����</td>
		<td class="shift">
			<form:radiobutton path="gender" value="M" checked="checked"/><font face='BMDOHYEON' size="0.9em">����</font>
			<form:radiobutton path="gender" value="F" /><font face='BMDOHYEON' size="0.9em">����</font>
		</td>
	</tr>	
	<tr>
	<td class="key">���̵�<h5>*</h5></td>
		<td>
			<form:input type="text" path="id" maxlength="12" class="input" onblur=""/>
			<font color="red" id="font" ><form:errors path="id"/></font>
			<span class="hmsg" id="hLayerid"></span>
			<div>4~12���� ����(�ҹ���)�� ���ڸ� ����� �� �ֽ��ϴ�.</div>
		</td>
	</tr>
	<tr>
		<td class="key">��й�ȣ<h5>*</h5></td>
		<td><form:password path="password" maxlength="20" class="input" />
		<font color="red" id="font" ><form:errors path="password"/></font>
			<div>4~12���� ������ ���ڸ� ����� �� �ֽ��ϴ�.</div>
		</td>
	</tr>
	<tr>
		<td class="key">��й�ȣ Ȯ��<h5>*</h5></td>
		<td>
		<form:password  path="pwdCheck"  maxlength="20" class="input" />
		<font color="red" id="font" ><form:errors path="pwdCheck"/></font>
		<div>��й�ȣ�� �ѹ� �� �Է��ϼ���. ��й�ȣ�� ���� �ʵ��� �����Ͻñ� �ٶ��ϴ�.</div>
		</td>
	</tr>
	<tr>
		<td class="key">���ã�� ����<h5>*</h5></td>
		<td>
			<select class="pw_q1" onchange="quizDisplay(this.options[this.selectedIndex].text)">
				<option value="">&nbsp;+ �����Ͻʽÿ�.</option>
				<option value="">-----------------------------------------------------------------------------</option>
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
		<div><form:input type="text" path="quiz" id="quiz" plackholder="���� �ۼ�"  /></div>
		<font color="red" id="font" ><form:errors path="quiz"/></font>
		</td>
	</tr>
	<tr>
		<td class="key">���ã�� �亯<h5>*</h5></td>
		<td><form:input type="text"  path="answer" class="input" />
		<font color="red" id="font" ><form:errors path="answer"/></font>
		<div>
		��й�ȣã�� ������ ���� �亯�� ȥ�ڸ� �� �� �ִ� �ܾ ��ȣ�� �Է��� �ּ���.<br />
		��й�ȣ�� ã�� �� �ʿ��ϹǷ� �ݵ�� ����� �ּ���.
		</div>
		</td>
	</tr>
	<tr>
		<td class="key">�̸���</td>
		<td><form:input type="text" path="email" size="35" class="input" />
		<font color="red" id="font" ><form:errors path="email"/></font>
		<span class="hmsg" id="hLayeremail"></span></td>
	</tr>
	<tr>
		<td class="key">����</td>
		<td><form:input path="area" size="15" class="input" />
		
		</td>
	</tr>
	<tr>
		<td class="key">����</td>
		<td><input type="file" name="picture"/>
	</td>
	</tr>
	<tr>
		<td></td>
		<td><div class="submitbox">
			<input type="submit" value="��������" class="btnblue" />
		</div></td>
	</tbody>
</table>
</form:form>
</div>
</body>
</html>