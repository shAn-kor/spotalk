package com.myweb.controller;

import com.myweb.predict.service.PredictService;
import com.myweb.predict.service.PredictServiceImpl;
import com.myweb.user.service.UserService;
import com.myweb.user.service.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("*.predict")
public class PredictController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PredictController() {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doAction(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doAction(req, resp);
    }

    protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI(); //ip, port번호 제외된 주소
        String path = request.getContextPath(); //프로젝트 식별 이름
        String command = uri.substring(path.length());

        System.out.println(command);

        PredictService service;
        if (command.equals("/predict/pointList.predict")) {
            service = new PredictServiceImpl();
            service.getPointList(request, response);
        }
    }
}
