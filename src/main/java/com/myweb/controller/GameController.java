package com.myweb.controller;

import java.io.IOException;

import com.myweb.game.service.GameService;
import com.myweb.game.service.GameServiceImpl;
import com.myweb.user.service.UserService;
import com.myweb.user.service.UserServiceImpl;

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
		

		if(command.equals("/game/soccerlist.game")) { //축구경기예측페이지
			GameService service = new GameServiceImpl();
			service.getSoccer(request, response);
		}else if(command.equals("/game/baselist.game")) { //야구경기예측페이지
			GameService service = new GameServiceImpl();
			service.getBase(request, response);

		}else if(command.equals("/game/basketlist.game")) { //농구경기예측페이지
			GameService service = new GameServiceImpl();
			service.getBasket(request, response);

		}else if(command.equals("/game/soccerdate.game")) { //축구경기일정
			GameService service = new GameServiceImpl();
			service.getSoccerDate(request, response);
			
		}else if(command.equals("/game/basedate.game")) { //야구경기일정
			GameService service = new GameServiceImpl();
			service.getBaseDate(request, response);
			
		}else if(command.equals("/game/basketdate.game")) { //농구경기일정
			GameService service = new GameServiceImpl();
			service.getBasketDate(request, response);
			
		}
		
		else if(command.equals("/game/gaming.game")) { //진행중인 승부
			GameService service = new GameServiceImpl();
			service.getGaming(request, response);
			
		}
	}
}
