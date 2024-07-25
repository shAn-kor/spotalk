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



}
