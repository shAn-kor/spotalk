package com.myweb.team.model;


public class SportDTO {
	
	private String teamName; //팀명
	private String sports; //종목
	private int gameCnt; //경기수
	private int winCnt; //이긴 수
	private int drawCnt; //무승부 수
	private int loseCnt; //진 수
	private double winRate; //(야구,농구: 승률/ 축구: 승점)

	
	
	@Override
	public String toString() {
		return "SportDTO [team_name=" + teamName + ", sports=" + sports + ", game_cnt=" + gameCnt + ", win_cnt="
				+ winCnt + ", draw_cnt=" + drawCnt + ", lose_cnt=" + loseCnt + ", win_rate=" + winRate + "]";
	}

	public SportDTO(String teamName, String sports, int gameCnt,
					int winCnt, int drawCnt, int loseCnt, double winRate) {
		super();
		this.teamName = teamName;
		this.sports = sports;
		this.gameCnt = gameCnt;
		this.winCnt = winCnt;
		this.drawCnt = drawCnt;
		this.loseCnt = loseCnt;
		this.winRate = winRate;

	}

	public SportDTO() {
		
	}
	
	//getter,setter
	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getSports() {
		return sports;
	}

	public void setSports(String sports) {
		this.sports = sports;
	}

	public int getGameCnt() {
		return gameCnt;
	}

	public void setGameCnt(int gameCnt) {
		this.gameCnt = gameCnt;
	}

	public int getWinCnt() {
		return winCnt;
	}

	public void setWinCnt(int winCnt) {
		this.winCnt = winCnt;
	}

	public int getDrawCnt() {
		return drawCnt;
	}

	public void setDrawCnt(int drawCnt) {
		this.drawCnt = drawCnt;
	}

	public int getLoseCnt() {
		return loseCnt;
	}

	public void setLoseCnt(int loseCnt) {
		this.loseCnt = loseCnt;
	}

	public double getWinRate() {
		return winRate;
	}

	public void setWinRate(double winRate) {
		this.winRate = winRate;
	}

	
	
}
