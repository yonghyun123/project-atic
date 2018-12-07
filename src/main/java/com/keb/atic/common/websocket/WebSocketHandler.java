package com.keb.atic.common.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.servlet.mvc.condition.ProducesRequestCondition;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.keb.atic.project.domain.Project;
import com.keb.atic.project.service.ProjectService;
import com.keb.atic.userProject.domain.UserProject;
import com.keb.atic.userProject.service.UserProjectService;

import lombok.extern.log4j.Log4j;

@Log4j
public class WebSocketHandler extends TextWebSocketHandler {
	private HashMap<String, ArrayList<WebSocketSession>> connectedClients = new HashMap<>();
	private int count = 0;
	private String projectId;
	@Inject
	UserProjectService userProjectService;
	@Inject
	ProjectService projectService;

	/** 웹 클라이언트 연결 이벤트 처리 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("웹클라이언트(" + session.getId() + ") 연결함...");


	}

	/** 웹 클라이언트 메시지 수신 이벤트 처리 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Gson gson = new Gson();
		Message msg = gson.fromJson(message.getPayload(), Message.class);
		projectId = msg.getProjectId();
		String loginId = msg.getLoginId();
		switch (msg.getType()) {
		case 1000:
			String curPrice1 = msg.getCurPrice();
			if (connectedClients.get(projectId) == null) {
				connectedClients.put(projectId, new ArrayList<>());
			}
			UserProject userProject= new UserProject();
			userProject.setUserId(loginId);
			userProject.setProjectId(projectId);
			int check = userProjectService.checkInvest(userProject);
			String sendMsg ="";
			if(check > 0) {
				sendMsg = "false";
			}else {
				sendMsg = "true";
			}
			connectedClients.get(projectId).add(session);
			count = connectedClients.get(projectId).size();
			Gson gs1 = new Gson();
			Message msg1 = new Message(1000, count,sendMsg);
			String str1 = String.format("%,d", Integer.parseInt(curPrice1));
			msg1.setCurPrice(str1);
			String json1 = gs1.toJson(msg1);
			TextMessage tm1 = new TextMessage(json1);
			sendMessageToAll(tm1, projectId);
			break;
		case 2000:
			ArrayList<WebSocketSession> list1 = connectedClients.get(projectId);
			Iterator<WebSocketSession> it = list1.iterator();
			while (it.hasNext()) {
				WebSocketSession wss = it.next();
				if(wss.equals(session)) {
					it.remove();
				}
			}
			count = connectedClients.get(projectId).size();
			Gson gs = new Gson();
			Message msg2 = new Message(2000, count);
			String json = gs.toJson(msg2);
			TextMessage tm = new TextMessage(json);
			sendMessageToAll(tm, projectId);
			break;
		case 3000:
			String deposit = msg.getDeposit();
			int sumDeposit = userProjectService.checkDeposit(loginId);
			if(Integer.parseInt(deposit)+sumDeposit > 1000000) {
				Gson gs4 = new Gson();
				Message msg4 = new Message();
				msg4.setType(4000);
				String json4 = gs4.toJson(msg4);
				TextMessage tm4 = new TextMessage(json4);
				session.sendMessage(tm4);
			}else {
			String curPrice = msg.getCurPrice();
			int money = Integer.parseInt(deposit) + Integer.parseInt(curPrice); 
			UserProject userProject1 = new UserProject(deposit, loginId, projectId);
			userProjectService.createUserProject(userProject1);
			Project project = new Project(projectId, String.valueOf(money));
			projectService.updateProject(project);
			Gson gs3 = new Gson();
			Message msg3 = new Message(3000, String.valueOf(money));
			String str = String.format("%,d", money);
			msg3.setCurPrice(str);
			String json3 = gs3.toJson(msg3);
			TextMessage tm3 = new TextMessage(json3);
			sendMessageToAll(tm3, projectId);
			}
			break;
		}

	}
	
	private void sendMessageToAll(TextMessage tm, String projectId) throws Exception{
		ArrayList<WebSocketSession> list = connectedClients.get(projectId);
		Iterator<WebSocketSession> it = list.iterator();
		while (it.hasNext()) {
			WebSocketSession wss = it.next();
			wss.sendMessage(tm);
		}
		
	}

	/** 웹 클라이언트 연결 종료 이벤트 처리 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("웹클라이언트(" + session.getId() + ") 연결 종료함...");
		List<WebSocketSession> list = connectedClients.get(projectId);
		Iterator<WebSocketSession> it = list.iterator();
		while (it.hasNext()) {
			WebSocketSession wss = it.next();
			if(wss.equals(session)) {
				it.remove();
			}
		}

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.info("클라이언트(" + session.getId() + ")와 메시지 송수신 중 예외 발생 : " + exception);
		
	}
}
