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
                                <li>
                                   <img src="../img/soccer-icon.png" alt="soccer">
                                   <a href="/spotalk/game/soccerdate.game?sport=soccer">축 구</a>
                                </li>
                                <li><a href="/spotalk/game/basedate.game?sport=baseball">야 구</a></li>
                                <li><a href="/spotalk/game/basketdate.game?sport=basketball">농 구</a></li>
                            </c:when>
                            <c:when test="${selectedSport == 'baseball'}">
                                <li>
                                   <img src="../img/baseball-icon.png" alt="baseball">
                                   <a href="/spotalk/game/basedate.game?sport=baseball">야 구</a>
                                </li>
                                <li><a href="/spotalk/game/soccerdate.game?sport=soccer">축 구</a></li>
                                <li><a href="/spotalk/game/basketdate.game?sport=basketball">농 구</a></li>
                            </c:when>
                            <c:when test="${selectedSport == 'basketball'}">
                                <li>
                                   <img src="../img/basketball-icon.png" alt="basketball">
                                   <a href="/spotalk/game/basketdate.game?sport=basketball">농 구</a>
                                </li>
                                <li><a href="/spotalk/game/soccerdate.game?sport=soccer">축 구</a></li>
                                <li><a href="/spotalk/game/basedate.game?sport=baseball">야 구</a></li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                   <img src="../img/soccer-icon.png" alt="soccer">
                                   <a href="/spotalk/game/soccerdate.game?sport=soccer">축 구</a>
                                </li>
                                <li><a href="/spotalk/game/basedate.game?sport=baseball">야 구</a></li>
                                <li><a href="/spotalk/game/basketdate.game?sport=basketball">농 구</a></li>
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
                        <li>경 기 날 짜</li>
                        <li>경 기 시 간</li>
                        <li>경 기</li>
                    </ul>    
                </div>
                <div class="mid-bottom">
                    <table>
                       <!-- gamelist가 비어있으면 경기없음 -->
                       <c:set var="game" value="${gamelist }" />
                       <c:choose>
                       
                          <c:when test="${gamelist.size()==0}">
                             <jsp:include page="/game/nogame.jsp"/>
                          </c:when>
                          
                          <c:otherwise>
                             <c:forEach var="game" items="${gamelist}">
                                  <tr>
                                      <td>${game.gameDate}</td>
                                      <td><fmt:formatDate value="${game.gameDate}" pattern="HH    :    mm" /></td>
                                      <td>
                                      
                                         <c:choose>
	                                        <c:when test="${selectedSport == 'soccer'}">
	                                           <img src="../img/soccer/${game.teamA}.png" alt="${game.teamA }">
	                                               ${game.teamA} vs ${game.teamB}
	                                           <img src="../img/soccer/${game.teamB}.png" alt="${game.teamB }">  
	                                        </c:when>
	                                        
	                                        <c:when test="${selectedSport == 'baseball'}">
	                                           <img src="../img/baseball/${game.teamA}.png" alt="${game.teamA }">
	                                               ${game.teamA} vs ${game.teamB}
	                                           <img src="../img/baseball/${game.teamB}.png" alt="${game.teamB }">  
	                                        </c:when>
	                                        
	                                        <c:when test="${selectedSport == 'basketball'}">
	                                           <img src="../img/basketball/${game.teamA}.png" alt="${game.teamA }">
	                                               ${game.teamA} vs ${game.teamB}
	                                           <img src="../img/basketball/${game.teamB}.png" alt="${game.teamB }">  
	                                        </c:when>
	                                        
	                                        <c:otherwise>
	                                           <img src="../img/soccer/${game.teamA}.png" alt="${game.teamA }">
	                                               ${game.teamA} vs ${game.teamB}
	                                           <img src="../img/soccer/${game.teamB}.png" alt="${game.teamB }">  
	                                        </c:otherwise>
                                         </c:choose>
                                          
                                      </td>
                                  </tr>
                              </c:forEach>
                          </c:otherwise>
                       </c:choose>
                    </table>
                </div>
            </div>
        </div>
    </div>
</header>
<%@include file="../include/footer.jsp"%>


