<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
            <div class="tabcontent2">
                <div id="tab2-01">tab1 content</div>
                <div id="tab2-02">tab2 content</div>
                <div id="tab2-03">tab3 content</div>
            </div>
        </div>
    </div>
</div>

<div class="main-box">
    <div class="main-user-rank">
        <p><a href="#">승부사 랭킹</a></p>
        <div class="user-rank-wrap">
            <div class="ranker-user">
                <img src="" alt="grade">
                <p>${user_name}</p>
                <p>${user_point}</p>
            </div>
        </div>
    </div>
    <div class="podium">
        <p>명예의 전당</p>
        <div class="podium-wrap">
            <div id="podium-background">
                <div class="nametag">
                    <img src="img/frame.png" alt="">
                    <p class="podium-nick">양재동찍신강림</p>
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
                <div id="tab01">tab1 content</div>
                <div id="tab02">tab2 content</div>
                <div id="tab03">tab3 content</div>
            </div>
        </div>
    </div>
</div>
<%@ include file="include/footer.jsp"%>

