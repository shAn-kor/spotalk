package com.myweb.user.service;

import java.io.IOException;
import java.util.List;

import com.myweb.user.model.UserDTO;
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

    void getMyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void getUserRankPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    List<UserDTO> getUserRank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void checkDuplicateNick(HttpServletRequest request, HttpServletResponse response) throws IOException;

    void checkDuplicateId(HttpServletRequest request, HttpServletResponse response) throws IOException;

    void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException;

    void changeNick(HttpServletRequest request, HttpServletResponse response) throws IOException;


    void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
    void closeSqlSession();

    void updateGrade();

    void checkAttendance(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
