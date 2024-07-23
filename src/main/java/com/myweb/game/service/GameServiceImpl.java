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

	
	// KBO 리그 일정 가져오기 by Selenium, Jsoup
	//야구 결과 포함

	
	
	//경기정보 select
	@Override
	public void getGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		GameMapper gamemapper = sql.getMapper(GameMapper.class);
		

		
		 List<GameDTO> gamelist = gamemapper.getGame();
		 System.out.println(gamelist);
		
		sql.close();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);

	}

}
