<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    long num = 1;
%>

<%@ include file="../include/header.jsp"%>
        <div class="rankWrap">

            <div class="boxtitle">
                <p>순위</p>
                <p>등급</p>
                <p>닉네임</p>
                <p>포인트</p>
            </div>

            <div class="box">

                <div class="content">
                    <c:forEach var="dto" items="${list}">
                        <p><%=num++%></p>
                        <div class="user">
                            <input type="text" name="grade" value="${dto.gradeId}" disabled>
                            <input type="text" name="nick" value="${dto.nick}" disabled>
                            <input type="number" name="point" value="${dto.point}" disabled>
                        </div>
                    </c:forEach>
                </div>
            </div>
    
            <div class="page">

                <a href="#" class="first-page">처음</a>
                <a href="#" class="pre-page">◀</a>
                <a href="#" class="num-on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="next-page">▶</a>
                <a href="#" class="last-page">마지막</a>

            </div>
        </div>
<%@ include file="../include/footer.jsp"%>