package com.myweb.game.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface GameService {
	void getGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
