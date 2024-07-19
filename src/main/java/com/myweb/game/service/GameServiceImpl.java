package com.myweb.game.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.myweb.game.model.GameDTO;
import com.myweb.game.model.GameMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.mybatis.MybatisUtil;

public class GameServiceImpl implements GameService{
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

	@Override
	public void getGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession();
		GameMapper gamemapper = sql.getMapper(GameMapper.class);
		

		
		 ArrayList<GameDTO> gamelist = gamemapper.getGame();
		
		sql.close();
		
		request.setAttribute("gamelist", gamelist);
		request.getRequestDispatcher("spototo.jsp").forward(request, response);

	}

}
