package com.myweb.board.model;

import java.util.List;
import java.util.Map;

public interface BoardMapper {

	void insertPost(BoardDTO dto);
	String getPostId(String userId);
	BoardDTO getPost(String postId);
	List<BoardDTO> getPosts(BoardCheck check);
	List<BoardDTO> getAnnPosts(BoardCheck check);
	List<BoardDTO> getSoccerPosts(BoardCheck check);
	List<BoardDTO> getBaseballPosts(BoardCheck check);
	List<BoardDTO> getBasketballPosts(BoardCheck check);
	int getTotalPosts();
	BoardDTO sortPosts(String postId);
	
}
