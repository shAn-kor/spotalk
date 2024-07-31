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

<div style="width: 1400px; background-color:rgb(255,255,255,0.4);margin: 0 auto;">
<div class="container">
    <h2>댓글 수정</h2>
  
    <form action="modifyComment.board" method="post">
        <input type="hidden" name="commentId" value="${dto.commentId}" />
        <input type="hidden" name="postId" value="${dto.postId}" />
        <div class="form-group">
            <label for="commentContent">${dto.postContent}</label>
            <textarea id="commentContent" name="commentContent" class="form-control" rows="5" required>${dto.commentContent}</textarea>
        </div>
        <button type="submit" class="btn btn-primary" id="comment-submit-btn">수정 완료</button>
        <a href="getPost.board?postId=${dto.postId}" class="btn btn-secondary">취소</a>
    </form>
</div>
</div>

<script src="../js/commentWrite.js"></script>
<%@ include file="../include/footer.jsp"%>
