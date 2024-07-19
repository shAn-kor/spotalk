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
		
		String user_id = (String) session.getAttribute("user_id");
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String grade_id = (String) session.getAttribute("grade_id");
		
		System.out.println(user_id);
		System.out.println(category);
		System.out.println(title);
		System.out.println(content);
		System.out.println(grade_id);
		BoardDTO dto = new BoardDTO();
		dto.setUser_id(user_id);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setGrade_id(grade_id);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		mapper.insertPost(dto);
		String post_id = mapper.getPostId(user_id);
		
		
		sql.close();
		
		request.setAttribute("post_id", post_id);
		request.getRequestDispatcher("getPost.board").forward(request, response);
		
	}
	@Override
	public void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String post_id = (String) request.getAttribute("post_id");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		BoardDTO dto = mapper.getPost(post_id);
		
		sql.close();
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("post.board").forward(request, response);
		
	}
	
}
