package com.myweb.controller;

import java.io.IOException;

import com.myweb.team.service.SportService;
import com.myweb.team.service.SportServiceImpl;
import com.myweb.user.service.UserService;
import com.myweb.user.service.UserServiceImpl;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.sport")
public class SportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public SportController() {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req,resp);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청분기
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI(); //ip, port번호 제외된 주소
		String path = request.getContextPath(); //프로젝트 식별 이름
		String command = uri.substring(path.length());
		
		System.out.println(command);
		
		SportService sportservice;
		if(command.equals("/lank.sport")) {
			sportservice = new SportServiceImpl();
			sportservice.insertTeam();
		}
	}
	
}
