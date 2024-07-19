package com.myweb.team.service;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.myweb.team.model.SportDTO;
import com.myweb.team.model.SportMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.mybatis.MybatisUtil;


public class SportServiceImpl implements SportService {
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	
	@Override
	public void insertTeam() {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
	 	SportMapper sportmapper = sql.getMapper(SportMapper.class); //실행시킬 인터페이스명
		
		 String url_soccer = "https://sports.news.naver.com/kfootball/record/index";
		 String url_base = "https://sports.news.naver.com/kbaseball/record/index?category=kbo";
		 String url_basket = "https://sports.news.naver.com/basketball/record/index?category=kbl";
		
		 try {
			 // HTTP 요청 보내기
			 Document doc_soccer = Jsoup.connect(url_soccer).get();
			 Document doc_base = Jsoup.connect(url_base).get();
	         Document doc_basket = Jsoup.connect(url_basket).get();   
			 
			 // 순위 테이블 찾기
			 Element soccerranking = doc_soccer.selectFirst("#regularGroup_table");
			 Element baseranking = doc_base.selectFirst("#regularTeamRecordList_table");
			 Element basketranking = doc_basket.selectFirst("#regularTeamRecordList_table");
			 
			 // 추출 > SportDTO에 저장 > DB삽입
			 //soccer
			 for (Element row : soccerranking.select("tr")) {
		         Elements columns = row.select("td");
		         Elements columns2 = row.select("th");
		         
		         String rank = columns2.get(0).text().trim();
		         String team = columns.get(0).text().trim();
		         String played = columns.get(1).text().trim();
		         String win = columns.get(3).text().trim();
		         String draw = columns.get(4).text().trim();
		         String lose = columns.get(5).text().trim();
		         String points = columns.get(2).text().trim();
	
//		         System.out.printf("[축구] Rank: %s, Team: %s, Played: %s, Win: %s, Draw: %s, Lose: %s, Points: %s%n",
//		        		 rank, team, played, win, draw, lose, points);
				
		         int game_cnt=Integer.parseInt(played);
		         int win_cnt=Integer.parseInt(win);
		         int draw_cnt=Integer.parseInt(draw);
		         int lose_cnt=Integer.parseInt(lose);
		         double win_rate=Double.parseDouble(points);
		        		        
		         SportDTO sportDTO = new SportDTO(team,"soccer",game_cnt,win_cnt,draw_cnt,lose_cnt,win_rate);
		         
		         System.out.println(sportDTO.toString());
		         sportmapper.insertTeam(sportDTO);

			 }
			 
			 //baseball
			 for (Element row : baseranking.select("tr")) {
		         Elements columns = row.select("td");
		         Elements columns2 = row.select("th");
		         
		         String rank = columns2.get(0).text().trim();
		         String team = columns.get(0).text().trim();
		         String played = columns.get(1).text().trim();
		         String win = columns.get(2).text().trim();
		         String draw = columns.get(4).text().trim();
		         String lose = columns.get(3).text().trim();
		         String points = columns.get(5).text().trim();

		         System.out.printf("[야구] Rank: %s, Team: %s, Played: %s, Win: %s, Draw: %s, Lose: %s, Points: %s%n",
		        		 rank, team, played, win, draw, lose, points);
				
		         int game_cnt=Integer.parseInt(played);
		         int win_cnt=Integer.parseInt(win);
		         int draw_cnt=Integer.parseInt(draw);
		         int lose_cnt=Integer.parseInt(lose);
		         double win_rate=Double.parseDouble(points);
		         
		         SportDTO sportDTO = new SportDTO(team,"baseball",game_cnt,win_cnt,draw_cnt,lose_cnt,win_rate);
		         System.out.println(sportDTO.toString());
		         sportmapper.insertTeam(sportDTO);
				 }
			 
			 	//baseketball
			 for (Element row : basketranking.select("tr")) {
				 Elements columns = row.select("td");
				 Elements columns2 = row.select("th");
				 
				 String rank = columns2.get(0).text().trim();
				 String team = columns.get(0).text().trim();
				 String played = columns.get(1).text().trim();
				 String win = columns.get(3).text().trim();
				 String lose = columns.get(4).text().trim();
				 String points = columns.get(2).text().trim();
				 
				 System.out.printf("[농구] Rank: %s, Team: %s, Played: %s, Win: %s, Lose: %s, Points: %s%n",
						 rank, team, played, win, lose, points);
				 
				 int game_cnt=Integer.parseInt(played);
				 int win_cnt=Integer.parseInt(win);
				 int lose_cnt=Integer.parseInt(lose);
				 double win_rate=Double.parseDouble(points);
				 
				 SportDTO sportDTO = new SportDTO(team,"basketball",game_cnt,win_cnt,0,lose_cnt,win_rate);
				 System.out.println(sportDTO.toString());
				 sportmapper.insertTeam(sportDTO);
			 }
			 
			 
			 	
		 } catch (IOException e) {
			 e.printStackTrace();
		 } finally {
			 sql.close();
		 }
	}

}

