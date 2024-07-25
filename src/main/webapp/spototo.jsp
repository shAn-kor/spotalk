<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="include/header.jsp"%>

    <div class="spototo-box">
	<c:forEach var="game" items="${gamelist}">
		<div class="spototo-match">
            <div class="spototo-basic">
                <p class="match-time"> 
                ${game.gameDate }
                </p>
                <div class="match">
                    <div class="spototo-a" style="width: '${33.3333}%';">
                        <img src="" alt="icon">
                        <p>${game.teamA}</p>
                    </div>
                    <div class="spototo-d" style="width: '${33.3333}%';">D</div>
                    <div class="spototo-b" style="width: '${33.3333}%';">
                        <img src="" alt="icon">
                        <p>${game.teamB}</p>
                        
                    </div>
                </div>
                <img src="img/arrow_drop.svg" alt="">
            </div>
            <div class="details">
                <div class="detail-text">
                    <p>예측 종료까지</p>
                    <fmt:formatDate value="${game.gameDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
                </div>
                <div class="detail-btn">
                    <div class="match-btns">
                        <button class="win-a">${game.teamA}팀 승리</button>
                        <button class="win-d">무승부</button>
                        <button class="win-b">${game.teamB}팀 승리</button>
                    </div>
                    <div class="user-point">
                        <input type="text" name="user-p" id="user-p" value=${user_point} readonly>
                        <input type="text" name="using-p" id="using-p" placeholder="사용할 포인트">
                        <input type="button" name="toto-ok" id="toto-ok" value="확인">
                    </div>
                </div>
            </div>
        </div>
 	</c:forEach>
    </div>
<%@ include file="include/footer.jsp"%>