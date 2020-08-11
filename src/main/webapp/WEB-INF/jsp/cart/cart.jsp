<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
<div align="center" class="body">
<h2>카트 확인하기 화면</h2>
<div class="cart">
	<table style="font-size:10px;">
	<tr><td colspan="2"><font color="green">카트에 다음의 상품이 들어있습니다
	</font></td></tr>
	<c:forEach items="${cart.itemList }" var="itemSet"> <!--  cartController에서 보내줌 -->
	<tr><td>${itemSet.item.item_name }</td>
		<td>${itemSet.quantity }</td>
	</tr>
	</c:forEach>
	</table>
</div><br/>
${message }<br/><br/>
<a href="../index/index.html">목록으로 돌아가기</a>
<a href="../checkout/checkout.html">계산하러가기</a>
</div>
</body>
</html>