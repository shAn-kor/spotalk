package com.myweb.board.model;

import java.util.Map;

public class BoardCheck {
	
	String order;
	Map<String, Integer> params;

	public BoardCheck() {
		
	}

	public BoardCheck(String order, Map<String, Integer> params) {
		this.order = order;
		this.params = params;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Map<String, Integer> getParams() {
		return params;
	}

	public void setParams(Map<String, Integer> params) {
		this.params = params;
	}

}
