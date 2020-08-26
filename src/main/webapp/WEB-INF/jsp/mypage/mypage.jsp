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
<link rel="stylesheet" href="../css/mypage.css">
<style type="text/css">

</style>
</head>
<script type="text/javascript">
	function morebox() {
		document.getElementById("morebox").style.display = "block";
	}
	function moreboxClose() {
		document.getElementById("morebox").style.display = "none";
	}
</script>
<body>
	<div class="main">
		<div class="header">
			<h2><font face='BMDOHYEON'>����������</font></h2>
		</div>
		<div class="msg">
			<div class="xr">
				<ul>
					<li><a onclick="morebox();">ȸ������</a><img
						src="../img/dropClose.gif" onClick="moreboxClose()" height=10 width=10>
						<div id="morebox" class="morebox">
							<ul>
								<li style="margin-top: 2px;"><a href="" id="1"	onmouseover="focus(this)">��������</a></li>
								<li><a href="" id="2" onmouseover="focus(this)">�������</a></li>
								<li><a href="" id="3" onmouseover="focus(this)">ȸ��Ż��</a></li>
							</ul>
						</div>
					</li>
					<li><a href="">�Խù�</a></li>
					<li><a href="">���</a></li>
					<li><a href="">�����ǰ�</a></li>
					<li><a href="">ĳ����</a></li>
					<li><a href="">����Ʈ</a></li>
					<li><a href="">���ӱ��</a></li>
				</ul>
			</div>
			<br/>
			<br/>
			<div class="rcontent">
				<div class="photo">
					<img alt="�� ����" src="${pageContext.request.contextPath}/upload/${USER.picture_url }"  
					width="100" height="70">
				</div>
				<div class="Explain">
					�� ���� ${USER.name }(${USER.nick })���� ���� �����Դϴ�. <br /> ȸ������ Ȱ�������� �ǽð����� Ȯ���Ͻ� �� �ֽ��ϴ�.<br />
					ȸ����� : ����11(11/25) ����Ʈ : 1,362 ������ : 
				</div>
			</div><br/><br/><br/><br/>
			<div class="myAcitivity" style="border-top:3px solid black; border-bottom:3px solid black; " >
			<table class="posttable" rules="all" style="border:2px dotted silver; margin-top:20px; margin-bottom:20px;">
				<tr><td class="region"><h5>���� ����� �Խù�</h5>
						<c:forEach var="myPost"  begin="0" end="10" varStatus="status">
							<li style="list-style:none;"><p>��${status.index }</p></li>
						</c:forEach>
					</td>
					
					<td class="region"><h5>�� �Խù��� �޸� ���</h5>
					<c:forEach var="myPost"  begin="0" end="10" varStatus="status">
							<li style="list-style:none;"><p>��${status.index }</p></li>
						</c:forEach>
					</td>
				</tr>
				<tr><td class="region"><h5>���� ����� ���</h5>
						<c:forEach var="myPost"  begin="0" end="10" varStatus="status">
							<li style="list-style:none;"><p>��${status.index }</p></li>
						</c:forEach>
					</td>
					
					<td class="region"><h5>�� ��ۿ� �޸� ���� �ǰ�</h5>
					<c:forEach var="myPost"  begin="0" end="10" varStatus="status">
							<li style="list-style:none;"><p>��${status.index }</p></li>
						</c:forEach>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
<!-- Ui����  -->
</body>
</html>