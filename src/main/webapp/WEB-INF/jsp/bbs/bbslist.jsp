<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
	href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'
	rel='stylesheet' type='text/css'>
</head>
<link rel="stylesheet" href="../css/freebbs.css">
<style type="text/css">
</style>
<body>
	<div class="upperdiv">
		<img alt="" src="img/total.jpg" width=50 height=20>
		<table class="upper">
			<tr style="width:400px;"> <%@ include file="/WEB-INF/jsp/gridBBS/ad.jsp" %></tr>
			<tr>
				<td><img alt="" src="../img/total.jpg">&nbsp;&nbsp; 
				<font face='BMDOHYEON'>자유게시판 / Total ${totalPost } </font> ${totalwriting }</td>
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
					<c:forEach var="bbs" items="${LIST }" varStatus="status" >
						<!--  user_no : 1 - writer가 권상우인 글은 공지사항 -->
						<c:choose>
							<c:when test="${bbs.user_no==1 }"><!-- 브릴인 경우 -->
								<tr class="noticetr" id="bbsBottomBorder" >
									<td><img src="../img/notice.gif" alt="공지" class="notice" /></td>
									<td class="b"><a href="../bbs/bbsview.html?seqno=${bbs.seqno }">${bbs.title }</a>
									<span class="comment">
									<c:forEach var="reAndrere" items="${REPANDRERE}" begin="${status.index}" end="${status.index}">
									<font color="blue" size="1">(${reAndrere})</font>
									</c:forEach>
									</span></td>
									<td class="name" align="center">
								<c:forEach var="writer" items="${WRITERLIST}" begin="${status.index}" end="${status.index}">
									${writer}
								</c:forEach>
									</td>
									<td class="hit">${bbs.hit }</td>
									<td class="sdate">${bbs.register_date }</td>
									<td class="score">${bbs.point }</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr id="bbsBottomBorder">
									<td class="snum">${bbs.seqno }</td>
									<td class="b"><a href="../bbs/bbsview.html?seqno=${bbs.seqno }">${bbs.title }</a>
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
							</c:otherwise>
						</c:choose>
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
<!-- 			<img src="../img/split.gif" class="split" alt=""/>  -->
<!-- 			<span class="selected" title="1 페이지">1</span>  -->
<!-- 			<img src="../img/split.gif" class="split" alt="" />  -->
<!-- 			<a href="" class="notselected" title="2 페이지">2</a> -->
<!-- 			<img src="../img/split.gif" class="split" alt="" /> -->
<!-- 			<a href="" class="notselected" title="3 페이지">3</a> -->
<!-- 			<img src="../img/split.gif" class="split" alt="" /> -->
<!-- 			<a href="" class="notselected" title="4 페이지">4</a> -->
<!-- 			<img src="../img/split.gif" class="split" alt="" /> -->
<!-- 			<a href="" class="notselected" title="5 페이지">5</a>  -->
<!-- 			<img src="../img/split.gif" class="split" alt="" />  -->
<!-- 			<a href="" class="notselected" title="6 페이지">6</a>  -->
<!-- 			<img src="../img/split.gif" class="split" alt="" />  -->
<!-- 			<a href="" class="notselected" title="7 페이지">7</a>  -->
<!-- 			<img src="../img/split.gif" class="split" alt="" />  -->
<!-- 			<a href="" class="notselected" title="8 페이지">8</a> -->
<!-- 			<img src="../img/split.gif" class="split" alt="" /> -->
<!-- 			<a href="" class="notselected" title="9 페이지">9</a>  -->
<!-- 			<img src="../img/split.gif" class="split" alt="" />  -->
<!-- 			<a href="" class="notselected" title="10 페이지">10</a>  -->
<!-- 			<img src="../img/split.gif" class="split" alt="" />  -->
			<a href="#"><img src="../img/behind.gif" alt="다음 10 페이지" /></a>
			<a href="#"><img src="../img/lastpage.gif" alt="마지막페이지" /></a>
		</div>
	</div> <!--  게시판 페이징 -->
	<div class="searchform">
		<form:form name="bbssearchf" action="/">
			<input type="hidden" name="r" value="home" /> <input type="hidden"
				name="c" value="" /> <input type="hidden" name="m" value="bbs" />
			<input type="hidden" name="bid" value="" /> <input type="hidden"
				name="cat" value="" /> <input type="hidden" name="sort" value="gid" />
			<input type="hidden" name="orderby" value="asc" /> <input
				type="hidden" name="recnum" value="20" /> <input type="hidden"
				name="type" value="" /> <input type="hidden" name="iframe" value="" />
			<input type="hidden" name="skin" value="" />
			<div style="float:left; width:60%"> 
			<select name="where">
				<option value="subject|content">제목+내용</option>
				<option value="content">내용</option>
				<option value="nic">닉네임</option>
			</select> 
			
			<input type="text" name="keyword" class="input" style="height:25px;" />
			<input type="submit" value=" 검색 " class="btnblue" />
			</div>
			<div class="searchform_right" style="float:left;">
			<a href="../bbs/bbs.html?bbstype=${BBSTYPE}"><input type="button" name="bbsList" value="목록으로 " /></a>
			<a href="../write/bbs.html?bbstype=${BBSTYPE}"><input type="button" name="bbsList" value="글쓰기 " /></a>
<!-- 			<input type="button" onclick="window.location.href='../write/freebbs.html';" value="글쓰기" /> -->
			</div>
		</form:form>
	</div><!--  searchForm -->
	</div> <!--  upperdiv 게시판 본체 -->

	<div class="clear" style="margin-bottom:80px;"></div>

</body>
</html>