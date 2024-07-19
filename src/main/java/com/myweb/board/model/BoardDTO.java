package com.myweb.board.model;

public class BoardDTO {
	
	String post_id; //자동
	String user_id; //세션
	String category;
	String title;
	String content;
	String regdate; //디폴트 시스데이트
	String hit; //디폴트 0
	String post_like; //디폴트 0
	String post_dislike; //디폴트 0
	String grade_id; //세션
	
	public BoardDTO() {
		
	}
	
	public BoardDTO(String post_id, String user_id, String category, String title, String content, String regdate,String hit, String post_like, String post_dislike, String grade_id) {
		this.post_id = post_id;
		this.user_id = user_id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
		this.post_like = post_like;
		this.post_dislike = post_dislike;
		this.grade_id = grade_id;
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getPost_like() {
		return post_like;
	}

	public void setPost_like(String post_like) {
		this.post_like = post_like;
	}

	public String getPost_dislike() {
		return post_dislike;
	}

	public void setPost_dislike(String post_dislike) {
		this.post_dislike = post_dislike;
	}

	public String getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	
	
	

}
