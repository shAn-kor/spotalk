	package com.myweb.board.service;
	
	import java.io.IOException;
import java.util.List;

import com.myweb.board.model.BoardDTO;

import jakarta.servlet.ServletException;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
	
	public interface BoardService {
		void postWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		List<BoardDTO> homePosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void listPostsByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
		void commentWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void deletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void updateComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void deleteComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void searchPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void likePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void dislikePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void likeComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		void dislikeComment(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException;
		
	}
	
