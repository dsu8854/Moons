package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;

import socket.WebSocketHandler;

public class SocketFilter implements Filter {
	
    @Override
    public void init(FilterConfig config) throws ServletException {
    	System.out.println("필터 생성");
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {
        // 다음 필터의 호출, 실제 자원의 처리를 합니다.
    	HttpServletRequest req = (HttpServletRequest) request;
    	HttpSession session = req.getSession();
    	
    	int user_code = (int) session.getAttribute("user_code");
    	
    	System.out.println("입장 : " + user_code);
    	
    	WebSocketMessage<String> sendMsg = new TextMessage("3|"+user_code);
		WebSocketHandler handler = WebSocketHandler.getInstance();
		try {
			handler.handleMessage(handler.userList.get(String.valueOf(user_code)), sendMsg);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        chain.doFilter(request, response);

    	System.out.println("퇴장 : " + user_code);
        
        sendMsg = new TextMessage("4|"+user_code);
		try {
			handler.handleMessage(handler.userList.get(String.valueOf(user_code)), sendMsg);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    @Override
    public void destroy() {
    	System.out.println("필터 해제");
    }
}