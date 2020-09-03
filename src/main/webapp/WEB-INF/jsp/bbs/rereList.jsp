<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">	

function rereDel(repno,seqno,groupno){
	if(confirm('정말로 삭제하시겠습니까?',"")==true){
		$.ajax({
			async: true,
			type : 'POST',
			data : { "repno": repno, "repgroupno" : groupno } ,
			dataType : "json",
			url : "../reply/reredel.html",
			success : function(data){
				if(data==1) {
					swal("성공적으로 삭제되었습니다!!", "");
					location.reload();
				}
				if(data==0) Alert('해당 댓글의 작성자가 아닙니다!!','warning')
				if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
			},error : function(e){
				alert("실패");
			}
		})
	}else{ //취소
		return false;
	}	
}
function rereUpd(repno,seqno,groupno){
	document.getElementById("repnoSend3").value=repno;
// 	alert(document.getElementById("p"+repno).innerHTML);
 	document.getElementById("t"+repno+groupno).style.display="block";
 	$.ajax({
		async: true,
		type : 'POST',
		data : { "repno": repno, "repgroupno" : groupno } ,
		dataType : "json",
		url : "../reply/rerevalid.html",
		success : function(data){
			
			if(data==1){
				alert('일치분기');
// 				document.getElementById("repModi").style.display="block";
			}
			if(data==0) alert('해당 대댓글의 작성자가 아닙니다!!')
			if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
		},error : function(e){
			alert("실패");
		}
	})
}
</script>
<body>
<c:forEach var="rere" items="${RERELIST}" varStatus="status">
<table class="oneLine" style="margin:10px 10px 10px 15px;">
	<tr>
		<td width="5%"><img src="../img/oneline.PNG" style="display:inline"></td>
		<td width="10%">
		<c:forEach var="picture" items="${REREPIC }"  begin="${status.index}" end="${status.index}">
		<img alt="대댓글작성자 사진" src="${pageContext.request.contextPath}/upload/${picture}"  
			width="60" height="60" onerror="this.src='../img/noprofile.gif' ">
		</c:forEach>
		</td>
		<td style="padding-left:19px; width:70%">
		<span style="font-weight:strong; font-size:15px;">${REREPLIER}</span><span style="font-weight:300">${rere.register_date }</span><br/><br/>
		<span>${rere.content } repno: ${rere.repno } seqno : ${rere.seqno } user_no : ${rere.user_no } groupno : ${rere.repgroupno } </span>
		</td>
		<td width="15%" style="position:absolute;">
		<input type="button" onClick="rereUpd(${rere.repno},${rere.seqno}, ${rere.repgroupno })" value="수정">
		<input type="button" onClick="rereDel(${rere.repno},${rere.seqno}, ${rere.repgroupno })" value="삭제">
		<input type="button" value="신고">
		</td>
		</tr>
</table>
<div id="t${rere.repno}${rere.repgroupno}" style="display:none; background:#dcdcdc; margin:0 50px 5px 19px; padding-top:9px; padding-bottom:5px;">
		<form action="../reply/rereUpd.html" method="post">
			<font face="BMDOHYEON" size="1em">
			<textarea name="content" id="content" cols="85" rows="4" style="margin-left:32px;" placeholder="${rere.content}"></textarea>
			<input type="hidden" id="repnoSend3" value="${rere.repno }">
			<input type="hidden" name="repno"  value="${rere.repno }">
			<input type="hidden" name="seqno" value="${rere.seqno}">
			<input type="hidden" name="repgroupno" value="${rere.repgroupno}">
			<input type="submit" value="대댓글수정"  style="float:right; margin-right:8px; font-size:1.2em;">
			</font>	
</form>
</div>
</c:forEach>
<button onclick="Alert();">Alert</button>
<button onclick="Confirm();">Confirm</button>
</body>
</html>