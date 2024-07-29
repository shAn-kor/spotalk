package com.myweb.predict.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public interface PredictService {
    void getPointList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void betPoint(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void closeGameSqlSession();

    void getPredictStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
