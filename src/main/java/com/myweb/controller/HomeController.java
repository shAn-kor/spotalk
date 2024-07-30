package com.myweb.controller;

import com.myweb.game.model.GameDTO;
import com.myweb.team.model.SportDTO;
import com.myweb.team.service.SportService;
import com.myweb.team.service.SportServiceImpl;
import com.myweb.user.model.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.myweb.game.service.GameService;
import com.myweb.game.service.GameServiceImpl;
import com.myweb.user.service.UserService;
import com.myweb.user.service.UserServiceImpl;

public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeController() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doAction(request, response);
    }

    protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	UserService userService = new UserServiceImpl();
        List<UserDTO> userRank = userService.getUserRank(request, response);
        userService.updateGrade();
        userService.closeSqlSession();

    	GameService gameService = new GameServiceImpl();
        List<GameDTO> gameList = gameService.getGames(request, response);
    	List<String> games = gameService.getGaming(gameList);
        gameService.closeGameSqlSession();
        List<GameDTO> soccerGames = new ArrayList<>();
        List<GameDTO> baseballGames = new ArrayList<>();
        List<GameDTO> basketballGames = new ArrayList<>();

        for (GameDTO gameDTO : gameList) {
            if (Integer.parseInt(gameDTO.getGameId()) < 101) {
                basketballGames.add(gameDTO);
            } else if (Integer.parseInt(gameDTO.getGameId()) < 201) {
                soccerGames.add(gameDTO);
            } else {
                baseballGames.add(gameDTO);
            }
        }

        System.out.println(games);


        SportService sportService = new SportServiceImpl();
        List<SportDTO> footballRank = sportService.getFootballRak(request, response);
        List<SportDTO> baseballRank = sportService.getBaseballRak(request, response);
        List<SportDTO> basketballRank = sportService.getBasketballRak(request, response);
        sportService.closeGameSqlSession();

        request.setAttribute("userRank", userRank);
        request.setAttribute("footballRank", footballRank);
        request.setAttribute("baseballRank", baseballRank);
        request.setAttribute("basketballRank", basketballRank);

        request.setAttribute("soccerGames", soccerGames);
        request.setAttribute("baseballGames", baseballGames);
        request.setAttribute("basketballGames", basketballGames);
        request.setAttribute("games", games);

    	request.getRequestDispatcher("main.jsp").forward(request, response);

    }
}
