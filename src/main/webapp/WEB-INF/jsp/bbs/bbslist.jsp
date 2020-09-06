<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'	rel='stylesheet' type='text/css'>
</head>
<link rel="stylesheet" href="../css/freebbs.css">
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var noSearch=document.getElementById("search").value;
	if(noSearch=='0'){
		alert('검색조건에 맞는 게시글이 없습니다');
	}else if(noSearch==null){
		
	}
})
</script>
<style type="text/css">
</style>
<body>
	<input type="hidden" id="search" value="${SEARCHEDBBS }">
	<div class="upperdiv">
		<img alt="" src="img/total.jpg" width=50 height=20>
		<table class="upper">
			<tr style="width:400px;"> <%@ include file="/WEB-INF/jsp/gridBBS/ad.jsp" %></tr>
			<tr>
				<td><img alt="" src="../img/total.jpg">&nbsp;&nbsp; 
				<font face='BMDOHYEON'>
				<c:choose>
					<c:when test="${BBSTYPE=='freebbs' }">자유게시판</c:when>
					<c:when test="${BBSTYPE=='qna' }">질문답변게시판</c:when>
					<c:when test="${BBSTYPE=='whole' }">전체글보기</c:when>
					<c:when test="${BBSTYPE=='ganyum' }">개념글</c:when>
					<c:when test="${BBSTYPE=='exp' }">경험담&썰</c:when>
					<c:when test="${BBSTYPE=='info' }">정보공유게시판</c:when>
					<c:when test="${BBSTYPE=='life' }">생활기 게시판</c:when>
				</c:choose>
				 / Total ${totalPost } 
				</font></td>
			</tr>
		</table>
		<div class="mainbbs">
			<table class="freebbs" style="width:730px;">
				<colgroup>
					<col width="50">
					<col>
					<col width="170">
					<col width="55">
					<col width="50">
					<col width="45">
				</colgroup>
				<thead>
					<tr class="trborder">
						<th class="text-center" scope="col" class="side1">번호</th>
						<th class="text-center" scope="col">제목</th>
						<th class="text-center" scope="col">글쓴이</th>
						<th class="text-center" scope="col">조회</th>
						<th class="text-center" scope="col">날짜</th>
						<th class="text-center" scope="col" class="side2">추천</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${NOTICES}" varStatus="status">
								<tr class="noticetr" id="bbsBottomBorder" >
									<td><img src="../img/notice.gif" alt="공지" class="notice" /></td>
									<td class="b"><a href="../bbs/bbsview.html?seqno=${notice.seqno }">${notice.title }</a>
									<span class="comment">
									<c:forEach var="reAndrere" items="${NOTICEREnRERE}" begin="${status.index}" end="${status.index}">
									<font color="blue" size="1">(${reAndrere})</font>
									</c:forEach>
									</span></td>
									<td class="name" align="center">
									브릴
									</td>
									<td class="hit">${notice.hit }</td>
									<td class="sdate">${notice.register_date }</td>
									<td class="score">${notice.point }</td>
								</tr>
					</c:forEach>
								
					<c:forEach var="bbs" items="${LIST }" varStatus="status" >
								<tr id="bbsBottomBorder">
									<td class="snum">
									${bbs.rn }
<%-- 									<c:forEach var="rownum" items="${ROWNUMLIST}" begin="${status.index}" end="${status.index}">${rownum }</c:forEach> --%>
									</td>
									<td class="b"><a href="../bbs/bbsview.html?seqno=${bbs.seqno}">${bbs.title }</a>
									<span class="comment">
									<c:forEach var="reAndrere" items="${REPANDRERE}" begin="${status.index}" end="${status.index}">
									<font color="blue" size="1">(${reAndrere})</font>
									</c:forEach>
									</span></td>
									<td class="name" align="center">
									<c:forEach var="writer" items="${WRITERLIST}" begin="${status.index}" end="${status.index}">
									${writer}
									</c:forEach>
									<td class="hit">${bbs.hit }</td>
									<td class="sdate">${bbs.register_date }</td>
									<td class="score">${bbs.point }</td>
								</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="bottom">
			<div class="pagebox01">
			<img src="../img/firstpage.gif" alt="처음페이지" /> 
			<img src="../img/before.gif"alt="이전 10 페이지" />
			<c:forEach var="page" begin="1" end="${PAGE_CNT}">
			<img src="../img/split.gif" class="split" alt=""/> 
			<a href="../bbs/bbs.html?bbstype=${BBSTYPE}&PAGENO=${page}" style="color:black;">${page }</a>
			</c:forEach>
			<a href="#"><img src="../img/behind.gif" alt="다음 10 페이지" /></a>
			<a href="#"><img src="../img/lastpage.gif" alt="마지막페이지" /></a>
		</div>
	</div> <!--  게시판 페이징 -->
	<div class="searchform">
      <form name="bbssearchf" action="../bbs/bbs.html">
         <input type="hidden" name="bbstype" id="bbstype" value="${BBSTYPE}" />
         <div style="float:left; width:60%"> 
         <select id="searchKey" name="searchKey">
            <option value="schTotal">제목+내용</option>
            <option value="schContent">내용</option>
            <option value="schNickNm">닉네임</option>
         </select> 
         
         <input type="text" name="keyword" class="input" style="height:25px;" />
         <input type="submit" value=" 검색 " class="btnblue" />
         </div>
         <div class="searchform_right" style="float:left;">
         <a href="../bbs/bbs.html?bbstype=${BBSTYPE}"><input type="button" name="bbsList" value="목록으로 " /></a>
         <a href="../write/bbs.html?bbstype=${BBSTYPE}"><input type="button" name="bbsList" value="글쓰기 " /></a>
         </div>
      </form>
	</div><!--  searchForm -->
	</div> <!--  upperdiv 게시판 본체 -->
	<div class="clear" style="margin-bottom:80px;"></div>

</body>
</html>