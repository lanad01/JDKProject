<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

<link
	href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/mypage.css">
<link
	href='https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff'
	rel='stylesheet' type='text/css'>
<style type="text/css">
@font-face {
	font-family: 'BMDOHYEON';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.msg {
	font-size: 1em;
	font-family: 'BMDOHYEON';
	font-color: red;
	border-top: 3px solid black;
	padding: 20px 0 20px 0;
	width: 700px;
}

.key {
	font-size: 1em;
	font-family: 'BMDOHYEON';
	font-color: red;
	background:silver;
}

.modify tr {
	height:60px; width:100px;
	border-bottom:1px solid silver;
	margin-top:5px; 
	margin-bottom:5px;
}
.modify td{ margin-top:5px; 
	margin-bottom:5px;}

h5 {color: #ff0000;}

input {
	height: 25px;
	
}

.submitbox {
	top: 50%;
	right: 50%;
}

.btngray {
	font-family: 'BMDOHYEON';
	cursor: pointer;
	border: #666666 solid 1px;
	background: #B3B3B3 left bottom repeat-x;
	color: #ffffff;
	height: 21px;
}

.btnblue {
	font-family: 'BMDOHYEON';
	cursor: pointer;
	border: #3399DD solid 1px;
	background: #33C9FD left bottom repeat-x;
	color: #ffffff;
	height: 21px;
}

#font {
	font-family: 'BMDOHYEON';
	font-size: 0.7em;
}
</style>
</head>
<script type="text/javascript">
	function morebox() {
		document.getElementById("morebox").style.display = "block";
	}
	function moreboxClose() {
		document.getElementById("morebox").style.display = "none";
	}
	function quizDisplay(quiztext) {
	    var selection = quiztext;
		document.getElementById("quiz").value=selection;
	    return true;
	}
</script>
<body>
	<div class="main">
		<div class="msg">
			<form:form action="../register/modify.html?page=2" modelAttribute="user" method="post" enctype="multipart/form-data">
				<div class="msg">
					<span>(*)</span> 표시가 있는 항목은 반드시 입력해야 합니다.<br /> 허위로 작성된 정보일 경우 승인이
					보류되거나 임의로 삭제처리될 수 있으니 주의해 주세요.
				</div>
				<form:hidden path="user_no"/>
				<form:hidden path="register_date"/>
				<table class="modify">
					<tr><td>이름 <font color="red" id="font">*</font> :  </td>
						<td><form:input path="name" maxlength="20"/>
						<font color="red" id="font" ><form:errors path="name"/></font></td>
					</tr>
					<tr><td>닉네임  <font color="red" id="font">*</font> :  </td>
						<td><form:input path="nick" maxlength="20"/>
						<font color="red" id="font" ><form:errors path="name"/></font>
						<div><font size="1.0">닉네임은 자신을 표현할 수 있는 단어로 20자까지 자유롭게 사용할 수 있습니다.</font></div></td>
					</tr>
					<tr><td>생일  <font color="red" id="font"></font> :  </td>
						<td>
						<form:select path="birth_date">
						<c:forEach var="i" begin="0" end="${2016-1930}">
  						  <c:set var="yearOption" value="${2016-i}" />
    						<form:option value="${yearOption}" label="${yearOption }"/>
						</c:forEach>
						</form:select>
						</td>
					</tr>
					<tr><td>성별 : </td>
						<td><form:radiobutton path="gender" value="M" checked="checked"/><font face='BMDOHYEON' size="0.9em">남성</font>
							<form:radiobutton path="gender" value="F" /><font face='BMDOHYEON' size="0.9em">여성</font>
						</td>
					</tr>
					<tr><td>아이디 <font color="red" id="font">*</font> :  </td>
						<td><form:input path="id" maxlength="8" disabled="true"/>
						<font color="red" id="font" ><form:errors path="id"/></font>
						<div><font color="red" size="1.0">아이디는 바꿀 수 없습니다!!</font></div>
						</td>
					</tr>
					<tr><td>비밀번호 <font color="red" id="font">*</font> :  </td>
						<td><form:input path="password" maxlength="20" disabled="true"/>
						<div><font color="red" size="1.0">비밀번호 변경 기능을 사용해주세요!!</font></div>
						</td>
					</tr>
					<tr><td>비번찾기 질문  <font color="red" id="font">*</font> : </td>
						<td>
						<select class="pw_q1" onchange="quizDisplay(this.options[this.selectedIndex].text)">
						<option value="">&nbsp;+ 선택하십시오.</option>
						<option value="" selected disabled>-------------------------------</option>
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
						<div><font size="1.0"><form:input type="text" path="quiz" id="quiz" placeholder="직접 작성" size="40" /></font></div>
						<font color="red" id="font" ><form:errors path="quiz"/></font>
						</td>
					</tr>
					<tr><td>비번 찾기 답변   <font color="red" id="font">*</font> : </td>
						<td><form:input type="text"  path="answer" class="input" />
						<font color="red" id="font" ><form:errors path="answer"/></font>
						<div>
						<font size="1.0">비밀번호찾기 질문에 대한 답변을 혼자만 알 수 있는 단어나 기호로 입력해 주세요.<br />
						비밀번호를 찾을 때 필요하므로 반드시 기억해 주세요.</font>
						</div>
						</td>
					</tr>
					<tr><td>이메일 : </td>
						<td><form:input type="text" path="email" size="35" class="input" />
						<font color="red" id="font" ><form:errors path="email"/></font>
						</td>
					</tr>
					<tr><td>지역 : </td>
						<td><form:input path="area" size="15" class="input" />
						</td>
					</tr>
					<tr><td>사진 : </td>
						<td><input type="file" name="picture"/></td>
					</tr>
					<tr style="border-bottom:none; ">
					<td>
					<div class="submitbox" style="padding-left:50px;">
					<input type="submit" value="정보변경" class="btnblue" />
					</div>
					</td>
				</table>
			</form:form>
		</div>
	</div>
	<!-- Ui종료  -->
</body>
</html>