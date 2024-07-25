<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="js/main.js"></script>
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
                    <a href="/spotalk/game/soccerlist.game">승부예측</a>
                </div>
                <div class="menu">
                    <a href="#">랭킹</a>
                </div>
                <div class="menu">
                    <a href="/spotalk/game/soccerdate.game">경기일정</a>
                </div>
                <div class="menu">
                    <a href="#">커뮤니티</a>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="auth-btn">
                <button id="loginButton" class="btn">로그인</button>
                <button id="signupButton" class="btn">회원가입</button>
                <button id="myPageButton" class="btn" style="display: none;">마이페이지</button>
                <button id="logoutButton" class="btn" style="display: none;">로그아웃</button>
            </div>
            <div id="myInfo" style="display: none;">
                <div class="float">
                    <p class="name">닉네임최대10byte에요</p>
                    <p class="point">1,000,000pt</p>
                </div>
                <div class="float">
                    <p class="grade">등급</p>
                </div>
            </div>
            <script src="js/header.js"></script>
        </div>
    </div>

    <!-- body -->
    <!-- Swiper -->
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
    <!-- 게임 데이터를 자바스크립트로 전달하기 위해 JSON으로 변환 -->
 <!--    <script>
        var games = [[${games}]];
    </script> -->
 	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="js/swiper.js"></script>

    <div class="box">
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
    
    <div class="box">
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


    <!-- footer -->
    <div class="footer">
        <div class="left">SPOTALK</div>
        <div class="right">
            TEAM 김우진 서무경 안성훈 장소영 <br><br>
            스포톡 컨텐츠는 실제 현금배팅이 되지 않는 모의예측 컨텐츠입니다. <br>
            스포톡 포인트는 현금으로 충전 및 환전이 불가능하며, 커뮤니티 활동을 통해 획득할 수 있습니다. <br><br>
            COPYRIGHT @ 2024 SPOTALK ALL rights reserved
        </div>
    </div>

</body>
</html>