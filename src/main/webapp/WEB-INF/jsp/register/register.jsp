<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입자 등록화면</title>
<link href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff' rel='stylesheet' type='text/css'>
<style type="text/css">
 
@font-face {
font-family: 'BMDOHYEON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff') format('woff');
font-weight: normal; font-style: normal; }

.msg {  font-size: 1em; font-family:'BMDOHYEON'; font-color:red; border-top:3px solid black; padding:20px 0 20px 0; width:700px; }
.key{   font-size: 0.7em; font-family:'BMDOHYEON'; font-color:red;  }

.joinTable td{ border-top:1px solid silver; padding:10px 0 10px 0;  }
.joinTable div{ font-family:'BMDOHYEON';  font-size: 0.7em; font-color:#0000ff; padding-top:10px;}
.joinTable h5{ color:#ff0000;}
input{ height:25px;}
.submitbox {top:50%; right:50%;}
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
#font{ font-family:'BMDOHYEON';  font-size: 0.7em; }
</style>
</head>
<script type="text/javascript">
function pwdValid(){
	var pwd=document.getElementById("pwd").value;
	var pwdCheck=document.getElementById("pwdCheck").value;
	if(pwd!=pwdCheck){
		document.getElementById("pwdVaildMessage").style.display="block";
	}
	if(pwd == pwdCheck){
		document.getElementById("pwdVaildMessage").style.display="none";
	}
}
function quizDisplay(quiztext) {
    var selection = quiztext;
	document.getElementById("quiz").value=selection;
    return true;
}
</script>
<body>
<div style="padding:30px 0 0 15px;">
<form:form action="../register/registerpost.html" modelAttribute="user" method="post" enctype="multipart/form-data">
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
	<td class="key">이름(실명)<h5>*</h5></td>
		<td><form:input type="text" path="name" maxlength="10" class="input" />
		<font color="red" id="font" ><form:errors path="name"/></font>
		<div>이름은 반드시 적어주셔야 합니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">닉네임<h5>*</h5></td>
		<td><form:input type="text" path="nick" value="" maxlength="20" class="input" onblur=""/>
		<font color="red" id="font" ><form:errors path="nick"/></font>
	    <!--  onblur : 마우스 커서가 빠져나가는 순간 이벤트 -->
		<span class="hmsg" id="hLayernic"></span>
		<div>닉네임은 자신을 표현할 수 있는 단어로 20자까지 자유롭게 사용할 수 있습니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">생년월일</td>
		<td>
		<form:select path="birth_date">
		<c:forEach var="i" begin="0" end="${2016-1930}">
  		  <c:set var="yearOption" value="${2016-i}" />
    		<form:option value="${yearOption}" label="${yearOption }"/>
		</c:forEach>
		</form:select>
		</td>
	</tr>
<%-- 		<formselect name="birth_2"> --%>
<!-- 		<option value="">월 -->
<!-- 			<option value="01">1 -->
<!-- 			<option value="02">2 -->
<!-- 			<option value="03">3 -->
<!-- 			<option value="04">4 -->
<!-- 			<option value="05">5 -->
<!-- 			<option value="06">6 -->
<!-- 			<option value="07">7 -->
<!-- 			<option value="08">8 -->
<!-- 			<option value="09">9 -->
<!-- 			<option value="10">10 -->
<!-- 			<option value="11">11 -->
<!-- 			<option value="12">12 -->
<!-- 		</select> -->
<!-- 		<select name="birth_3"> -->
<!-- 		<option value="">일 -->
<%-- 		<c:forEach var="i" begin="1" end="31"> --%>
<%--   		  <c:set var="day" value="${i}" /> --%>
<%--     		<option value="${day}">${day} --%>
<%-- 		</c:forEach> --%>
<!-- 		</select> -->
<!-- 		</td> -->
<!-- 	</tr> -->
	<tr>
		<td class="key">성별</td>
		<td class="shift">
			<form:radiobutton path="gender" value="M" checked="checked"/><font face='BMDOHYEON' size="0.9em">남성</font>
			<form:radiobutton path="gender" value="F" /><font face='BMDOHYEON' size="0.9em">여성</font>
		</td>
	</tr>	
	<tr>
	<td class="key">아이디<h5>*</h5></td>
		<td>
			<form:input type="text" path="id" maxlength="12" class="input" onblur=""/>
			<font color="red" id="font" ><form:errors path="id"/></font>
			<span class="hmsg" id="hLayerid"></span>
			<div>4~12자의 영문(소문자)과 숫자만 사용할 수 있습니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">비밀번호<h5>*</h5></td>
		<td><form:password path="password" maxlength="20" id="pwd" class="input" />
		<font color="red" id="font" ><form:errors path="password"/></font>
			<div>4~12자의 영문과 숫자만 사용할 수 있습니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">비밀번호 확인<h5>*</h5></td>
		<td>
		<input type="password" id="pwdCheck" onblur="pwdValid();">
		<font color="red" id="font" size="1em"><span id="pwdVaildMessage" style="display:none;">암호와 암호확인이 일치하지 않습니다!!</span></font>
		<div>비밀번호를 한번 더 입력하세요. 비밀번호는 잊지 않도록 주의하시기 바랍니다.</div>
		</td>
	</tr>
	<tr>
		<td class="key">비번찾기 질문<h5>*</h5></td>
		<td>
			<select class="pw_q1" onchange="quizDisplay(this.options[this.selectedIndex].text)">
				<option value="">&nbsp;+ 선택하십시오.</option>
				<option value="">-----------------------------------------------------------------------------</option>
				<option value="내가 좋아하는 캐릭터는?">ㆍ내가 좋아하는 캐릭터는?</option>
				<option value="타인이 모르는 자신만의 신체비밀이 있다면?">ㆍ타인이 모르는 자신만의 신체비밀이 있다면?</option>
				<option value="자신의 인생 좌우명은?">ㆍ자신의 인생 좌우명은?</option>
				<option value="초등학교 때 기억에 남는 짝꿍 이름은?">ㆍ초등학교 때 기억에 남는 짝꿍 이름은?</option>
				<option value="유년시절 가장 생각나는 친구 이름은?">ㆍ유년시절 가장 생각나는 친구 이름은?</option>
				<option value="가장 기억에 남는 선생님 성함은?">ㆍ가장 기억에 남는 선생님 성함은?</option>
				<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">ㆍ친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
				<option value="다시 태어나면 되고 싶은 것은?">ㆍ다시 태어나면 되고 싶은 것은?</option>
				<option value="가장 감명깊게 본 영화는?">ㆍ가장 감명깊게 본 영화는?</option>
				<option value="읽은 책 중에서 좋아하는 구절이 있다면?">ㆍ읽은 책 중에서 좋아하는 구절이 있다면?</option>
				<option value="기억에 남는 추억의 장소는?">ㆍ기억에 남는 추억의 장소는?</option>
				<option value="인상 깊게 읽은 책 이름은?">ㆍ인상 깊게 읽은 책 이름은?</option>
				<option value="자신의 보물 제1호는?">ㆍ자신의 보물 제1호는?</option>
				<option value="받았던 선물 중 기억에 남는 독특한 선물은?">ㆍ받았던 선물 중 기억에 남는 독특한 선물은?</option>
				<option value="자신이 두번째로 존경하는 인물은?">ㆍ자신이 두번째로 존경하는 인물은?</option>
				<option value="아버지의 성함은?">ㆍ아버지의 성함은?</option>
				<option value="어머니의 성함은?">ㆍ어머니의 성함은?</option>
			</select><br/>
		<div><form:input type="text" path="quiz" id="quiz" plackholder="직접 작성"  /></div>
		<font color="red" id="font" ><form:errors path="quiz"/></font>
		</td>
	</tr>
	<tr>
		<td class="key">비번찾기 답변<h5>*</h5></td>
		<td><form:input type="text"  path="answer" class="input" />
		<font color="red" id="font" ><form:errors path="answer"/></font>
		<div>
		비밀번호찾기 질문에 대한 답변을 혼자만 알 수 있는 단어나 기호로 입력해 주세요.<br />
		비밀번호를 찾을 때 필요하므로 반드시 기억해 주세요.
		</div>
		</td>
	</tr>
	<tr>
		<td class="key">이메일</td>
		<td><form:input type="text" path="email" size="35" class="input" />
		<font color="red" id="font" ><form:errors path="email"/></font>
		<span class="hmsg" id="hLayeremail"></span></td>
	</tr>
	<tr>
		<td class="key">지역</td>
		<td><form:input path="area" size="15" class="input" />
		
		</td>
	</tr>
	<tr>
		<td class="key">사진</td>
		<td><input type="file" name="picture"/>
	</td>
	</tr>
	<tr>
		<td></td>
		<td><div class="submitbox">
			<input type="button" value="가입취소" class="btngray" onclick="location.href='../index/index.html?BODY=freebbs/freebbs'"/>
			<input type="submit" value="회원가입" class="btnblue" />
		</div></td>
	</tbody>
</table>
</form:form>
</div>
</body>
</html>