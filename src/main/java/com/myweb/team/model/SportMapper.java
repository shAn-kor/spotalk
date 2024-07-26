package com.myweb.team.model;


import java.util.List;

public interface SportMapper {
	void insertTeam(SportDTO sportDTO);
	List<SportDTO> getFootballRank();
	List<SportDTO> getBaseballRank();
	List<SportDTO> getBasketballRank();
}
