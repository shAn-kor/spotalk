<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

  <!-- 부트스트랩 css링크 -->
  <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
  <!-- 제이쿼리(부스트랩보다 먼저 링크) -->
  <script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
  <!-- 부트스트랩 js링크 -->
  <script src="../js/bootstrap.min.js" type="text/javascript"></script>

  <link rel="stylesheet" href="../css/board_write.css" type="text/css">

<div style="width: 1400px; background-color:rgb(255,255,255,0.4);margin: 0 auto;">
   <div class="container">
        <form action="postWrite.board" method="post" name="boardForm">
        	<div class="item">
            	<h3>글 쓰기</h3>
  				<div class="category">
               		<select class="form-control" id="categorySelect" name="category">
                    	<option value="">카테고리를 선택해주세요.</option>
                    	<c:if test="${sessionScope.user_id == 'admin'}">
	                    	<option value="공지">공지사항</option>
                    	</c:if>
                    	<option value="축구">축구</option>
                    	<option value="야구">야구</option>
                    	<option value="농구">농구</option>
                	</select>
            	</div>
	            <div class="title">
	                <input type="text" class="form-control" name="post_title" id="text-bar" placeholder="제목을 입력해주세요.">
	            </div>
	            <div class="content">
	              <textarea name="post_content" placeholder="내용을 입력해주세요."></textarea>
	            </div>
	            <div class="right">
	                <input type="submit" class="btn" value="등록" id="submit-btn">
	                <input type="submit" class="btn" formaction="boardMain.board" formmethod="post" value="취소">
	            </div>
	        </div>
    	</form>
    </div>
    </div>
<script src="../js/boardWrite.js"></script>
<%@ include file="../include/footer.jsp"%>