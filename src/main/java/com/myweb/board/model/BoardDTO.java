package com.myweb.board.model;

public class BoardDTO {
	
	String postId; //자동
	String userId; //세션
	String category;
	String postTitle;
	String postContent;
	String postDate; //디폴트 시스데이트
	String hit; //디폴트 0
	String postLike; //디폴트 0
	String postDislike; //디폴트 0
	String gradeId; //세션
	
	String commentId; //자동
	String commentContent;
	String commentDate; //디폴트 시스데이트
	String commentLike; //디폴트 0
	String commentDislike; //디폴트 0
	
	public BoardDTO() {
		
	}

	public BoardDTO(String postId, String userId, String category, String postTitle, String postContent,
			String postDate, String hit, String postLike, String postDislike, String gradeId, String commentId,
			String commentContent, String commentDate, String commentLike, String commentDislike) {
		this.postId = postId;
		this.userId = userId;
		this.category = category;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postDate = postDate;
		this.hit = hit;
		this.postLike = postLike;
		this.postDislike = postDislike;
		this.gradeId = gradeId;
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.commentLike = commentLike;
		this.commentDislike = commentDislike;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getPostLike() {
		return postLike;
	}

	public void setPostLike(String postLike) {
		this.postLike = postLike;
	}

	public String getPostDislike() {
		return postDislike;
	}

	public void setPostDislike(String postDislike) {
		this.postDislike = postDislike;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentLike() {
		return commentLike;
	}

	public void setCommentLike(String commentLike) {
		this.commentLike = commentLike;
	}

	public String getCommentDislike() {
		return commentDislike;
	}

	public void setCommentDislike(String commentDislike) {
		this.commentDislike = commentDislike;
	}
	
	
	
	
}
