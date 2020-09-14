package websocket;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;

// WebSocket 호스트 설정

@ServerEndpoint(value = "/broadsocket", 
				configurator = HttpSessionConfigurator.class)
public class BroadSocket {
	@Autowired
	UserDao userDao;
	private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());
	
// 접속 된 클라이언트 WebSocket session 관리 리스트
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
// 메시지에서 유저 명을 취득하기 위한 정규식 표현
	private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
	
// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) throws Exception {
// 클라이언트가 접속하면 WebSocket세션을 리스트에 저장한다.
		sessionUsers.add(userSession);
		if (!configs.containsKey(userSession)) {
			// userSession 클래스는 connection이 될 때마다 인스턴스 생성되는 값이기 때문에 키로서 사용할 수 있다.
			configs.put(userSession, config);
		}
		HttpSession session1 = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);
		String id=(String)session1.getAttribute("loginUser");
		System.out.println("id : "+id);
		sessionUsers.forEach(session -> {
			if (session == userSession) {
				// 리스트에 있는 세션과 메시지를 보낸 세션이 같으면 메시지 송신할 필요없다.
				return;
			}
			try {
				session.getBasicRemote().sendText((id+"님이 입장하셨습니다")); // 이게 실제로 상대방 메시지로 보이는 부분
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
		System.out.println("userSession List : "+id );
// 콘솔에 접속 로그를 출력한다.
		System.out.println("client is now connected...");
	}
// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
// 메시지 내용을 콘솔에 출력한다.
		String[] array=message.split("split");
		message=array[1];
// 초기 유저 명
		String name = array[0];
// 메시지로 유저 명을 추출한다.
		Matcher matcher = pattern.matcher(message);
// 메시지 예: {{유저명}}메시지
		if (matcher.find()) {
			name = matcher.group();
		}
		System.out.println(name);
// 클로져를 위해 변수의 상수화
		final String msg = message.replaceAll(pattern.pattern(), "");
		System.out.println(" 메시지  : " + msg);
		final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
		
// session관리 리스트에서 Session을 취득한다.
		sessionUsers.forEach(session -> {
			if (session == userSession) {
				// 리스트에 있는 세션과 메시지를 보낸 세션이 같으면 메시지 송신할 필요없다.
				return;
			}
			try {
// 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다. (형식: 유저명 => 메시지)
				session.getBasicRemote().sendText(username+": " + msg); // 이게 실제로 상대방 메시지로 보이는 부분
				
			} catch (IOException e) {
// 에러가 발생하면 콘솔에 표시한다.
				e.printStackTrace();
			}
		});
	}

// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession) {
// session 리스트로 접속 끊은 세션을 제거한다.
		sessionUsers.remove(userSession);
// 콘솔에 접속 끊김 로그를 출력한다.
		System.out.println("client is now disconnected...");
	}
	
}
