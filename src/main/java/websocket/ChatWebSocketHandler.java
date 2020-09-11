package websocket;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
@ServerEndpoint("/chat-ws")
public class ChatWebSocketHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	public void afterConnectionEstablished(WebSocketSession session) {
		try {
			
			System.out.println("연결됨");
			// session에서 id를 가져와서 로그에 남긴다(없어도 되는 과정)
			log(session.getId() + " 연결 됨");

			// 위에서 선언한 users라는 map에 user를 담는 과정(필수)
			// map에 담는 이유는 메세지를 일괄적으로 뿌려주기 위해서이다
			users.put(session.getId(), session);
		} catch (Exception e) {
			System.out.println("연결오류");
		}

	}
	
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		try {
			System.out.println("연결 종료됨");
			log(session.getId() + " 연결 종료됨");

			// map에서 세션에서 연결 종료된 유저를 없애는 이유는
			// 더 이상 메세지를 보낼 필요가 없기 때문에 목록에서 지우는 것이다
			users.remove(session.getId());
		} catch (Exception e) {
			System.out.println("연결종료");
		}

	}
	
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		try {
			System.out.println("메시지 수신");
			log(session.getId() + "로부터 메시지 수신: " + message.getPayload());

			// 클라이언트로부터 메세지를 받으면 동작하는 handleTextMessage 함수!
			// 수신한 하나의 메세지를 users 맵에 있는 모든 유저(세션)들에게
			// 맵을 반복으로 돌면서 일일이 보내주게 되도록 처리
			for (WebSocketSession s : users.values()) { // <-- .values() 로 session들만 가져옴

				// 여기서 모든 세션들에게 보내지게 된다
				// 1회전당 현재 회전에 잡힌 session에게 메세지 보낸다
				s.sendMessage(message);

				// 로그에 남기기 위한 것으로 큰 의미가 없음
				log(s.getId() + "에 메시지 발송: " + message.getPayload());
			}
		} catch (Exception e) {
			System.out.println("연결종료");
		}

	}
	
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		try {
			log(session.getId() + " 익셉션 발생: " + exception.getMessage());
		} catch (Exception e) {
			System.out.println("익셉션");
		}

	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}