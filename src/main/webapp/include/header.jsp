<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOTALK</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo_spotalk.png" type="image/x-icon">
	
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/findId.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/findPw.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userlank.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spototo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/game_date.css" type="text/css">


</head>
<body>
<!-- header -->
<div class="header">
    <div class="left">
        <a href="${pageContext.request.contextPath}/spotalk.do" id="logo">logo</a>
    </div>
    <div class="center">
        <div class="menu-wrap">
            <div class="menu">
                <a href="${pageContext.request.contextPath}/game/soccerlist.game">승부예측</a>
            </div>
            <div class="menu">
                <a href="${pageContext.request.contextPath}/user/rank.user">랭킹</a>
            </div>
            <div class="menu">
                <a href="${pageContext.request.contextPath}/game/soccerdate.game">경기일정</a>
            </div>
            <div class="menu">
                <a href="${pageContext.request.contextPath}/board/category.board?category=전체글">커뮤니티</a>
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
                        <p class="name">${sessionScope.user_nick }</p>
                        <p class="point">${sessionScope.point }</p>
                    </div>
                    <div class="float">
                        <p class="grade" data-grade="${sessionScope.grade_id}">등급</p>
                    </div>
                </div>
                <script src="${pageContext.request.contextPath}/js/header.js"></script>
            </c:when>
        </c:choose>
    </div>
</div>