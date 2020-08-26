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
<style type="text/css">
@font-face {
font-family: 'BMDOHYEON';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff') format('woff');
font-weight: normal; font-style: normal;
}
.upper {
	border: 1px solid silver;
	width: 726px;
	height: 40px;
	table-layout: fixed;
}
.hit, .sdate, .score, .name{ font-size: 0.6em; font-family:'BMDOHYEON'; text-align: center; }
.upper td {padding-left: 20px;}

.trborder {	border: 1px solid silver;}

.noticetr {	background-color: #f0f8ff; }

.text-center {	text-align:center; }

#bbsBottomBorder {
	border-bottom: 1px solid silver; height:50px;
}
#bbsBottomBorder .name, .hit, .sdate, .score { font-size:0.7em;}
#bbsBottomBorder .snum{ font-size:0.7em; text-align:center;}
#bbsBottomBorder .b{font-size:0.85em;}
#bbsBottomBorder:hover{background:#e6e6fa;}
#bbslist .btnbox {
    float: right;
    width: 130px;
    text-align: right;
}
.freebbs{ font-family:'BMDOHYEON'; }
.freebbs a{ text-decoration:none; color:black;}
.bottom { text-align:center; padding-right:30px;}

.searchform { padding-left:70px; padding-top:10px;  font-family:'BMDOHYEON';}
.searchform_right{ padding-left:90px;}
</style>
<body>
	<div class="upperdiv">
		<img alt="" src="img/total.jpg" width=50 height=20>
		<table class="upper">
			<tr style="width:400px;"> <%@ include file="/WEB-INF/jsp/gridBBS/ad.jsp" %></tr>
			<tr>
				<td><img alt="" src="../img/total.jpg">&nbsp;&nbsp; <font
					face='BMDOHYEON'>�����Խ��� / Total ${totalPost } </font> ${totalwriting }</td>
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
						<th class="text-center" scope="col" class="side1">��ȣ</th>
						<th class="text-center" scope="col">����</th>
						<th class="text-center" scope="col">�۾���</th>
						<th class="text-center" scope="col">��ȸ</th>
						<th class="text-center" scope="col">��¥</th>
						<th class="text-center" scope="col" class="side2">��õ</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bbs" items="${LIST }">
					<tr class="noticetr" id="bbsBottomBorder" >
						<td><img src="../img/notice.gif" alt="����" class="notice" /></td>
						<td class="b"><a href="../bbs/bbsview.html?seqno=${bbs.seqno }">${bbs.title }</a><span
							class="comment">(141+1)</span></td>
						<td class="name" align="center">${bbs.user_no }</td>
						<td class="hit">86193</td>
						<td class="sdate">${bbs.register_date }</td>
						<td class="score">11</td>
					</tr>
					</c:forEach>
					<tr class="noticetr" id="bbsBottomBorder" >
						<td><img src="../img/notice.gif" alt="����" class="notice" /></td>
						<td class="b"><a href="../bbs/bbsview.html?bbstype=free">������ �ʿ� ��, ��� ���� �ȳ�</a><span
							class="comment">(141+1)</span></td>
						<td class="name" align="center">�긱</td>
						<td class="hit">86193</td>
						<td class="sdate">03.05</td>
						<td class="score">11</td>
					</tr>
					<tr class="noticetr" id="bbsBottomBorder">
						<td><img src="../img/notice.gif" alt="����" class="notice" /></td>
						<td class="b"><a href="#">ȣ�ֻ�Ȱ, ��Ȧ, ���� ���� ������ ���⿡ ���ּ���.</a> <span
							class="comment">(10+2)</span></td>
						<td class="name" align="center">�긱</td>
						<td class="hit">96861</td>
						<td class="sdate">12.31</td>
						<td class="score">6</td>
					</tr>

					<tr class="noticetr" id="bbsBottomBorder">
						<td><img src="../img/notice.gif" alt="����" class="notice" /></td>
						<td class="b"><a href="#">ȣ�� ��Ȧ ��Ȱ�� �����Ͻ� ��
								�����մϴ�.</a> <span class="comment">(85+9)</span></td>
						<td class="name" align="center">�긱</td>
						<td class="hit">176460</td>
						<td class="sdate">12.22</td>
						<td class="score">4</td>
					</tr>

					<tr class="noticetr" id="bbsBottomBorder">
						<td><img src="../img/notice.gif" alt="����" class="notice" /></td>
						<td class="b"><a href="#">2012�� 12�� 17�� ���� ����</a><span
							class="comment">(41+2)</span></td>
						<td class="name" align="center">�긱</td>
						<td class="hit">167536</td>
						<td class="sdate">12.17</td>
						<td class="score">21</td>
					</tr>
					<!--  ���� �Խ��� ���� -->
					<tr id="bbsBottomBorder">
						<td class="snum">80182</td>
						<td class="b"><a href="/?m=bbs&amp;uid=103180">��Ȧ ���� ��</a></td>
						<td class="name" align="center"><a href="#">���ƿ¿����</a></td>
						<td class="hit">60</td>
						<td class="sdate">14:02</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80181</td>
						<td class="b"><a href="/?m=bbs&amp;uid=103178">������</a> <span
							class="new"></span></td>
						<td class="name" align="center"><a href="#">������</a></td>
						<td class="hit">32</td>
						<td class="sdate">11:32</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80180</td>
						<td class="b"><a href="/?m=bbs&amp;uid=103177">Grain��
								�;��</a></td>
						<td class="name" align="center"><a href="#">��ġ��ġ�</a></td>
						<td class="hit">68</td>
						<td class="sdate">09:30</td>
						<td class="score">0</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="bottom">
			<div class="pagebox01">
			<img src="../img/firstpage.gif" alt="ó��������" /> 
			<img src="../img/before.gif"alt="���� 10 ������" />
			<img src="../img/split.gif" class="split" alt=""/> 
			<span class="selected" title="1 ������">1</span> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="" class="notselected" title="2 ������">2</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="" class="notselected" title="3 ������">3</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="" class="notselected" title="4 ������">4</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="" class="notselected" title="5 ������">5</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="" class="notselected" title="6 ������">6</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="" class="notselected" title="7 ������">7</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="" class="notselected" title="8 ������">8</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="" class="notselected" title="9 ������">9</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="" class="notselected" title="10 ������">10</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="#"><img src="../img/behind.gif" alt="���� 10 ������" /></a>
			<a href="#"><img src="../img/lastpage.gif" alt="������������" /></a>
		</div>
	</div> <!--  �Խ��� ����¡ -->
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
				<option value="subject|content">����+����</option>
				<option value="content">����</option>
				<option value="nic">�г���</option>
			</select> 
			
			<input type="text" name="keyword" class="input" style="height:25px;" />
			<input type="submit" value=" �˻� " class="btnblue" />
			</div>
			<div class="searchform_right" style="float:left;">
			<a href="../bbs/freebbs.html"><input type="button" name="bbsList" value="������� " /></a>
			<a href="../write/freebbs.html"><input type="button" name="bbsList" value="�۾��� " /></a>
<!-- 			<input type="button" onclick="window.location.href='../write/freebbs.html';" value="�۾���" /> -->
			</div>
		</form:form>
	</div><!--  searchForm -->
	</div> <!--  upperdiv �Խ��� ��ü -->

	<div class="clear" style="margin-bottom:80px;"></div>

</body>
</html>