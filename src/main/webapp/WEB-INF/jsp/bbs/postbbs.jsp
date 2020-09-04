<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!-- css -->
<link rel="stylesheet" href="../css/postbbs.css">
<style type="text/css">
.msg {
	margin-left: 33px;
	width: 600px;
}

.msg tr {
	border: 1px solid #d3d3d3;
	margin-left: 9px;
}

.msg td {
	margin: 3px 3px 3px 3px;
}
</style>
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<input type="hidden" id="bbstype1" value="${bbsType }">
	<c:choose>
		<c:when test="${UPDATE==1 }">
			<form:form action="../bbs/bbsupdimpl.html" modelAttribute="bbs"	method="post">
				<form:hidden path="seqno"/>
				<h2 class="header">
					<font face='BMDOHYEON'>글수정</font>
				</h2>
				<div class="msg">
					<table>
						<tr>
							
							<td><input class="info" type="text" value="제목"	disabled="true"></td>
							<td><form:input type="text" path="title" size="78px" /></td>
						</tr>
						<tr>
							<td></td>
							<td>&nbsp;&nbsp;<font color="red" id="font"><form:errors
										path="title" /></font></td>
						<tr>
							<td><input class="info" type="text" value="작성자명" disabled="true"></td>
							<td><input type="text" value="${sessionScope.loginUser }" disabled="true"></td>
						</tr>
						<tr>
							<td><input class="info" type="text" value="게시판타입"	disabled="true"></td>
							<td><form:select path="bbstype" style="margin-left:10px;">
									<c:if test="${bbsType==null }">
									<form:option value="freebbs" label="자유게시판" selected="selected"   />
									<form:option value="exp" label="경험담썰" />
									<form:option value="info" label="정보&팁게시판"  />
									<form:option value="qna" label="질문답변게시판" />
									</c:if>
									<c:if test="${bbsType=='freebbs' }">
									<form:option value="freebbs" label="자유게시판" selected="selected"   />
									<form:option value="exp" label="경험담썰" />
									<form:option value="info" label="정보&팁게시판"  />
									<form:option value="qna" label="질문답변게시판" />
									</c:if>
									<c:if test="${bbsType=='exp' }">
									<form:option value="freebbs" label="자유게시판"   />
									<form:option value="exp" label="경험담썰" selected="selected"  />
									<form:option value="info" label="정보&팁게시판"  />
									<form:option value="qna" label="질문답변게시판" />
									</c:if>
									<c:if test="${bbsType=='info' }">
									<form:option value="freebbs" label="자유게시판"    />
									<form:option value="exp" label="경험담썰" />
									<form:option value="info" label="정보&팁게시판" selected="selected"   />
									<form:option value="qna" label="질문답변게시판" />
									</c:if>
									<c:if test="${bbsType=='qna' }">
									<form:option value="freebbs" label="자유게시판"   />
									<form:option value="exp" label="경험담썰" />
									<form:option value="info" label="정보&팁게시판"  />
									<form:option value="qna" label="질문답변게시판" selected="selected"  />
									</c:if>
								</form:select> 
								<%-- <input type="text" value="${bbsType }" disabled="true"></td></tr> --%>
					</table>
				</div>
				<div class="col-sm-12" id="contentDiv" style="margin-top: 5px;">
					<!-- 		<label class="contentlabel contact" style="width:400px; min-height:0px; float:left;	text-align:center;"></label> -->
					<%-- 		<form:textarea style="width:100%; height:450px;" path="content" name="smartEditor" id="smartEditor" rows="150" cols="300"/>  --%>
					<form:textarea id="textarea" path="content" rows="170" cols="40" style="width:690px; height:400px;" />
				</div>
				<div class="submitbox">
					<input type="submit" value="수정하기" class="btnblue" /> <input
						type="button" value="취소" class="btngray" />
				</div>
			</form:form>
		</c:when>
		<c:when test="${UPDATE==null }">
			<form:form action="../write/inputbbs.html" modelAttribute="bbs"	method="post">
			<h2 class="header">
					<font face='BMDOHYEON'>글쓰기</font>
				</h2>
				<div class="msg">
					<table>
						<tr>
							<td><input class="info" type="text" value="제목"	disabled="true"></td>
							<td><form:input type="text" path="title" size="78px" placeholder="${PRETITLE }" /></td>
						</tr>
						<tr><td></td>
							<td>&nbsp;&nbsp;<font color="red" id="font"><form:errors path="title" /></font></td>
						<tr><td><input class="info" type="text" value="작성자명" disabled="true"></td>
							<td><input type="text" value="${sessionScope.loginUser }" disabled="true"></td>
						</tr>
						<tr><td><input class="info" type="text" value="게시판타입"	disabled="true"></td>
							<td><form:select path="bbstype" id="bbstypeSelect" style="margin-left:10px;">
									<c:if test="${bbsType=='freebbs' }">
									<form:option value="freebbs" label="자유게시판" selected="selected"   />
									<form:option value="exp" label="경험담썰" />
									<form:option value="info" label="정보&팁게시판"  />
									<form:option value="qna" label="질문답변게시판" />
									</c:if>
									<c:if test="${bbsType=='exp' }">
									<form:option value="freebbs" label="자유게시판"   />
									<form:option value="exp" label="경험담썰" selected="selected"  />
									<form:option value="info" label="정보&팁게시판"  />
									<form:option value="qna" label="질문답변게시판" />
									</c:if>
									<c:if test="${bbsType=='info' }">
									<form:option value="freebbs" label="자유게시판"    />
									<form:option value="exp" label="경험담썰" />
									<form:option value="info" label="정보&팁게시판" selected="selected"   />
									<form:option value="qna" label="질문답변게시판" />
									</c:if>
									<c:if test="${bbsType=='qna' }">
									<form:option value="freebbs" label="자유게시판"   />
									<form:option value="exp" label="경험담썰" />
									<form:option value="info" label="정보&팁게시판"  />
									<form:option value="qna" label="질문답변게시판" selected="selected"  />
									</c:if>
									
								</form:select> 
								<%-- <input type="text" value="${bbsType }" disabled="true"></td></tr> --%>
					</table>
				</div>
				<div class="col-sm-12" id="contentDiv" style="margin-top: 5px;">
					<!-- 		<label class="contentlabel contact" style="width:400px; min-height:0px; float:left;	text-align:center;"></label> -->
					<%-- 		<form:textarea style="width:100%; height:450px;" path="content" name="smartEditor" id="smartEditor" rows="150" cols="300"/>  --%>
					<form:textarea id="textarea" path="content" rows="170" cols="40"
						placeholder="${PRECONTENT }" style="width:690px; height:400px;" />
				</div>
				<div class="submitbox">
					<input type="submit" value="글등록" class="btnblue" /> <input
						type="button" value="취소" class="btngray" />
				</div>
			</form:form>
		</c:when>
	</c:choose>


</body>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor",
		//SmartEditor2Skin.html 파일이 존재하는 경로
		sSkinURI : "../se2/SmartEditor2Skin.jsp",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function() {
			}
		},
		fOnAppLoad : function() {
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["smartEditor"].exec("PASTE_HTML", [ "" ]);
		},
		fCreator : "createSEditor2"
	});
	//네이버 에디터 작성 데이터 전송하기 
	$("#submitBoardBtn").click(function() {
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
	});
	$("#submitModifyBoardBtn").click(function() {
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
	});
</script>
</html>