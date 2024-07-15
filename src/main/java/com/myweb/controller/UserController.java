package com.myweb.controller;

import java.io.IOException;

import com.myweb.user.service.UserService;
import com.myweb.user.service.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("*.user")
public class UserController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public UserController() {
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
		//요청분기
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI(); //ip, port번호 제외된 주소
		String path = request.getContextPath(); //프로젝트 식별 이름
		String command = uri.substring(path.length());
				
		System.out.println(command);
		
		UserService service;
		if(command.equals("/user/login/login.user")) {//로그인 페이지
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		if(command.equals("/user/findIdPw/findIdPw_Id.user")) {//아이디찾기 페이지
			request.getRequestDispatcher("findId01.jsp").forward(request, response);
		}
		if(command.equals("/user/findIdPw/findId.user")) {//아이디찾기
			service = new UserServiceImpl();
			service.findId(request, response);
		}
		if(command.equals("/user/findIdPw/foundId.user")) {//아이디찾음 페이지
			request.getRequestDispatcher("findId02.jsp").forward(request, response);
		}
		if(command.equals("/user/findIdPw/findIdPw_Pw.user")) {//비밀번호찾기 페이지
			request.getRequestDispatcher("findPw01.jsp").forward(request, response);
		}
		if(command.equals("/user/findIdPw/findPw.user")) {//비밀번호찾기 페이지
			service = new UserServiceImpl();
			service.findPw(request, response);
		}
		if(command.equals("/user/findIdPw/pwQnA.user")) {//비밀번호QnA 페이지
			request.getRequestDispatcher("findPw02.jsp").forward(request, response);
		}
		if(command.equals("/user/findIdPw/checkPwa.user")) {//비밀번호질문 답 확인
			service = new UserServiceImpl();
			service.checkPwa(request, response);
		}
		if(command.equals("/user/findIdPw/resetPw.user")) {//비밀번호재설정 페이지
			request.getRequestDispatcher("findPw03.jsp").forward(request, response);
		}
		if(command.equals("/user/findIdPw/updatePw.user")) {//비밀번호재설정 페이지
			service = new UserServiceImpl();
			service.updatePw(request, response);
		}
	}
	
}
