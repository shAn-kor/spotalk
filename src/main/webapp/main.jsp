<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="include/header.jsp"%>

<!-- body -->
<!-- Swiper -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<div class="swiper">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <!-- slide -->
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Navigation -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</div>


<!-- Swiper JS -->
<script>
    var games = '${games}';
</script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="js/swiper.js"></script>

<div class="main-box">
    <div class="main-community">
        <p><a href="#">커뮤니티</a></p>
        <div class="tab">
            <ul class="tabnav3">
                <li><a href="#tab3-01">공지사항</a></li>
                <li><a href="#tab3-02">인기글</a></li>
            </ul>
            <div class="tabcontent3">
                <div id="tab3-01">tab1 content</div>
                <div id="tab3-02">tab2 content</div>
            </div>
        </div>
    </div>

    <div class="sport-rank">
        <p><a href="#">리그순위</a></p>
        <div class="tab">
            <ul class="tabnav2">
                <li><a href="#tab2-01">축구</a></li>
                <li><a href="#tab2-02">야구</a></li>
                <li><a href="#tab2-03">농구</a></li>
            </ul>
            <div class="team-rank-head">
                <span>순위</span>
                <input type="text" value="팀" disabled>
                <input type="text" value="경기" disabled>
                <input type="text" value="승" disabled>
                <input type="text" value="무" disabled>
                <input type="text" value="패" disabled>
                <input type="text" value="승률" disabled>
            </div>
            <div class="tabcontent2">
                <div id="tab2-01">
                    <% int soccerRankNum = 1; %>
                    <c:forEach var="soccerDTO" items="${footballRank}">
                        <div class="team-rank">
                            <span><%=soccerRankNum++%></span>
                            <input type="text" name="teamName" value="${soccerDTO.teamName}" disabled>
                            <input type="text" name="teamName" value="${soccerDTO.gameCnt}" disabled>
                            <input type="text" name="teamName" value="${soccerDTO.winCnt}" disabled>
                            <input type="text" name="teamName" value="${soccerDTO.drawCnt}" disabled>
                            <input type="text" name="teamName" value="${soccerDTO.loseCnt}" disabled>
                            <input type="text" name="teamName" value="${soccerDTO.winRate}" disabled>
                        </div>
                    </c:forEach>
                </div>
                <div id="tab2-02">
                    <% int baseballRankNum = 1; %>
                    <c:forEach var="baseballDTO" items="${baseballRank}">
                        <div class="team-rank">
                            <span><%=baseballRankNum++%></span>
                            <input type="text" name="teamName" value="${baseballDTO.teamName}" disabled>
                            <input type="text" name="teamName" value="${baseballDTO.gameCnt}" disabled>
                            <input type="text" name="teamName" value="${baseballDTO.winCnt}" disabled>
                            <input type="text" name="teamName" value="${baseballDTO.drawCnt}" disabled>
                            <input type="text" name="teamName" value="${baseballDTO.loseCnt}" disabled>
                            <input type="text" name="teamName" value="${baseballDTO.winRate}" disabled>
                        </div>
                    </c:forEach>
                </div>
                <div id="tab2-03">
                    <% int basketballRankNum = 1; %>
                    <c:forEach var="basketballDTO" items="${basketballRank}">
                        <div class="team-rank">
                            <span><%=basketballRankNum++%></span>
                            <input type="text" name="teamName" value="${basketballDTO.teamName}" disabled>
                            <input type="text" name="teamName" value="${basketballDTO.gameCnt}" disabled>
                            <input type="text" name="teamName" value="${basketballDTO.winCnt}" disabled>
                            <input type="text" name="teamName" value="${basketballDTO.drawCnt}" disabled>
                            <input type="text" name="teamName" value="${basketballDTO.loseCnt}" disabled>
                            <input type="text" name="teamName" value="${basketballDTO.winRate}" disabled>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main-box">
    <div class="main-user-rank">
        <p><a href="#">승부사 랭킹</a></p>
        <div class="user-rank-wrap">
        
			<ul>
				<li>순위</li>
				<li>등급</li>
				<li>닉네임</li>
				<li>보유포인트</li>
			</ul>
			
        	<div class="rankBox">
        		<% int userRankNum = 1; %>
	            <c:forEach var="userDTO" items="${userRank}">
	                <div class="main-ranker-user">
	                    <span><%=userRankNum++%></span>
	                    <p class="grade" data-grade="${userDTO.gradeId}">등급</p>
	                    <input class="user-grade-id" type="text" name="grade" value="${userDTO.gradeId}" disabled>
	                    <input type="text" name="nick" value="${userDTO.nick}" disabled>
	                    <input type="text" name="point" value="${userDTO.point} P" disabled>
	                </div>
	            </c:forEach>
        	</div>
        	
        </div>
    </div>
    <div class="podium">
        <p>명예의 전당</p>
        <div class="podium-wrap">
            <div id="podium-background">
                <div class="nametag">
                    <img src="img/frame.png" alt="">
                    <p class="podium-nick">${userRank[0].nick}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="sport-schedule">
        <p><a href="/spotalk/game/soccerdate.game">주요경기 일정</a></p>
        <div class="tab">
            <ul class="tabnav">
                <li><a href="#tab01">축구</a></li>
                <li><a href="#tab02">야구</a></li>
                <li><a href="#tab03">농구</a></li>
            </ul>
            <div class="tabcontent">
                <div id="tab01">
                    <% int soccerGameListNum = 1; %>
                    <c:forEach var="soccerGameDTO" items="${soccerGames}">
                        <div class="schedule">
                            <span class="listNum"><%=soccerGameListNum++%></span>
                            <input type="text" name="teamName" value="${soccerGameDTO.gameDate}" disabled>
                            <input type="text" name="teamName" class="scheduleTeam" value="${soccerGameDTO.teamA}" disabled>
                            <span>vs</span>
                            <input type="text" name="teamName" class="scheduleTeam" value="${soccerGameDTO.teamB}" disabled>
                        </div>
                    </c:forEach>
                </div>
                <div id="tab02">
                    <% int baseGameListNum = 1; %>
                    <c:forEach var="baseGameDTO" items="${baseballGames}">
                        <div class="schedule">
                            <span class="listNum"><%=baseGameListNum++%></span>
                            <input type="text" name="teamName" value="${baseGameDTO.gameDate}" disabled>
                            <input type="text" name="teamName" class="scheduleTeam" value="${baseGameDTO.teamA}" disabled>
                            <span>vs</span>
                            <input type="text" name="teamName" class="scheduleTeam" value="${baseGameDTO.teamB}" disabled>
                        </div>
                    </c:forEach>
                </div>
                <div id="tab03">
                    <% int basketGameListNum = 1; %>
                    <c:choose>
                    	<c:when test="${fn:length(basketballGames) == 0 }">
                    		경기가 없습니다.
                    	</c:when>
	                    <c:otherwise>
		                    <c:forEach var="basketGameDTO" items="${basketballGames}">
		                        <div class="schedule">
		                            <span class="listNum"><%=basketGameListNum++%></span>
		                            <input type="text" name="teamName" value="${basketGameDTO.gameDate}" disabled>
		                            <input type="text" name="teamName" class="scheduleTeam" value="${basketGameDTO.teamA}" disabled>
		                            <span>vs</span>
		                            <input type="text" name="teamName" class="scheduleTeam" value="${basketGameDTO.teamB}" disabled>
		                        </div>
		                    </c:forEach>
	                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="include/footer.jsp"%>

