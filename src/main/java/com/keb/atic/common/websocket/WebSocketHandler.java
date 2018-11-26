package com.keb.atic.common.websocket;

import java.util.Enumeration;
import java.util.Vector;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Log4j
public class WebSocketHandler extends TextWebSocketHandler {
	private Vector<WebSocketSession> connectedClients = new Vector<WebSocketSession>(10, 2);
	private int count = 0;

	/** 웹 클라이언트 연결 이벤트 처리 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("웹클라이언트(" + session.getId() + ") 연결함...");
		connectedClients.addElement(session);
		count = connectedClients.size();
		Gson gs = new Gson();
		Message msg = new Message(1000, count);
		String json = gs.toJson(msg);
		TextMessage tm = new TextMessage(json);
		sendMessageToAll(tm);

	}

	/** 웹 클라이언트 메시지 수신 이벤트 처리 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Gson gson = new Gson();
		Message msg = gson.fromJson(message.getPayload(), Message.class);
		switch (msg.getType()) {
		case 2000:
			connectedClients.removeElement(session);
			count = connectedClients.size();
			Gson gs = new Gson();
			Message msg2 = new Message(2000, count);
			String json = gs.toJson(msg2);
			TextMessage tm = new TextMessage(json);
			sendMessageToAll(tm);
			break;
		case 3000:
			break;
		}

	}
	
	private void sendMessageToAll(TextMessage tm) throws Exception{
		Enumeration<WebSocketSession> e = connectedClients.elements();
		while (e.hasMoreElements()) {
			WebSocketSession client = e.nextElement();
			client.sendMessage(tm);
		}
	}

	/** 웹 클라이언트 연결 종료 이벤트 처리 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("웹클라이언트(" + session.getId() + ") 연결 종료함...");
		connectedClients.removeElement(session);

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.info("클라이언트(" + session.getId() + ")와 메시지 송수신 중 예외 발생 : " + exception);
		
	}
}
