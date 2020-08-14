<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


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
.list{ font-size: 1em; font-family:'BMDOHYEON'; text-align: center; }
.list li{ list-style:none;}
.list ul{ padding-right:26px;}
.list a{ text-decoration:none }
.upper td {padding-left: 20px;}

.bottom { padding-left:80px;}
.searchform { padding-left:70px; padding-top:10px;}


.msg {  font-size: 1em; font-family:'BMDOHYEON'; font-color:red; border-top:3px solid black; padding:20px 0 20px 0; }
.key{   font-size: 0.7em; font-family:'BMDOHYEON'; font-color:red;  }

.joinTable td{ border-top:1px solid silver; padding:10px 0 10px 0;  }
.joinTable div{ font-family:'BMDOHYEON';  font-size: 0.7em; font-color:blue; padding-top:10px;}
.submitbox {text-align:center;}
.btngray { font-family:'BMDOHYEON';
    cursor: pointer;
    border: #666666 solid 1px;
    background: #B3B3B3 left bottom repeat-x;
    color: #ffffff;
    height: 21px;
}
.btnblue { font-family:'BMDOHYEON';
    cursor: pointer;
    border: #3399DD solid 1px;
    background: #33C9FD left bottom repeat-x;
    color: #ffffff;
    height: 21px;
}
</style>
<body>
	<div class="upperdiv">
		<img alt="" src="img/total.jpg" width=50 height=20>
		<table class="upper">
			<tr style="width:400px;"> <%@ include file="/WEB-INF/jsp/gridBBS/ad.jsp" %></tr>
			<tr>
				<td><img alt="" src="../img/total.jpg">&nbsp;&nbsp; 
				<font face='BMDOHYEON'>JDK에서 일본 개발자 생활기를 연재하실 분들을 모집합니다. </font></td>
				
			</tr>
		</table>
	</div> 
	<div class="lifestorymain" style="text-align:center; padding-top:20px;">
	<img src="../img/lifestory.png" alt="" height=300 width=600>
	</div>
	<div class="list" style="text-align:center; padding-top:20px;">
	<h2>연재 중인 생활기 목록</h2>
		<ul>
			<li><a href="#" >■ 별달고 꺼드럭거리 싶어서 쓰는 생활기</a></li>
			<li><a href="#">■ 에스컬레이터 생활기</a></li>
			<li><a href="#">■ 보이쉬재패니즈</a></li>
		</ul>
	</div>
	<!--  잠시 확인 -->
	<h2><font face='BMDOHYEON'>회원가입</font></h2>
	<div class="msg">
		<span>(*)</span> 표시가 있는 항목은 반드시 입력해야 합니다.<br />
		허위로 작성된 정보일 경우 승인이 보류되거나 임의로 삭제처리될 수 있으니 주의해 주세요.
	</div>
	<table class="joinTable" summary="회원가입 기본정보를 입력받는 표입니다.">
<colgroup> 
<col width="100"> 
<col> 
</colgroup>
<thead>
<tr>
	<th scope="col"></th>
	<th scope="col"></th>
</tr>
</thead>
<tbody> <!--  가입폼 작성 시작 -->
<tr>
	<td class="key">이름(실명)<span>*</span></td>
		<td><input type="text" name="name" value="" maxlength="10" class="input" /></td>
	</tr>
	<tr>
		<td class="key">닉네임<span>*</span></td>
		<td><input type="text" name="nic" value="" maxlength="20" class="input" onblur="sameCheck(this,'hLayernic');" />
	    <!--  onblur : 마우스 커서가 빠져나가는 순간 이벤트 -->
		<span class="hmsg" id="hLayernic"></span>
		<div>닉네임은 자신을 표현할 수 있는 단어로 20자까지 자유롭게 사용할 수 있습니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">생년월일</td>
		<td>
		<select name="birth_1">
		<c:forEach var="i" begin="0" end="${2016-1930}">
  		  <c:set var="yearOption" value="${2016-i}" />
    		<option value="${yearOption}">${yearOption}</option>
		</c:forEach>
		</select>
		<select name="birth_2">
		<option value="">월</option>
			<option value="01">1</option>
			<option value="02">2</option>
			<option value="03">3</option>
			<option value="04">4</option>
			<option value="05">5</option>
			<option value="06">6</option>
			<option value="07">7</option>
			<option value="08">8</option>
			<option value="09">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="birth_3">
		<option value="">일</option>
		<c:forEach var="i" begin="1" end="31">
  		  <c:set var="day" value="${i}" />
    		<option value="${day}">${day}</option>
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td class="key">성별<span>*</span></td>
		<td class="shift">
			<input type="radio" name="sex" value="1" />남성
			<input type="radio" name="sex" value="2" />여성
	</td>
	</tr>	
	<tr>
	<td class="key">아이디<span>*</span></td>
		<td>
			<input type="text" name="id" value="" maxlength="12" class="input" onblur="sameCheck(this,'hLayerid');" />
			<span class="hmsg" id="hLayerid"></span>
			<div>4~12자의 영문(소문자)과 숫자만 사용할 수 있습니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">비밀번호<span>*</span></td>
		<td><input type="password" name="pw1" value="" maxlength="20" class="input" />
			<div>4~12자의 영문과 숫자만 사용할 수 있습니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">비밀번호 확인<span>*</span></td>
		<td>
		<input type="password" name="pw2" value="" maxlength="20" class="input" />
		<div>비밀번호를 한번 더 입력하세요. 비밀번호는 잊지 않도록 주의하시기 바랍니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">비번찾기 질문<span>*</span></td>
		<td>
		<select name="_pw_q" class="pw_q1">
		<option value="">&nbsp;+ 선택하십시오.</option>
		<option value="">-----------------------------------------------------------------------------</option>
				<option>ㆍ내가 좋아하는 캐릭터는?</option>
				<option>ㆍ타인이 모르는 자신만의 신체비밀이 있다면?</option>
				<option>ㆍ자신의 인생 좌우명은?</option>
				<option>ㆍ초등학교 때 기억에 남는 짝꿍 이름은?</option>
				<option>ㆍ유년시절 가장 생각나는 친구 이름은?</option>
				<option>ㆍ가장 기억에 남는 선생님 성함은?</option>
				<option>ㆍ친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
				<option>ㆍ다시 태어나면 되고 싶은 것은?</option>
				<option>ㆍ가장 감명깊게 본 영화는?</option>
				<option>ㆍ읽은 책 중에서 좋아하는 구절이 있다면?</option>
				<option>ㆍ기억에 남는 추억의 장소는?</option>
				<option>ㆍ인상 깊게 읽은 책 이름은?</option>
				<option>ㆍ자신의 보물 제1호는?</option>
				<option>ㆍ받았던 선물 중 기억에 남는 독특한 선물은?</option>
				<option>ㆍ자신이 두번째로 존경하는 인물은?</option>
				<option>ㆍ아버지의 성함은?</option>
				<option>ㆍ어머니의 성함은?</option>
				</select><br />
		<div><input type="text" name="pw_q" value="" class="input pw_q2" /></div>
		</td>
	</tr>
	<tr>
		<td class="key">비번찾기 답변<span>*</span></td>
		<td><input type="text" name="pw_a" value="" class="input" />
		<div>
		비밀번호찾기 질문에 대한 답변을 혼자만 알 수 있는 단어나 기호로 입력해 주세요.<br />
		비밀번호를 찾을 때 필요하므로 반드시 기억해 주세요.
		</div>
		</td>
	</tr>
	<tr>
		<td class="key">이메일</td>
		<td><input type="text" name="email" value="" size="35" class="input" onblur="sameCheck(this,'hLayeremail');" />
		<span class="hmsg" id="hLayeremail"></span></td>
	</tr>
	<tr>
		<td class="key">지역</td>
		<td><input type="text" name="area" value="" size="15" class="input" />
		
		</td>
	</tr>
	<tr>
		<td></td>
		<td><div class="submitbox">
			<input type="button" value="가입취소" class="btngray" onclick="goHref('./');" />
			<input type="submit" value="회원가입" class="btnblue" />
		</div></td>
	</tbody>
</table>

	<div class="clear" style="margin-bottom:60px;"></div>
	
</body>
</html>