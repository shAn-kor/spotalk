<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ page import="java.text.DecimalFormat"%>
<%
    // 문자열로 저장된 숫자
    String point = (String)session.getAttribute("point");

    // 포맷된 숫자를 저장할 변수
    String formattedPoint = "";

    // 문자열을 숫자로 변환
    Long number = Long.parseLong(point);

    // 숫자를 포맷
    DecimalFormat decimalFormat = new DecimalFormat("#,###");
    formattedPoint = decimalFormat.format(number);

%>

<!-- 부트스트랩 css링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

<!-- 제이쿼리(부트스트랩보다 먼저 링크) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.7.1.min.js"></script>

<!-- Popper.js (부트스트랩보다 먼저 링크) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

<!-- 부트스트랩 js링크 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pointlist.css">


<div class="pointList-wrap">
    <div class=white-background></div>
    <div class="pointList-box">
        <div class="top">
            <div class="top-title">
                <p>SPOTALK 포인트</p>
            </div>
            <div class="top-bottom">
                <p><span><%= formattedPoint %></span> P</p>
            </div>
        </div>

        <div class="list">

            <ul class="nav nav-tabs">

                <li class="active"><a data-toggle="tab" href="#all">전체</a></li>
                <li><a data-toggle="tab" href="#success">성공 내역</a></li>
                <li><a data-toggle="tab" href="#fail">실패 내역</a></li>
	            <select class="pointList-year">
	                <option value="2024">2024년</option>
	                <option value="2023">2023년</option>
	            </select>
            </ul>

            <div class="tab-content">
                <!-- 전체 -->
                <div id="all" class="tab-pane in active">
                    <table class="all-box">
                        <tr class="column s" id="2024">
                            <div class="user">
                                <input class="p-date" type="text" name="grade" value="날짜" disabled>
                                <input class="p-team" type="text" name="nick" value="예측 승팀" disabled>
                                <input class="p-point" type="text" name="point" value="배팅 포인트" disabled>
                            </div>
                        </tr>
                        <c:forEach var="dto" items="${dto}">
                            <tr class="column s" id="2024">
                                <div class="user">
                                    <input class="p-date" type="text" name="grade" value="${dto.cDate}" disabled>
                                    <input class="p-team" type="text" name="nick" value="${dto.pResult}" disabled>
                                    <input class="p-point" type="number" name="point" value="${dto.betPoint}" disabled>
                                </div>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
                <!-- 성공 내역 -->
                <div id="success" class="tab-pane">
                    <table class="p-success-box">
                        <tr class="column s" id="2024">
                            <div class="user">
                                <input class="p-date" type="text" name="grade" value="날짜" disabled>
                                <input class="p-team" type="text" name="nick" value="예측 승팀" disabled>
                                <input class="p-point" type="text" name="point" value="배팅 포인트" disabled>
                            </div>
                        </tr>
                        <c:forEach var="plusDTO" items="${plusDTO}">
                            <tr class="column s" id="2024">
                                <div class="user">
                                    <input class="p-date" type="text" name="grade" value="${plusDTO.cDate}" disabled>
                                    <input class="p-team" type="text" name="nick" value="${plusDTO.pResult}" disabled>
                                    <input class="p-point" type="number" name="point" value="${plusDTO.betPoint}" disabled>
                                </div>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <!-- 실패 내역 -->
                <div id="fail" class="tab-pane ">
                    <table class="p-fail-box">
                        <tr class="column s" id="2024">
                            <div class="user">
                                <input class="p-date" type="text" name="grade" value="날짜" disabled>
                                <input class="p-team" type="text" name="nick" value="예측 승팀" disabled>
                                <input class="p-point" type="text" name="point" value="배팅 포인트" disabled>
                            </div>
                        </tr>
                        <c:forEach var="minusDTO" items="${minusDTO}">
                            <tr class="column s" id="2020">
                                <div class="user">
                                    <input class="p-date" type="text" name="grade" value="${minusDTO.cDate}" disabled>
                                    <input class="p-team" type="text" name="nick" value="${minusDTO.pResult}" disabled>
                                    <input class="p-point" type="number" name="point" value="${minusDTO.betPoint}" disabled>
                                </div>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

            </div>
        </div>

    </div>
</div>
<%@ include file="../include/footer.jsp"%>