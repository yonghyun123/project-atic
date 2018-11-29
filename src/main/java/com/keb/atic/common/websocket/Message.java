package com.keb.atic.common.websocket;

public class Message {
	private int type;
	private int count;
	private String message;
	private String projectId;
	private String loginId;
	private String deposit;
	private String curPrice;
	
	public Message() {}

	public Message(int type, int count) {
		super();
		this.type = type;
		this.count = count;
	}
	
	

	
	public Message(int type, String message) {
		super();
		this.type = type;
		this.message = message;
	}

	public Message(int type, int count, String message, String projectId) {
		super();
		this.type = type;
		this.count = count;
		this.message = message;
		this.projectId = projectId;
	}

	
	
	public String getCurPrice() {
		return curPrice;
	}

	public void setCurPrice(String curPrice) {
		this.curPrice = curPrice;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Message [type=" + type + ", count=" + count + ", message=" + message + ", projectId=" + projectId
				+ ", loginId=" + loginId + ", deposit=" + deposit + ", curPrice=" + curPrice + "]";
	}


	
	
}
