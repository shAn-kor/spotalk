package com.myweb.game.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.myweb.game.model.GameDTO;
import com.myweb.game.model.GameMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.mybatis.MybatisUtil;

public class GameServiceImpl implements GameService{
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

	@Override
	public void getSoccer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		 List<GameDTO> gamelist = mapper.getSoccer();
		 System.out.println(gamelist);
		
		sql.close();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);
		
	}


	@Override
	public void getBase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		 List<GameDTO> gamelist = mapper.getBase();
		 System.out.println(gamelist);
		
		sql.close();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);
		
	}
	
	
	@Override
	public void getBasket(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		 List<GameDTO> gamelist = mapper.getBasket();
		 System.out.println(gamelist);
		
		sql.close();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);
		
	}


	@Override
	public void getSoccerDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		 List<GameDTO> gamelist = mapper.getSoccer();
		 System.out.println("축구경기일정"+gamelist);
		
		sql.close();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("game_date.jsp").forward(request, response);
		
	}


	@Override
	public void getBaseDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		 List<GameDTO> gamelist = mapper.getBase();
		 System.out.println(gamelist);
		
		sql.close();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("game_date.jsp").forward(request, response);		
	}


	@Override
	public void getBasketDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		 List<GameDTO> gamelist = mapper.getBasket();
		 System.out.println("농구일정은 " + gamelist);
		 if(gamelist.size()==0) {
				System.out.println("농구는 경기없음");
			}
		sql.close();
		
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("game_date.jsp").forward(request, response);	
		
	}


	//진행 중인 승부
	@Override
	public void getGaming(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		 List<GameDTO> gamelist = mapper.getGaming();
		 System.out.println("getGaming은 "+ gamelist);
		sql.close();
		
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("main.jsp").forward(request, response);	
	}


	



}
