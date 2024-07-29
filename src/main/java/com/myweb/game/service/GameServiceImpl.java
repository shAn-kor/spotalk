package com.myweb.game.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.google.gson.Gson;
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
		List<GameDTO> gamelist = getSoccerList(request, response);
		 System.out.println(gamelist);

		closeGameSqlSession();

		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);
		
	}


	@Override
	public void getBase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 List<GameDTO> gamelist = getBaseballList(request, response);
		 System.out.println(gamelist);

		closeGameSqlSession();

		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);
		
	}
	
	
	@Override
	public void getBasket(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		 List<GameDTO> gamelist = getBasketList(request, response);
		 System.out.println(gamelist);

		closeGameSqlSession();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);
		
	}

	@Override
	public List<GameDTO> getSoccerList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);

		return mapper.getSoccer();
	}

	@Override
	public List<GameDTO> getBaseballList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);

		return mapper.getBase();
	}

	@Override
	public List<GameDTO> getBasketList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);

		return mapper.getBasket();
	}


	@Override
	public void getSoccerDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);

		closeGameSqlSession();
		
		 List<GameDTO> gamelist = mapper.getSoccer();
		 System.out.println("축구경기일정"+gamelist);
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("game_date.jsp").forward(request, response);
		
	}


	@Override
	public void getBaseDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);

		closeGameSqlSession();
		
		 List<GameDTO> gamelist = mapper.getBase();
		 System.out.println(gamelist);
		
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

		closeGameSqlSession();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("game_date.jsp").forward(request, response);	
		
	}


	//진행 중인 승부
	@Override
	public List<GameDTO> getGames(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper mapper = sql.getMapper(GameMapper.class);
		
		return mapper.getGames();
	}

	@Override
	public List<String> getGaming(List<GameDTO> list) {

		List<String> games = new ArrayList<>();
		for(GameDTO dto : list) {

			if (
					dto.getGameDate().getTime() > (System.currentTimeMillis() + (86400000*4)) ||
					dto.getGameDate().getTime() < (System.currentTimeMillis() + (86400000))
			) {
				continue;
			}
			Gson gson = new Gson();
			games.add(gson.toJson(dto));
		}

		System.out.println("getGaming은 "+ games);

		return games;
	}

	public void closeGameSqlSession() {
		sqlSessionFactory.openSession(true).close();
	}
	



}
