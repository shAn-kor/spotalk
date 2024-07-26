package com.myweb.board.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface BoardService {
	void postWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void listPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; // 추가된 메서드
	void sortPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; // 글 정렬
	void listPostsByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
	void commentWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
