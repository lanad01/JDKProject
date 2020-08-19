<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!-- css -->
</head>
<body>
	<div class="col-sm-12" id="contentDiv" style="margin-top:20px;">
		<label class="contentlabel contact" style="width:400px; min-height:0px; float:left;
		text-align:center;"></label>
		<textarea style="width:100%; height:450px;" name="smartEditor" id="smartEditor" rows="150" cols="300"></textarea>
	</div>
</body>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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