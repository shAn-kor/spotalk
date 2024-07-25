<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/header.jsp"%>

<script src="../js/game_date.js" defer></script>
<header class="game-date-header">
    <div class="wrap">
        <div class="left">
            <div class="top-left">
            	<!-- 축/야/농 메뉴 -->
             	<c:set var="selectedSport" value="${param.sport}" />

                <div class="sportMenu">
                    <ul>
                        <c:choose>
                            <c:when test="${selectedSport == 'soccer'}">
                                <li><a href="/spotalk/game/soccerdate.game?sport=soccer">축구</a></li>
                                <li><a href="/spotalk/game/basedate.game?sport=baseball">야구</a></li>
                                <li><a href="/spotalk/game/basketdate.game?sport=basketball">농구</a></li>
                            </c:when>
                            <c:when test="${selectedSport == 'baseball'}">
                                <li><a href="/spotalk/game/basedate.game?sport=baseball">야구</a></li>
                                <li><a href="/spotalk/game/soccerdate.game?sport=soccer">축구</a></li>
                                <li><a href="/spotalk/game/basketdate.game?sport=basketball">농구</a></li>
                            </c:when>
                            <c:when test="${selectedSport == 'basketball'}">
                                <li><a href="/spotalk/game/basketdate.game?sport=basketball">농구</a></li>
                                <li><a href="/spotalk/game/soccerdate.game?sport=soccer">축구</a></li>
                                <li><a href="/spotalk/game/basedate.game?sport=baseball">야구</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/spotalk/game/soccerdate.game?sport=soccer">축구</a></li>
                                <li><a href="/spotalk/game/basedate.game?sport=baseball">야구</a></li>
                                <li><a href="/spotalk/game/basketdate.game?sport=basketball">농구</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
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
<%@include file="../include/footer.jsp"%>
