package com.myweb.game.service;

import java.io.IOException;

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

	void getGaming(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
