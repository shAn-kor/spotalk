package com.myweb.team.service;

import java.util.List;

import com.myweb.team.model.SportDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface SportService {
	
	void insertTeam();

    List<SportDTO> getTeamRank(HttpServletRequest request, HttpServletResponse response);

    void closeSqlSession();
}
