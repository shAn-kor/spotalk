package com.myweb.game.service;

import java.io.IOException;
import java.util.List;

import com.myweb.game.model.GameDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface GameService {
	void getSoccer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getBase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getBasket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	void getSoccerDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getBaseDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getBasketDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	List<String> getGaming(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	List<GameDTO> getSoccerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	List<GameDTO> getBaseballList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	List<GameDTO> getBasketList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
