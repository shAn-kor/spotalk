package com.myweb.game.model;

import java.sql.Date;

import oracle.sql.TIMESTAMP;

public class GameDTO {
	private String gameId;
//	private TIMESTAMP gameDate;
	private Date gameDate;
	private String teamA;
	private String teamB;
	private String gameResult;
	
	
	
	public GameDTO(String gameId, Date gameDate, String teamA, String teamB, String gameResult) {
		super();
		this.gameId = gameId;
		this.gameDate = gameDate;
		this.teamA = teamA;
		this.teamB = teamB;
		this.gameResult = gameResult;
	}
	
	public GameDTO() {
		
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public Date getGameDate() {
		return gameDate;
	}

	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}

	public String getTeamA() {
		return teamA;
	}

	public void setTeamA(String teamA) {
		this.teamA = teamA;
	}

	public String getTeamB() {
		return teamB;
	}

	public void setTeamB(String teamB) {
		this.teamB = teamB;
	}

	public String getGameResult() {
		return gameResult;
	}

	public void setGameResult(String gameResult) {
		this.gameResult = gameResult;
	}
	
	
	
}
