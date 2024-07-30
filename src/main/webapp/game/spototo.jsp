<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>

    <script src="${pageContext.request.contextPath}/js/spototo.js" defer></script>
   <div class="overlay">
        <div class="imglay">
            <img src="../img/good.gif" alt="good">
        </div>
    </div>

    <div class="spototo-box">
    
       	<c:set var="selectedSport" value="${param.sport}" />

    	<input type="text" id="user-id-spototo" name="user-id" value="${sessionScope.user_id}" hidden="hidden">
        <div class="miniMenu">
	          <ul>
	          <img src="../img/menubtn.png" alt="menubtn">
	           <c:choose>
	              <c:when test="${selectedSport == 'soccer'}">
	                  <li>
	                      
	                  <a href="/spotalk/game/soccerlist.game?sport=soccer">축 구</a>
	               </li>
	               <li><a href="/spotalk/game/baselist.game?sport=baseball">야 구</a></li>
	               <li><a href="/spotalk/game/basketlist.game?sport=basketball">농 구</a></li>
	            </c:when>
	            <c:when test="${selectedSport == 'baseball'}">
	               <li>
	                  
	                  <a href="/spotalk/game/baselist.game?sport=baseball">야 구</a>
	               </li>
	               <li><a href="/spotalk/game/soccerlist.game?sport=soccer">축 구</a></li>
	               <li><a href="/spotalk/game/basketlist.game?sport=basketball">농 구</a></li>
	            </c:when>
	            <c:when test="${selectedSport == 'basketball'}">
	               <li>
	                  
	                  <a href="/spotalk/game/basketlist.game?sport=basketball">농 구</a>
	               </li>
	               <li><a href="/spotalk/game/soccerlist.game?sport=soccer">축 구</a></li>
	               <li><a href="/spotalk/game/baselist.game?sport=baseball">야 구</a></li>
	            </c:when>
	            <c:otherwise>
	               <li>
	                  
	                  <a href="/spotalk/game/soccerlist.game?sport=soccer">축 구</a>
	               </li>
	               <li><a href="/spotalk/game/baselist.game?sport=baseball">야 구</a></li>
	               <li><a href="/spotalk/game/basketlist.game?sport=basketball">농 구</a></li>
	            </c:otherwise>
	            </c:choose>
	         </ul>
	         
        </div>
      
      <div class="icons">
	      <img src="../img/soccer-icon.png" alt="s-icon">
		  <img src="../img/baseball-icon.png" alt="bs-icon">
		  <img src="../img/basketball-icon.png" alt="bk-icon">  	
      </div>

      
      
      <div class="title">
      		<ul>
      			<li>경 기 날 짜</li>
      			<li>경 기 팀</li>
      		</ul>
      </div>
    
      
   
   <div class="matchBox">
   
   
   
      <!-- gamelist가 비어있으면 경기없음 -->
        <c:set var="game" value="${gamelist }" />
        <c:choose> 
           <c:when test="${gamelist.size()==0}">
              <jsp:include page="/game/nogame.jsp"/>
           </c:when>
                          
           <c:otherwise>
              <c:forEach var="game" items="${gamelist}">
                 <div class="spototo-match">
                  <input type="text" id="game-id" name="game-id" value="${game.gameId}" hidden="hidden">
                     <div class="spototo-basic">
                         <p class="match-time"> 
                         ${game.gameDate }
                         </p>
                         <div class="match">

                             <div class="spototo-a" id="${game.gameId}-teamA-graph">
                                 <div style="width: 120px;">
                                     <img src="" alt="icon">
                                     <p id="${game.gameId}-teamA">${game.teamA}</p>
                                 </div>
                             </div>
                             <div class="spototo-d" id="${game.gameId}-draw-graph"></div>
                             <div class="spototo-b" id="${game.gameId}-teamB-graph">
                                 <div style="width: 120px;">
                                     <p id="${game.gameId}-teamB">${game.teamB}</p>
                                     <img src="" alt="icon">
                                 </div>

                             </div>
                         </div>
                         <img src="../img/arrow_drop.svg" alt="">
                     </div>
                     <div class="details">
                         <div class="detail-text">
                             <p>승부 종료까지</p>
                             <p class="Timer"></p>
                         </div>
                         <div class="detail-btn">
                             <div class="match-btns">
                                 <button id="btn-${game.gameId}-${game.teamA}" class="win">${game.teamA}팀 승리</button>
                                 <button id="btn-${game.gameId}-draw" class="win">무승부</button>
                                 <button id="btn-${game.gameId}-${game.teamB}" class="win">${game.teamB}팀 승리</button>
                             </div>
                             <div class="user-point">
								<p>나의 포인트 </p>
                                 <input type="number" name="user-p" id="user-p" value="${sessionScope.point}" readonly>
                                 <input type="number" name="using-p" id="using-p" placeholder="사용할 포인트">

                                 <input type="button" name="toto-ok" id="toto-ok" value="확인">
                             </div>
                         </div>
                     </div>
                 </div>
              </c:forEach>
           </c:otherwise>
        </c:choose>
      
    </div>
       
    </div>
<%@ include file="../include/footer.jsp"%>