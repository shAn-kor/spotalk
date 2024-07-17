<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <script defer src="js/index.js"></script>
</head>
<body>
	${sessionScope.user_id}
    <div class="index-box">
        <!-- 메인페이지 왼쪽 경기 파트 -->
        <div class="index-box-left">
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

        <!-- 메인페이지 중간 승부 예측 파트 -->
        <div class="index-box-mid">
            <h1>진행중인 승부 예측</h1>

            <div class="mid-wrap">
                <div class="main-sport">
                    <p><a href="#">축구</a></p>
                    <div class="main-match">
                        <div class="main-a" style="width: '${33.3333}%';">A</div>
                        <div class="main-c" style="width: '${33.3333}%';">D</div>
                        <div class="main-b" style="width: '${33.3333}%';">B</div>
                    </div>
                    <div class="main-match">
                        <div class="main-a" style="width: '${33.3333}%';">A</div>
                        <div class="main-c" style="width: '${33.3333}%';">D</div>
                        <div class="main-b" style="width: '${33.3333}%';">B</div>
                    </div>
                </div>
                <div class="main-sport">
                    <p><a href="#">야구</a></p>
                    <div class="main-match">
                        <div class="main-a" style="width: '${33.3333}%';">A</div>
                        <div class="main-c" style="width: '${33.3333}%';">D</div>
                        <div class="main-b" style="width: '${33.3333}%';">B</div>
                    </div>
                    <div class="main-match">
                        <div class="main-a" style="width: '${33.3333}%';">A</div>
                        <div class="main-c" style="width: '${33.3333}%';">D</div>
                        <div class="main-b" style="width: '${33.3333}%';">B</div>
                    </div>
                </div>
                <div class="main-sport">
                    <p><a href="#">농구</a></p>
                    <div class="main-match">
                        <div class="main-a" style="width: '${33.3333}%';">A</div>
                        <div class="main-c" style="width: '${33.3333}%';">D</div>
                        <div class="main-b" style="width: '${33.3333}%';">B</div>
                    </div>
                    <div class="main-match">
                        <div class="main-a" style="width: '${33.3333}%';">A</div>
                        <div class="main-c" style="width: '${33.3333}%';">D</div>
                        <div class="main-b" style="width: '${33.3333}%';">B</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 메인페이지 우측 커뮤니티 파트 -->
        <div class="index-box-right">
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
        </div>
    </div>
</body>
</html>