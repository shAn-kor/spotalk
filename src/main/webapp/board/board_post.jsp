<%@page import="com.myweb.board.model.BoardDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

  <!-- 부트스트랩 css링크 -->
  <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
  <!-- 제이쿼리(부스트랩보다 먼저 링크) -->
  <script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
  <!-- 부트스트랩 js링크 -->
  <script src="../js/bootstrap.min.js" type="text/javascript"></script>

  <link rel="stylesheet" href="../css/board_post.css" type="text/css">
  <script src="../js/boadr_post.js" type="text/javascript"></script>
  
  <div class="container">
  	<div class="item item1">
    	<p>커뮤니티 / <a href="#">${dto.getCategory() }</a></p>
    </div>
    <div class="item item2">
        <div class="top">
            <div class="left">
                <img src="../img/profile32.png" alt="프로필">
            </div>
            <div class="right">
	            <div class="info">
		            <a href="#">${dto.userNick }</a>
		            <span>${dto.postDate }</span>
	            </div>
                <div class="hit">
	                <img src="../img/eye.png" alt="조회수"><span>${dto.hit}</span>
                </div>
            </div>
            <c:if test="${sessionScope.user_nick == dto.userNick || sessionScope.user_nick == 'admin'}">
		        <div class="edit">
		            <a href="deletePost.board?postId=${dto.postId }" class="btn">삭제</a>
			        <button type="button" class="btn" onclick="location.href='getPost.board?postId=${dto.postId }&a=1'">수정</button>
		         	
		        </div>
		    </c:if>
        </div>

        <div class="title">
            <h3>${dto.getPostTitle() }</h3>
        </div>
        <div class="content">
        	${dto.getPostContent() }
        </div>
        <div class="bottom">
        	<div class="right">
				<button id="dislikePostBtn" onclick="dislikePost('${dto.postId}')" class="btn"></button>
				<span>${dto.postDislike}</span>
        	</div>
        	<div class="right">
		        <button id="likePostBtn" onclick="likePost('${dto.postId}')" class="btn"></button>
		        <span>${dto.postLike}</span>
        	</div>
    	</div>
	</div>

      
		<form action="commentWrite.board" method="post">
        	<div class="item item3">
        	
	            <div class="comments">
	                <strong><span>${dto.commentCount }</span>개의 댓글</strong>
	            </div>
	            <div class="box">
	                <div class="top">
	                    <div class="left">
	                        <img src="../img/profile32.png" alt="프로필">${dto.gradeId }
	                    </div>
	                   <div class="right">
			                <input type="hidden" name="postId" value="${dto.postId}" />
	                   		<c:choose>
	                   			<c:when test="${sessionScope.user_nick == null }">
	                   				<div class="login">
				                      	<img src="../img/question.png" alt="물음표">
				                        댓글을 쓰려면
				                        <a href="../user/login.user">로그인</a>
				                        이 필요합니다
	                   				</div>
	                   			</c:when>
	                   			<c:otherwise>
	                         		<textarea name="comment_content" placeholder="댓글을 입력해주세요."></textarea>
	                   			</c:otherwise>
	                   		</c:choose>
	                    </div>
	
	                </div>
	                <c:choose>
	                	<c:when test="${sessionScope.user_nick == null }">
	                		 <div class="bottom">
			                	<a href="../user/login.user"><strong>로그인</strong></a>
			                </div>
	                	</c:when>
	                	<c:otherwise>
			                <div class="bottom">
			                	<input type="submit" class="btn" value="댓글 작성">
			                </div>
	                	</c:otherwise>
	                </c:choose>
	            </div>
        	</div>
        	
      		<div class="comments-container">
			    <c:forEach var="comment" items="${comments}">
			        <div class="comment">
			        
			        	<div class="top">
				        	<img src="../img/profile32.png" alt="프로필">
				            <strong>${comment.userNick}</strong> 
				            <span>${comment.commentDate}</span> 
				            <c:if test="${sessionScope.user_nick == comment.userNick || sessionScope.user_nick == 'admin'}">
			                	<a href="deleteComment.board?commentId=${comment.commentId}&postId=${dto.postId}" class="btn">삭제</a>
			                    <a href="comment_edit.jsp?commentId=${comment.commentId}&postId=${dto.postId}" class="btn">수정</a>
			                </c:if>
			        	</div>
			        	
			        	<div class="bottom">
			        		<div class="left">
					        	${comment.commentContent}
			        		</div>
			        		<div class="right">
				        		<div class="bt">
						            <button id="likeCommentBtn" onclick="likeComment('${dto.commentId}', '${dto.postId}')" class="btn"></button>
						            <span>${dto.commentLike}2</span>
									<button id="dislikeCommentBtn" onclick="dislikeComment('${dto.commentId}', '${dto.postId}')" class="btn"></button>
									<span>${dto.commentDislike}2</span>
				        		</div>
			        		</div>
			        	</div>
			        </div>
			    </c:forEach>
			</div>
        </form>
        
  <!-- 페이지네이션 -->
 <div class="comments-page">
 <!-- 페이지 버튼 생성 -->

  <ul class="pager">
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
	            
	            <!-- 생략 표시 처리 -->
	            <c:if test="${startPage > 1}">
	                <li><a href="category.board?page=1&category=${category}&order=${order }">1</a></li>
	                <li class="disabled"><span>...</span></li>
	            </c:if>

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
	</div>
</div>
    
<%@ include file="../include/footer.jsp"%>
