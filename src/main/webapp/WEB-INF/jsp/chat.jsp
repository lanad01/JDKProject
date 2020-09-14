<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevEric Chatting</title>
<link rel="stylesheet" href="../css/chat.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<style type="text/css">

</style>
</head>
<body>
${ID }
${USER.picture_url }
	<input type="hidden" id="client" value="${ID }">
	<input type="text" id="pic" value="">
	<div id="main-container">
		
		<div id="chat-container">
		
		</div>
		<div id="bottom-container">
			<input id="inputMessage" type="text">
			<input id="btn-submit" type="submit" value="전송" >
		</div>
	</div>
</body>

<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
	

	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket("ws://localhost:8080/3-5_/broadsocket");
	
	// 로컬에서 테스트할 때 사용하는 URL입니다.
// 	var webSocket = new WebSocket('ws://localhost/DevEricServers/webChatServer');
	var inputMessage = document.getElementById('inputMessage');
	
	webSocket.onerror = function(e){
		onError(e);
	};
	webSocket.onopen = function(e){
		onOpen(e);
	};
	webSocket.onmessage = function(e){
		onMessage(e);
	};
	
	
	function onMessage(e){ // 상대방 메시지
		var chatMsg = event.data;
		var sender=chatMsg.split(":"); //aldne 수신성공
		$.ajax({
   	 		async: true,
   			type : 'POST',
   			data : { "sender": sender[0] } ,
  			dataType : "text",
			url : "../chat/chatid.html",
		    success : function(data){
		    	document.getElementById("pic").value=data;
// 		    	alert("ajax 분기 "+chatMsg);
		   	},error : function(e){z
		   		alert('실패');
		  		}
		  })
		var pic=document.getElementById("pic").value;
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
		if(chatMsg.substring(0,6) == 'server'){
			var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
			$('#chat-container').append($chat);
		}else{ // 상대방 메시지
			var $chat = $("<div class='chat-box'><img alt='상대' src='${pageContext.request.contextPath}/upload/"
					+pic +"' width='60' height='40' style='margin-top:5px;'>"+
					"<div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box' style='margin-top:-10px;'>"+ dateInfo +"</div></div>");
			$('#chat-container').append($chat);
		}
		
		
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
	}
	
	function onOpen(e){
		
	}
	
	function onError(e){
		alert(e.data);
	}
	
	function send(){ // 내 메시지
		var id=document.getElementById("client").value;
		var chatMsg = id+"split"+inputMessage.value;
		var chatMsg2=chatMsg.replace("split","");
		var chatMsg3=chatMsg2.replace(id,"");
		if(chatMsg == ''){
			return;
		}
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
		var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" +chatMsg3 +"</div>"+
				"<img alt='내 사진' src='${pageContext.request.contextPath}/upload/${USER.picture_url}' style='margin-top:5px;' width='60' height='50' >"
				+"<div class='chat-info' style='margin-top:-10px;'>"+ dateInfo +"</div></div>");
		$('#chat-container').append($chat);
		webSocket.send(chatMsg);
		 // 설마이걸로 보내나 이럼 쉬워지지
		inputMessage.value = "";
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
	}
	
</script>

<script type="text/javascript">
	$(function(){
		
		$('#inputMessage').keydown(function(key){
			if(key.keyCode == 13){
				$('#inputMessage').focus();
				send();
			}
		});
		$('#btn-submit').click(function(){
			send();
		});
		
	})
</script>
</html>