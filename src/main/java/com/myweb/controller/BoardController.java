package com.myweb.controller;

import java.io.IOException;

import com.myweb.board.service.BoardService;
import com.myweb.board.service.BoardServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("*.board") // .board 끝나는 모든 요청은 서블릿으로 연결
public class BoardController extends HttpServlet {

	public BoardController() {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청 분기
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI(); //ip, port번호 제외된 주소
		String path = request.getContextPath(); //프로젝트 식별 이름
		String command = uri.substring( path.length() );
		
		System.out.println(command);
		
		//BoardService 선언
		BoardService service;
		
		if(command.equals("/board/board_write.board")) { //글 작성 메인화면
			request.getRequestDispatcher("board_write.jsp").forward(request, response);
		} 
		if(command.equals("/board/write.board")) { //글 작성
			service = new BoardServiceImpl();
			service.write(request, response);
		} 
		if(command.equals("/board/getPost.board")) { //글 상세 조회
			service = new BoardServiceImpl();
			service.getPost(request, response);
		}
		if(command.equals("/board/post.board")) { //글 상세 화면
			request.getRequestDispatcher("post.jsp").forward(request, response);
		}
		
		
	
	}
}
