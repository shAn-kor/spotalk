package com.myweb.team.service;

import java.io.IOException;
import java.util.List;

import com.myweb.team.model.SportDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface SportService {
	
	void insertTeam();

    List<SportDTO> getFootballRak(HttpServletRequest request, HttpServletResponse response);

    List<SportDTO> getBaseballRak(HttpServletRequest request, HttpServletResponse response);

    List<SportDTO> getBasketballRak(HttpServletRequest request, HttpServletResponse response);
}
