package com.myweb.team.model;

public class SportDTO {
	
	private String team_name; //팀명
	private String sports; //종목
	private int game_cnt; //경기수
	private int win_cnt; //이긴 수
	private int draw_cnt; //무승부 수
	private int lose_cnt; //진 수
	private double win_rate; //(야구,농구: 승률/ 축구: 승점)
	
	
	
	@Override
	public String toString() {
		return "SportDTO [team_name=" + team_name + ", sports=" + sports + ", game_cnt=" + game_cnt + ", win_cnt="
				+ win_cnt + ", draw_cnt=" + draw_cnt + ", lose_cnt=" + lose_cnt + ", win_rate=" + win_rate + "]";
	}

	public SportDTO(String team_name, String sports, int game_cnt, 
					int win_cnt, int draw_cnt, int lose_cnt, double win_rate) {
		super();
		this.team_name = team_name;
		this.sports = sports;
		this.game_cnt = game_cnt;
		this.win_cnt = win_cnt;
		this.draw_cnt = draw_cnt;
		this.lose_cnt = lose_cnt;
		this.win_rate = win_rate;
	}

	public SportDTO() {
		
	}
	
	//getter,setter
	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getSports() {
		return sports;
	}

	public void setSports(String sports) {
		this.sports = sports;
	}

	public int getGame_cnt() {
		return game_cnt;
	}

	public void setGame_cnt(int game_cnt) {
		this.game_cnt = game_cnt;
	}

	public int getWin_cnt() {
		return win_cnt;
	}

	public void setWin_cnt(int win_cnt) {
		this.win_cnt = win_cnt;
	}

	public int getDraw_cnt() {
		return draw_cnt;
	}

	public void setDraw_cnt(int draw_cnt) {
		this.draw_cnt = draw_cnt;
	}

	public int getLose_cnt() {
		return lose_cnt;
	}

	public void setLose_cnt(int lose_cnt) {
		this.lose_cnt = lose_cnt;
	}

	public double getWin_rate() {
		return win_rate;
	}

	public void setWin_rate(double win_rate) {
		this.win_rate = win_rate;
	}

	
	
	
}
