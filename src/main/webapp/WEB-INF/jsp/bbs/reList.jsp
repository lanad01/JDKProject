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
</head>
<style type="text/css">
@font-face {
font-family: 'BMDOHYEON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff') format('woff');
font-weight: normal; font-style: normal; }
</style>
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">	
function rereShow(repno){
	document.getElementById("repnoSend").value=repno;
 	document.getElementById(repno).style.display="block";
}
// function rpmod(repno,seqno){
// 	 var formData = $("#form1").serialize();
// 	 var content=document.getElementById("content").value;
// 	 alert(formData);
// 	 alert('내용'+content);
// 	 $.ajax({
// 		 async: true,
//          cache : false,
//          url : "../reply/rpUpd.html" , // 요기에
//          type : 'POST', 
//          data: { "repno" : repno, "seqno" : seqno, "content" : content } ,
//          dataType : "json",
//          success : function(data) {
//          	 alert(data);
//              var jsonObj = JSON.parse(data);
//              alert(jsonObj);
//          }, // success 
 
//          error : function(xhr, status) {
//              alert(xhr + " : " + status);
//          }
//      }); // $.ajax */
// }
function rpUpd(repno,seqno){
	document.getElementById("repnoSend2").value=repno;
// 	alert(document.getElementById("p"+repno).innerHTML);
 	document.getElementById("p"+repno).style.display="block";
	$.ajax({
		async: true,
		type : 'POST',
		data : { "repno": repno } ,
		dataType : "json",
		url : "../reply/modi.html",
		success : function(data){
			
			if(data==1){
				alert('일치분기');
// 				document.getElementById("repModi").style.display="block";
			}
			if(data==0) alert('해당 댓글의 작성자가 아닙니다!!')
			if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
		},error : function(e){
			alert("실패");
		}
	})
}
function rpDel(repno,seqno){
	if(confirm("정말로 삭제하시겠습니까?")==true){
		$.ajax({
			async: true,
			type : 'POST',
			data : { "repno": repno } ,
			dataType : "json",
			url : "../reply/del.html",
			success : function(data){
				alert(data);
				if(data==1) {
					alert('성공적으로 삭제되었습니다!!');
					location.reload();
				}
				if(data==0) alert('해당 댓글의 작성자가 아닙니다!!')
				if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
			},error : function(e){
				alert("실패");
			}
		})
	}else{ //취소
		return false;
	}	
}
</script>
<body>
<div class="sbjbox" style="width:730px; margin-top:29px;">
	<c:choose>
		<c:when test="${NOCOM==0 }">
			<h2 align="center" style="margin-top:15px;"> No comment by guest.<br/> 댓글을 등록해주세요! </h2>
		</c:when>
	</c:choose>
	<c:forEach  var="rep" items="${REP}" varStatus="status"  >
		<table class="commentTable">
			<tr><td width="10%">
				<c:forEach var="picture" items="${REPLIERPIC }"  begin="${status.index}" end="${status.index}">
				<img alt="댓글작성자 사진" src="${pageContext.request.contextPath}/upload/${picture}"  
					width="60" height="60" onerror="this.src='../img/noprofile.gif' ">
				</c:forEach>
				</td>
				<td width="70%"><span style="font-weight:strong; font-size:15px; margin-left:10px;">
				
				 <c:forEach begin="${status.index}" end="${status.index}" var="replier" items="${REPLIERLIST}">
				 ${replier}
				 </c:forEach>
				
				<font size="0.8em" color="blue">${rep.register_date }</font></span><span style="font-weight:300"></span><br/><br/><br/>
				<span style=" margin-left:10px;">${rep.content } Rep Groupno = ${rep.repgroupno } Repno = ${rep.repno } User_no : ${rep.user_no }</span>
				</td>
				<td class="crud" style="width:20%; float:right;  position:absolute;">
				<input type="button" onClick="rereShow(${rep.repno})" value="댓글">
				<input type="button" onClick="rpUpd(${rep.repno},${rep.seqno})" value="수정">
				<input type="button" onClick="rpDel(${rep.repno},${rep.seqno})" value="삭제">
				<input type="button" value="신고">
				</td>				
			</tr>
		</table>	
		<div id="p${rep.repno}" class="check" style="display:none; background:#dcdcdc; margin:0 50px 5px 19px; padding-top:9px; padding-bottom:25px;">
		<form action="../reply/rpUpd.html" method="post" name="rpMod" id="form1">
			<font face="BMDOHYEON" size="1em">
			<textarea name="content" id="content" cols="103" rows="4" style="margin-left:12px;" placeholder="${rep.content}"></textarea>
			<input type="hidden" id="repnoSend2" value="${rep.repno }">
			<input type="hidden" name="repno"  value="${rep.repno }">
			<input type="hidden" name="seqno"  value="${rep.seqno }">
			<input type="submit" value="댓글수정" style="float:right; margin-right:8px; font-size:1.2em;">
			</font>	
		</form>
		</div>	
		<!--  대댓글 div 평소엔 display none -->
		<div id="${rep.repno}" style="display:none; border-bottom:2px dotted silver;">
		<form:form action="../reply/reply.html" method="post" modelAttribute="reply">
		<form:hidden id="repnoSend" path="repno" value="${rep.repno}"/>
		<form:hidden path="repgroupno" value="1"/>
		<form:hidden path="seqno" value="${BBS.seqno }"/> 
		<table>
			<tr><td class="tarea"> repno:${rep.repno }의 대댓글 / Groupno = ${rep.repgroupno } Repno = ${rep.repno } User_no : ${rep.user_no }
			 <form:textarea path="content" rows="3" cols="92"/></td>
			<tr><td class="repbtn"><input type="submit" value="댓글등록"></td>
		</table>
		</form:form> 
		</div>
		
		<jsp:include page="/reply/rerep.html?repno=${rep.repno}&seqno=${BBS.seqno }&repgroupno=1" flush="false"/>
	</c:forEach>
</div>
</body>
</html>