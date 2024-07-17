package com.myweb.user.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface UserService {
    void findId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void findPw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void checkPwa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void updatePw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void checkPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
