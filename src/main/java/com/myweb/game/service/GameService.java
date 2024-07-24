package com.myweb.game.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface GameService {
//	void scrapScheduleKBO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
// 	void scrapeScheduleKLeague(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
