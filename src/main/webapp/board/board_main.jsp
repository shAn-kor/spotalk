<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.myweb.board.model.BoardDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../include/header.jsp"%>

  <!-- 부트스트랩 css링크 -->
  <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
  <!-- 제이쿼리(부스트랩보다 먼저 링크) -->
  <script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
  <!-- 부트스트랩 js링크 -->
  <script src="../js/bootstrap.min.js" type="text/javascript"></script>
  
  <link rel="stylesheet" href="../css/board_main.css" type="text/css">
  <script src="../js/board_main.js" type="text/javascript"></script>
  
  
  <div class="container box">
        <div class="item item1">
        	<form action="boardWrite.board" method="post">
                <div class="write">
                  <!--   <a href="/board/boardWrite.board">
                        <img src="../img/pen.png" alt="글 작성">
                        <p>글 작성하기</p>
                    </a> -->
                 
                    <input type="submit" class="btn" value="글 작성하기">
                </div>
           	</form>    
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
                      <li><a href="category.board?category=${category}&order=최신순"><img src="../img/new.png" alt="최신순">최신순</a></li>
                      <li><a href="category.board?category=${category}&order=인기순"><img src="../img/fire.png" alt="인기순">인기순</a></li>
                      <li><a href="category.board?category=${category}&order=조회순"><img src="../img/eye.png" alt="조회순">조회순</a></li>
                    </ul>
                </div>
                <form action="category.board" method="post">
	    			<div class="category">
	    			 	<button type="submit" name="category" value="전체글">전체글</button>
		    			<button type="submit" name="category" value="공지사항">공지사항</button>
		             	<button type="submit" name="category" value="축구"><img alt="축구" src="../img/soccer-icon.png">&nbsp축구</button>
		             	<button type="submit" name="category" value="야구"><img alt="야구" src="../img/baseball-icon.png">&nbsp야구</button>
		             	<button type="submit" name="category" value="농구"><img alt="농구" src="../img/basketball-icon.png">&nbsp농구</button>
	    			</div>
                </form>
        </div>
        
        
        <c:choose>
            <c:when test="${not empty posts}">
                <c:forEach var="post" items="${posts}">
	       			<div class="item item2">
		    			<ul>
		                    <li>
		                        <div class="top">
		                            <a href="#"><img src="../img/profile.png" alt="작성자 프로필"></a>
		                            <a href="#"><c:out value="${post.userId}" /></a>
		                            <span><c:out value="${post.postDate}" /></span>
		                        </div>
		                        <div class="bottom">
		                            <div class="left">
		                                <a href="#"><c:out value="${post.category}" /></a>
		                                <a href="getPost.board?postId=${post.postId}">
		                                    <strong><c:out value="${post.postTitle}" /></strong>
		                                </a>
		                            </div>
		                            <div class="right">
		                                <div class="hits">
		                                    <img src="../img/eye.png" alt="조회수">
		                                    <span><c:out value="${post.hit}" /></span>
		                                </div>
		                                <div class="comments">
		                                    <img src="../img/comment.png" alt="댓글수">
		                                    <span>4</span>
		                                </div>
		                                <div class="good">
		                                    <img src="../img/up.png" alt="추천수">
		                                    <span><c:out value="${post.postLike}" /></span>
		                                </div>
		                            </div>
		                        </div>
		                    </li>
		      			 </ul>
					</div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <li>게시글이 없습니다.</li>
            </c:otherwise>
        </c:choose>
        


        
        <!-- 페이지네이션 -->
	    <div class="comments-page">
	    <!-- 페이지 버튼 생성 -->

		    <ul class="pager">
		        <!-- 이전 페이지 버튼 -->
		        <!-- 이전 페이지 버튼 -->
        <c:if test="${currentPage > 1}">
            <li class="previous">
                <a href="category.board?page=${currentPage - 1}&category=${category}&order=${order }">Previous</a>
            </li>
        </c:if>

        <!-- 페이지 버튼 범위 계산 -->
        <c:choose>
            <c:when test="${totalPages <= 5}">
                <!-- 페이지 수가 5개 이하인 경우 -->
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="${i == currentPage ? 'active' : ''}">
                        <a href="category.board?page=${i}&category=${category}&order=${order }">${i}</a>
                    </li>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <!-- 페이지 수가 5개 초과인 경우 -->
                <c:choose>
                    <c:when test="${currentPage - 2 > 0}">
                        <c:set var="startPage" value="${currentPage - 2}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="startPage" value="1" />
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${currentPage + 2 <= totalPages}">
                        <c:set var="endPage" value="${currentPage + 2}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="endPage" value="${totalPages}" />
                    </c:otherwise>
                </c:choose>

                <!-- 페이지 버튼 범위 조정 -->
                <c:if test="${endPage - startPage < 4}">
                    <c:choose>
                        <c:when test="${startPage > 1}">
                            <c:set var="startPage" value="${endPage - 4}" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="endPage" value="${startPage + 4}" />
                        </c:otherwise>
                    </c:choose>
                </c:if>

                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <li class="${i == currentPage ? 'active' : ''}">
                        <a href="category.board?page=${i}&category=${category}&order=${order }">${i}</a>
                    </li>
                </c:forEach>

                <!-- 생략 표시 처리 -->
                <c:if test="${startPage > 1}">
                    <li class="disabled"><span>...</span></li>
                    <li><a href="category.board?page=1&category=${category}&order=${order }">1</a></li>
                </c:if>

                <c:if test="${endPage < totalPages}">
                    <li class="disabled"><span>...</span></li>
                    <li><a href="category.board?page=${totalPages}&category=${category}&order=${order }">${totalPages}</a></li>
                </c:if>
            </c:otherwise>
        </c:choose>

        <!-- 다음 페이지 버튼 -->
        <c:if test="${currentPage < totalPages}">
            <li class="next">
                <a href="category.board?page=${currentPage + 1}&category=${category}&order=${order }">Next</a>
            </li>
        </c:if>
		    </ul>

	       
	            
	      
	            
	            <%-- <!-- 페이지 버튼 생성 -->
	            <c:forEach begin="1" end="${totalPages}" var="i">
	                <li class="${i == currentPage ? 'active' : ''}">
	                    <a href="category.board?page=${i}&category=${category}">${i}</a>
	                </li>
	            </c:forEach>
	 --%>
	        
	    </div>


<%@ include file="../include/footer.jsp"%>