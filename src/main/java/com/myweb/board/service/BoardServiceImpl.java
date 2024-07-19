package com.myweb.board.service;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.myweb.board.model.BoardDTO;
import com.myweb.board.model.BoardMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.mybatis.MybatisUtil;

public class BoardServiceImpl implements BoardService {

	private final SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	@Override
	public void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("user_id");
		String category = request.getParameter("category");
		String postTitle = request.getParameter("post_title");
		String postContent = request.getParameter("post_content");
		String gradeId = (String) session.getAttribute("grade_id");
		
		System.out.println(userId);
		System.out.println(category);
		System.out.println(postTitle);
		System.out.println(postContent);
		System.out.println(gradeId);
		BoardDTO dto = new BoardDTO();
		dto.setUserId(userId);
		dto.setCategory(category);
		dto.setPostTitle(postTitle);
		dto.setPostContent(postContent);
		dto.setGradeId(gradeId);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		mapper.insertPost(dto);
		String postId = mapper.getPostId(userId);
		
		
		sql.close();
		
		request.setAttribute("postId", postId);
		request.getRequestDispatcher("getPost.board").forward(request, response);
		
	}
	@Override
	public void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postId = (String) request.getAttribute("postId");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		BoardDTO dto = mapper.getPost(postId);
		
		sql.close();
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("post.board").forward(request, response);
		
	}
	
}
