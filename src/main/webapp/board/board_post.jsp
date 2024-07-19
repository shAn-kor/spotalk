<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write_list</title>

  	<!-- 부트스트랩 css링크 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <!-- 제이쿼리(부스트랩보다 먼저 링크) -->
    <script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <!-- 부트스트랩 js링크 -->
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="../css/board_post.css" type="text/css">
    
</head>
<body>
<div class="container">
        <div class="item item1">
            <p>커뮤니티 / <a href="#">${dto.getCategory()}</a> </p>
        </div>

        <div class="item item2">
            <div class="top">
                <div class="left">
                    <img src="../img/profile32.png" alt="프로필">
                </div>
                <div class="right">
                    <a href="#">작성자</a>
                    <div class="hits">
                        <span>작성시간</span>
                        <img src="../img/eye.png" alt="조회수">
                        <span>${dto.getHit()}</span>
                    </div>
                </div>
            </div>

            <div class="title">
                <h3>${dto.getTitle() }</h3>
            </div>
            <div class="content">
            	${dto.getContent() }
            </div>
            <div class="bottom">
                <div class="right">
                	<button type="button" class="up"></button>
                    <span>${dto.getPost_like() }</span>
                    <button type="button" class="down"></button>
                    <span>${dto.getPost_dislike() }</span>
                </div>
            </div>
        </div>

        <div class="item item3">
            <div class="comments">
                <strong><span>8</span>개의 댓글</strong>
            </div>
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                         <img src="../img/question.png" alt="물음표">
                         댓글을 쓰려면
                         <a href="#">로그인</a>
                         이 필요합니다.
                    </div>
                </div>
                <div class="bottom">
                    <button type="button" class="btn btn-default">댓글 쓰기</button>
                </div>
            </div>
        </div>

        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        
        
        <div class="comments-page">
            <ul class="pager">
                <li class="previous"><a href="#">Previous</a></li>  
                <button type="button"><a href="#">1</a></button>
                <button type="button"><a href="#">2</a></button>
                <button type="button"><a href="#">3</a></button>
                <button type="button"><a href="#">4</a></button>
                <button type="button"><a href="#">5</a></button>
                <p>...</p>
                <button type="button"><a href="#">5768</a></button>
                <li class="next"><a href="#">Next</a></li>
            </ul>
        </div>

       
    </div>
</body>
</html>