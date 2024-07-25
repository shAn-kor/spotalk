<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <%--  custom css  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/agree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/join_success.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userlank.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spototo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_post.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board_write.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/game_date.css" type="text/css">

    <!-- 부트스트랩 css링크 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

    <%--  custom js  --%>


    <!-- 제이쿼리(부트스트랩보다 먼저 링크) -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.7.1.min.js"></script>

    <!-- 부트스트랩 js링크 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>



</head>
<body>
<!-- header -->
<div class="header">
    <div class="left">
        <a href="#" id="logo">logo</a>
    </div>
    <div class="center">
        <div class="menu-wrap">
            <div class="menu">
                <a href="#">승부예측</a>
            </div>
            <div class="menu">
                <a href="#">랭킹</a>
            </div>
            <div class="menu">
                <a href="#">경기일정</a>
            </div>
            <div class="menu">
                <a href="#">커뮤니티</a>
            </div>
        </div>
    </div>
    <div class="right">
        <div class="auth-btn">
            <c:choose >
                <c:when test="${sessionScope.user_id==null}">
                    <button id="loginButton" class="btn" onclick="location.href='${pageContext.request.contextPath}/user/login.user';">로그인</button>
                    <button id="signupButton" class="btn" onclick="location.href='${pageContext.request.contextPath}/user/agree.user';">회원가입</button>
                </c:when>
                <c:otherwise>
                    <button id="myPageButton" class="btn" onclick="location.href='${pageContext.request.contextPath}/user/myPage.user';">마이페이지</button>
                    <button id="logoutButton" class="btn" onclick="location.href='${pageContext.request.contextPath}/user/logout.user';">로그아웃</button>
                </c:otherwise>
            </c:choose>
        </div>
        <c:choose >
            <c:when test="${sessionScope.user_id!=null}">
                <div id="myInfo">
                    <div class="float">
                        <p class="name">닉네임최대10byte에요</p>
                        <p class="point">1,000,000pt</p>
                    </div>
                    <div class="float">
                        <p class="grade">등급</p>
                    </div>
                </div>
            </c:when>
        </c:choose>
    </div>
</div>