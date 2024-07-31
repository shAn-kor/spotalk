<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ page import="com.myweb.board.model.BoardDTO" %>

<!-- 부트스트랩 css링크 -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<!-- 제이쿼리(부스트랩보다 먼저 링크) -->
<script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
<!-- 부트스트랩 js링크 -->
<script src="../js/bootstrap.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="../css/board_post.css" type="text/css">

<div class="container">
    <h2>게시글 수정</h2>
    <form action="updatePost.board" method="post" name="boardForm">
        <input type="hidden" name="postId" value="${dto.postId }"/>
        <div class="form-group">
            <label for="postTitle"></label>
            <input type="text" id="postTitle" name="post_title" class="form-control" value="${dto.postTitle }" required>
        </div>
        <div class="form-group">
            <label for="postContent"></label>
            <textarea id="postContent" name="post_content" class="form-control" rows="10" required>${dto.postContent }</textarea>
        </div>
        <button type="submit" class="btn btn-primary" id="submit-btn">수정 완료</button>
        <a href="getPost.board?postId=${dto.postId}" class="btn btn-secondary">취소</a>
        
    </form>
</div>
<script src="../js/boardWrite.js"></script>
<%@ include file="../include/footer.jsp"%>
