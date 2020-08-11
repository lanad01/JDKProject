<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
.upper {
	border: 1px solid silver;
	width: 726px;
	height: 40px;
	table-layout: fixed;
}
.hit, .sdate, .score{ font-size: 0.8em; font-family:'BMJUA'; text-align:center; }
.upper td {
	padding-left: 20px;
}

.trborder {
	border: 1px solid silver;
}

.noticetr {
	background-color: #f0f8ff;
}

.text-center, n_nick {
	text-align: center;
}

#bbsBottomBorder {
	border-bottom: 1px solid silver;
}
.b{ font-size:0.8em;}  /*제목 폰트 */
#bbslist .btnbox {
    float: right;
    width: 130px;
    text-align: right;
}
</style>
<body>
	<div class="upperdiv">
		<img alt="" src="img/total.jpg" width=50 height=20>
		<table class="upper">
			<tr>
				<td><img alt="" src="../img/total.jpg">&nbsp;&nbsp; <font
					face='BMDOHYEON'>자유게시판 / Total ${totalPost } </font> ${totalwriting }</td>
			</tr>
		</table>
		<div class="mainbbs">
			<table summary="전체 게시물리스트 입니다.">
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
					<tr class="noticetr" id="bbsBottomBorder">
						<td><img src="../img/notice.gif" alt="공지" class="notice" /></td>
						<td class="b"><a href="#">레벨업 필요 글, 댓글 개수 안내</a><span
							class="comment">(141+1)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr class="text-center">
											<td>브릴</td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">86193</td>
						<td class="sdate">03.05</td>
						<td class="score">11</td>
					</tr>
					<tr class="noticetr" id="bbsBottomBorder">
						<td><img src="../img/notice.gif" alt="공지" class="notice" /></td>
						<td class="b"><a href="#">호주생활, 워홀, 영어 관련 질문만 여기에 해주세요.</a> <span
							class="comment">(10+2)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr class="text-center">
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('1',event);">브릴</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">96861</td>
						<td class="sdate">12.31</td>
						<td class="score">6</td>
					</tr>

					<tr class="noticetr" id="bbsBottomBorder">
						<td><img src="../img/notice.gif" alt="공지" class="notice" /></td>
						<td class="b"><a href="#">호주 워홀 생활기 연재하실 분
								모집합니다.</a> <span class="comment">(85+9)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('1',event);">브릴</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">176460</td>
						<td class="sdate">12.22</td>
						<td class="score">4</td>
					</tr>

					<tr class="noticetr" id="bbsBottomBorder">
						<td><img src="../img/notice.gif" alt="공지" class="notice" /></td>
						<td class="b"><a href="#">2012년 12월 17일 공식 오픈</a><span
							class="comment">(41+2)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td align="center" class="n_nick"><span class="hand"
												onclick="getMemberLayer('1',event);">브릴</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">167536</td>
						<td class="sdate">12.17</td>
						<td class="score">21</td>
					</tr>
					<!--  공지 게시판 종료 -->
					<tr id="bbsBottomBorder">
						<td class="snum">80182</td>
						<td class="b"><a href="/?m=bbs&amp;uid=103180">워홀 성공 팁</a></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('0',event);">돌아온원써니</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">60</td>
						<td class="sdate">14:02</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80181</td>
						<td class="b"><a href="/?m=bbs&amp;uid=103178">ㄴㅇㄹ</a> <span
							class="new"></span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('0',event);">ㅇㄹㄴㅇ</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">32</td>
						<td class="sdate">11:32</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80180</td>
						<td class="b"><a href="/?m=bbs&amp;uid=103177">Grain이
								익어간다</a></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('14245',event);">참치김치찌개</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">68</td>
						<td class="sdate">09:30</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80179</td>
						<td class="b"><a href="/?m=bbs&amp;uid=103176">안녕하세요 호주
								갈 수 있을까여</a> <span class="comment">(3+3)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('14302',event);">워홀처음가는사람</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">185</td>
						<td class="sdate">00:18</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80178</td>
						<td class="b"><a href="#">텍스레비면제에관해서</a> <span
							class="comment">(3)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('14003',event);">블번덩이</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">161</td>
						<td class="sdate">08.10</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80177</td>
						<td class="b"><a href="#">인종차별은 우리만 당하는게 아니구나</a> <span
							class="comment">(1)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('14303',event);">거렁배이이이</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
						<td class="hit">236</td>
						<td class="sdate">08.10</td>
						<td class="score">0</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80176</td>
						<td class="b"><a href="#">택스리턴 신청하니 돈내라는데</a> <span
							class="comment">(2)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('12870',event);">씨리얼지겹다</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80176</td>
						<td class="b"><a href="#">택스리턴 신청하니 돈내라는데</a> <span
							class="comment">(2)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('12870',event);">씨리얼지겹다</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr id="bbsBottomBorder">
						<td class="snum">80176</td>
						<td class="b"><a href="#">택스리턴 신청하니 돈내라는데</a> <span
							class="comment">(2)</span></td>
						<td class="name">
							<div class="name_box">
								<table cellspacing="0" summary="닉네임 박스">
									<tbody>
										<tr>
											<td class="n_nick"><span class="hand"
												onclick="getMemberLayer('12870',event);">씨리얼지겹다</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="bottom">
		<div class="pagebox01">
			<img src="../img/처음페이지.gif" alt="처음페이지" /> 
			<img src="../img/이전10페이지.gif"alt="이전 10 페이지" />
			<img src="../img/split.gif" class="split" alt=""/> 
			<span class="selected" title="1 페이지">1</span> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="/?m=bbs&amp;p=2" class="notselected" title="2 페이지">2</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="/?m=bbs&amp;p=3" class="notselected" title="3 페이지">3</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="/?m=bbs&amp;p=4" class="notselected" title="4 페이지">4</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="/?m=bbs&amp;p=5" class="notselected" title="5 페이지">5</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="/?m=bbs&amp;p=6" class="notselected" title="6 페이지">6</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="/?m=bbs&amp;p=7" class="notselected" title="7 페이지">7</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="/?m=bbs&amp;p=8" class="notselected" title="8 페이지">8</a>
			<img src="../img/split.gif" class="split" alt="" />
			<a href="/?m=bbs&amp;p=9" class="notselected" title="9 페이지">9</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="/?m=bbs&amp;p=10" class="notselected" title="10 페이지">10</a> 
			<img src="../img/split.gif" class="split" alt="" /> 
			<a href="#"><img src="../img/이후10페이지.gif" alt="다음 10 페이지" /></a>
			<a href="#"><img src="마지막페이지.gif" alt="마지막페이지" /></a>
		</div>
	</div>

	<div class="searchform">
		<form name="bbssearchf" action="/">
			<input type="hidden" name="r" value="home" /> <input type="hidden"
				name="c" value="" /> <input type="hidden" name="m" value="bbs" />
			<input type="hidden" name="bid" value="" /> <input type="hidden"
				name="cat" value="" /> <input type="hidden" name="sort" value="gid" />
			<input type="hidden" name="orderby" value="asc" /> <input
				type="hidden" name="recnum" value="20" /> <input type="hidden"
				name="type" value="" /> <input type="hidden" name="iframe" value="" />
			<input type="hidden" name="skin" value="" /> <select name="where">
				<option value="subject|content">제목+내용</option>
				<option value="subject|tag">제목+태그</option>
				<option value="content">내용</option>
				<option value="nic">닉네임</option>
			</select> <input type="text" name="keyword" size="25" value="" class="input" />
			<input type="submit" value=" 검색 " class="btnblue" />
		</form>

		<div class="btnbox">
			<span class="sp_btn00"><a href="/?m=bbs">목록으로</a></span>
		</div>
	</div>
	</div>

	</div>
	<div class="clear"></div>

	</div>
	</div>
	<div class="wrap"></div>
</body>
</html>