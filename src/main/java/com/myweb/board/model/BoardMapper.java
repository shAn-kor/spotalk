package com.myweb.board.model;

public interface BoardMapper {

	void insertPost(BoardDTO dto);
	String getPostId(String userId);
	BoardDTO getPost(String postId);
	void insertComment(BoardDTO dto);
}
