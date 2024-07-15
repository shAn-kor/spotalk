package com.myweb.user.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface UserService {
    void getUser();
    void findId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void findPw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void checkPwa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void updatePw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    
}
