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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
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
function myFunction2(repno,seqno) {
    swal({
        title: "정말 삭제하시겠습니까?",
        text: "삭제된 대댓글은 복구되지 않습니다!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "예 삭제하겠습니다.",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm){
        	$.ajax({
    			async: true,
    			type : 'POST',
    			data : { "repno": repno } ,
    			dataType : "json",
    			url : "../reply/del.html",
    			success : function(data){
    				if(data==1) {
    					swal("성공적으로 삭제되었습니다!!", "");
    					location.reload();
    				}
    				if(data==0) swal("","해당 댓글의 작성자가 아닙니다!!", "error");
    				if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
    			},error : function(e){
    				swal("","실패!!", "error");
    			}
    		})
        } else {
            swal("Cancelled", "댓글 삭제가 취소되었습니다.", "error");
        }
    });
};
function rpUpd(repno,seqno){
	document.getElementById("repnoSend2").value=repno;
 	document.getElementById("p"+repno).style.display="block";
	$.ajax({
		async: true,
		type : 'POST',
		data : { "repno": repno } ,
		dataType : "json",
		url : "../reply/modi.html",
		success : function(data){
			if(data==1){
			}
			if(data==0) swal("","해당 댓글의 작성자가 아닙니다!!", "error");
			if(data==2) location.href="../bbs/bbsview.html?loginwrite=1&seqno="+seqno;
		},error : function(e){
			swal("","실패!!", "error");
		}
	})
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
				
				<font size="0.8em" color="blue">${rep.register_date }</font></span><span style="font-weight:300"></span><br/><br/>
				<span style=" margin-left:10px;">${rep.content } Rep Groupno = ${rep.repgroupno } Repno = ${rep.repno } User_no : ${rep.user_no }</span>
				</td>
				<td class="crud" style="width:20%; float:right;  position:absolute;">
				<input type="button" onClick="rereShow(${rep.repno})" value="댓글">
				<input type="button" onClick="rpUpd(${rep.repno},${rep.seqno})" value="수정">
				<input type="button" onClick="myFunction2(${rep.repno},${rep.seqno})" value="삭제">
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