<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    long num = 1;
%>

<%@ include file="../include/header.jsp"%>
<div class="rank-white-wrap">
    <div class=white-background></div>
    <div class="rankWrap">

        <div class="rank-box">
            <div class="head-wrap">
                <div class="boxtitle">
                    <p>순위</p>
                    <p>등급</p>
                    <p>닉네임</p>
                    <p>포인트</p>
                </div>
            </div>
            <c:forEach var="dto" items="${list}" varStatus="status">
                <div class="user">
                    <p>${(status.count)+((page-1)*pageSize)}</p>
                    <p class="rank-user-grade" id="rank-${dto.gradeId}"> ${dto.gradeId} </p>
                    <p>${dto.nick} </p>
                    <p>${dto.point} </p>
                </div>
            </c:forEach>
        </div>
<script src="../js/userRank.js"></script>

        <div class="page">
            <a href="${pageContext.request.contextPath}/user/rank.user" class="first-page">처음</a>
            <a href="${pageContext.request.contextPath}/user/rank.user?pageNum=${page-1}" class="pre-page">◀</a>
            <c:forEach var="num" items="${pageNumList}">
                <c:choose >
                    <c:when test="${num eq page}">
                        <a href="${pageContext.request.contextPath}/user/rank.user?pageNum=${num}" class="num-on">${num}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/user/rank.user?pageNum=${num}" class="num">${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <a href="${pageContext.request.contextPath}/user/rank.user?pageNum=${page+1}" class="next-page">▶</a>
            <a href="${pageContext.request.contextPath}/user/rank.user?pageNum=${totalEndPage}" class="last-page">마지막</a>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp"%>
