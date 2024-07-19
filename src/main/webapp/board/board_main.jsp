<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board main</title>

  	<!-- 부트스트랩 css링크 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <!-- 제이쿼리(부스트랩보다 먼저 링크) -->
    <script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <!-- 부트스트랩 js링크 -->
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="../css/board_main.css" type="text/css">
    
    
</head>
<body>
  <div class="container box">
        
        <div class="item item1">
                <div class="write">
                    <a href="/board/board_write.board">
                        <img src="../img/pen.png" alt="글 작성">
                        <p>글 작성하기</p>
                    </a>
                </div>

                <div class="search">
                    <fieldset class="fieldset">
                        <div class="search-bar">
                            <button type="button"></button>
                            <input type="text" placeholder="게시글 검색">
                        </div>
                    </fieldset>  
                </div>

                <div class="dropdown sort">
                    <img src="../img/sort.png" alt="글 정렬">
                    <button type="button" data-toggle="dropdown">최신순
                    <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                      <li><a href="#"><img src="../img/new.png" alt="최신순">최신순</a></li>
                      <li><a href="#"><img src="../img/fire.png" alt="인기순">인기순</a></li>
                      <li><a href="#"><img src="../img/eye.png" alt="조회순">조회순</a></li>
                    </ul>
                </div>
                
    			
    			<div class="category">
    			 	<button type="button">전체글</button>
	    			<button type="button">공지사항</button>
	             	<button type="button"><img alt="축구" src="../img/soccer-icon.png">&nbsp축구</button>
	             	<button type="button"><img alt="야구" src="../img/baseball-icon.png">&nbsp야구</button>
	             	<button type="button"><img alt="농구" src="../img/basketball-icon.png">&nbsp농구</button>
	             	
    			</div>
    			
             
             
        </div>


        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>  
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>  
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>  
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>  
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>    
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>    
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>    
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>    
        <div class="item item2">
            <ul>
                <li>
                    <div class="top">
                        <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
                        <a href="#">작성자</a>
                        <span>작성시간</span>
                    </div>
                    <div class="bottom">
                        <div class="left">
                            <a href="#">카테고리</a>
                            <a href="#"><strong>글 제목</strong></a>
                        </div>
                        <div class="right">
                            <div class="hits">
                                <img src="../img/eye.png" alt="조회수">
                                <span>1.5k</span>
                            </div>
                            <div class="comments">
                                <img src="../img/comment.png" alt="댓글수">
                                <span>4</span>
                            </div>
                            <div class="good">
                                <img src="../img/up.png" alt="추천수">
                                <span>3</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
           
        </div>  
   
        
        <div class="bottom-page">
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