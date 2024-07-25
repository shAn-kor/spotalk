<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="include/header.jsp"%>

<!-- body -->
<!-- Swiper -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<div class="swiper">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="white-background"></div>
                <div class="vs">
                    <img src="img/vs.png" alt="">
                </div>
                <div class="teamA">
                    <img src="img/k_league/김천.png" alt="">
                </div>
                <div class="teamB">
                    <img src="img/k_league/포항.png" alt="">
                </div>
            </div>
            <div class="swiper-slide">
                <div class="white-background"></div>
                <div class="vs">
                    <img src="img/vs.png" alt="">
                </div>
            </div>
            <div class="swiper-slide">
                <div class="white-background"></div>
                <div class="vs">
                    <img src="img/vs.png" alt="">
                </div>
            </div>
            <!-- 추가 슬라이드 -->
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Navigation -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</div>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
</script>

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
        <p><a href="#">주요경기 일정</a></p>
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

