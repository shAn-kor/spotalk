package com.myweb.controller;

import java.io.IOException;

import com.myweb.game.service.GameService;
import com.myweb.game.service.GameServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.game")
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public GameController () {
		
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
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		
		System.out.println(command);
		
		GameService service;
		if(command.equals("/list.game")) { //경기정보 select
			
			service = new GameServiceImpl();
			service.getGame(request, response);
			
		}
		else if(command.equals("/schedule.game")) { //경기정보 insert
			service = new GameServiceImpl();
			service.scrapScheduleKBO();
			
		}
	}
}
