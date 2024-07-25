package com.myweb.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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
    	GameService gameService = new GameServiceImpl();
    	
    	
    	
    	request.getRequestDispatcher("main.jsp").forward(request, response);

    }
}
