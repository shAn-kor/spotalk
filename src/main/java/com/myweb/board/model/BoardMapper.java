package com.myweb.board.model;

public interface BoardMapper {

	void insertPost(BoardDTO dto);
	String getPostId(String user_id);
	BoardDTO getPost(String post_id);
}
