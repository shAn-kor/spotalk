<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game Date</title>

<link rel="stylesheet" href="../css/game_date.css" type="text/css">
<script src="../js/game_date.js" defer></script>

</head>
<body>

<header class="header">
    <div class="wrap">
        <div class="left">
            <div class="top-left">
                <div class="dropdown">
                    <!-- 드롭다운 버튼 내용 -->
                    <c:choose>
                        <c:when test="${not empty param.basedate}">
                            <button type="button" class="drop_btn">
                                <p>야구</p>
                            </button>
                        </c:when>
                        <c:when test="${not empty param.soccerdate}">
                            <button type="button" class="drop_btn">
                                <p>축구</p>
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="drop_btn">
                                <p>축구</p>
                            </button>
                        </c:otherwise>
                    </c:choose>
                    
                    <!-- 드롭다운 메뉴 내용 -->
                    <div class="dropdown-content">
                        <a href="/spotalk/game/soccerdate.game?soccerdate=true">
                            <div class="icon">
                                <img src="../img/soccer-icon.png" alt="축구">
                            </div>
                            축구
                        </a>
                        <a href="/spotalk/game/basedate.game?basedate=true">
                            <div class="icon">
                                <img src="../img/baseball-icon.png" alt="야구">
                            </div>
                            야구
                        </a>
                    </div>
                </div>
            </div>  
        </div>
        <div class="right">
            <div class="mid-right">
                <div class="mid-top">
                    <ul>
                        <li>경기날짜</li>
                        <li>경기시간</li>
                        <li>경기</li>
                    </ul>    
                </div>
                <div class="mid-bottom">
                    <table>
                        <c:forEach var="game" items="${gamelist}">
                            <tr>
                                <td>${game.gameDate}</td>
                                <td><fmt:formatDate value="${game.gameDate}" pattern="HH시 mm분" /></td>
                                <td>${game.teamA} vs ${game.teamB}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</header>

</body>
</html>
