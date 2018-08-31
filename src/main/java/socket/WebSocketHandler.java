package socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import controller.UserController;

public class WebSocketHandler extends TextWebSocketHandler {
	// 접속한 클라이언트들의 정보를 저장할 컬렉션 객체
	public static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	public static HashMap<String, WebSocketSession> userList = new HashMap<String, WebSocketSession>();
	public static HashMap<WebSocketSession, String> reverseUserList = new HashMap<WebSocketSession, String>();
	public static HashMap<String, WebSocketSession> dmRoomList = new HashMap<String, WebSocketSession>();
	public static HashMap<WebSocketSession, String> reverseDmRoomList = new HashMap<WebSocketSession, String>();
	
	public WebSocketHandler() {

	}
	
	private static WebSocketHandler handler = new WebSocketHandler();
	
	public static WebSocketHandler getInstance() {
		return handler;	
	}
	
	public HashMap<String, WebSocketSession> getUserList() {
		return userList;
	}

	// 클라이언트가 연결되었을 때 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
	}
	
	// 클라이언트가 메시지를 보냈을 때 호출되는 메소드
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// 전송된 메시지를 모든 클라이언트에게 전송
		String msg = (String) message.getPayload();

		System.out.println(msg);
		
		String[] msgArr = msg.split("\\|");
		
		/*
			1: 접속
			2: 접속해제
			3: 채팅방 입장
			4: 채팅방 퇴장
			5: 알림
			6: 다이렉트 메시지
		*/
		
		switch(msgArr[0]) {
		case "1":
			reverseUserList.put(session, msgArr[1]);
			userList.put(msgArr[1], session);
			break;
		case "2":
			reverseUserList.remove(session, msgArr[1]);
			userList.remove(msgArr[1], session);
			reverseDmRoomList.remove(session, msgArr[1]);
			dmRoomList.remove(msgArr[1], session);
			break;
		case "3":
			reverseDmRoomList.put(session, msgArr[1]);
			dmRoomList.put(msgArr[1], session);
			break;
		case "4":
			reverseDmRoomList.remove(session, msgArr[1]);
			dmRoomList.remove(msgArr[1], session);
			break;
		case "5":
			if(userList.containsKey(msgArr[1])) {
				WebSocketMessage<String> sendMsg = new TextMessage("notice");			
				userList.get(msgArr[1]).sendMessage(sendMsg);
			}
			break;
		case "6":
			if(dmRoomList.containsKey(msgArr[1])) {
				WebSocketMessage<String> sendMsg = new TextMessage("dm|0|"+msgArr[2]+"|"+msgArr[3]);
				dmRoomList.get(msgArr[1]).sendMessage(sendMsg);
			} else if(userList.containsKey(msgArr[1])){
				WebSocketMessage<String> sendMsg = new TextMessage("dm|1|"+msgArr[2]+"|"+msgArr[3]);
				userList.get(msgArr[1]).sendMessage(sendMsg);
			}
			break;
		}
		
		System.out.println("사이트 인원 : " + userList.size());
		System.out.println("채팅방 인원 : " + dmRoomList.size());
		/*
		if(msg.equals("1")) {
			Map<String,Object> map = session.getAttributes();
			dmRoomList.put((String) map.get("user_code"), session);
		}
		Map<String,Object> map = session.getAttributes();
		dmRoomList.remove((String) map.get("user_code"), session);
		*/
	}

	// 클라이언트와의 연결이 끊겼을 때 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 리스트에서 제거
		list.remove(session);
		
		String user_code = reverseUserList.get(session);
		
		if(user_code != null) {
			reverseUserList.remove(session, user_code);
			userList.remove(user_code, session);
			reverseDmRoomList.remove(session, user_code);
			dmRoomList.remove(user_code, session);
		}
	}
}