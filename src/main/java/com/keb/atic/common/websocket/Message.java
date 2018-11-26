package com.keb.atic.common.websocket;

public class Message {
	private int type;
	private int count;
	private String message;
	
	public Message() {}

	public Message(int type, int count) {
		super();
		this.type = type;
		this.count = count;
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
		return "Message [type=" + type + ", count=" + count + ", message=" + message + "]";
	}
	
	
	
}
