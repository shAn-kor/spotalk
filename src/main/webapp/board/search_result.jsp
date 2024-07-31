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
    <h2>검색 결과</h2>

    <!-- 검색어 표시 -->
    <p>검색어: <strong>${searchTerm}</strong></p>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="post" items="${posts}">
                <tr>
                    <td><a href="getPost.board?postId=${post.postId}">${post.postTitle}</a></td>
                    <td>${post.userId}</td>
                    <td>${post.postDate}</td>
                    <td>${post.hit}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div>
        <ul class="pagination">
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="searchPosts.board?page=${currentPage - 1}&searchTerm=${searchTerm}">이전</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="searchPosts.board?page=${i}&searchTerm=${searchTerm}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li class="page-item">
                    <a class="page-link" href="searchPosts.board?page=${currentPage + 1}&searchTerm=${searchTerm}">다음</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>


<%@ include file="../include/footer.jsp"%>
