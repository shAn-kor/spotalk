package com.myweb.board.model;

import java.util.Map;

public class BoardCheck {
	
	String order;
	Map<String, Integer> params;
	String searchTerm;

	public BoardCheck() {
		
	}

	public BoardCheck(String order, Map<String, Integer> params, String searchTerm) {
		this.order = order;
		this.params = params;
		this.searchTerm = searchTerm;
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

	public String getSearchTerm() {
		return searchTerm;
	}

	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}
	

	

	
	
	

}
