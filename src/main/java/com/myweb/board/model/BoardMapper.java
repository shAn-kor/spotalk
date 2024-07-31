package com.myweb.board.model;

import java.util.List;
import java.util.Map;

public interface BoardMapper {

	void insertPost(BoardDTO dto);
	String getPostId(String userId);
	BoardDTO getPost(String postId);
	List<BoardDTO> getHomePosts();
	List<BoardDTO> getPosts(BoardCheck check);
	List<BoardDTO> getAnnPosts(BoardCheck check);
	List<BoardDTO> getSoccerPosts(BoardCheck check);
	List<BoardDTO> getBaseballPosts(BoardCheck check);
	List<BoardDTO> getBasketballPosts(BoardCheck check);
	int getTotalPosts(String category);
	BoardDTO sortPosts(String postId);
	List<BoardDTO> getComments(String postId);
	void insertComment(BoardDTO dto);
	void updatePost(BoardDTO dto);
	void deletePost(Map<String, Object> params);
	void updateComment(BoardDTO dto);
	void deleteComment(Map<String, Object> params);
	BoardDTO updateComment(String commentId);
	BoardDTO getComment(String commentId);
	List<BoardDTO> searchPosts(String query);
	List<BoardDTO> searchPosts(Map<String, Object> params);
	int hasUserVotedOnPost(Map<String, Object> params);
	void increasePostLike(Map<String, Object> params);
	void increasePostDislike(Map<String, Object> params);
	int hasUserVotedOnComment(Map<String, Object> params);
	void increaseCommentLike(Map<String, Object> params);
	void increaseCommentDislike(Map<String, Object> params);
	void insertPostLikeDislike(LikeDislikeRecord likeDislikeRecord);
	void insertCommentLikeDislike(LikeDislikeRecord likeDislikeRecord);
	void increaseHit(String postId);
	
	
}
