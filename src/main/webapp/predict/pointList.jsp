<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- 부트스트랩 css링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

<!-- 제이쿼리(부트스트랩보다 먼저 링크) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.7.1.min.js"></script>

<!-- Popper.js (부트스트랩보다 먼저 링크) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

<!-- 부트스트랩 js링크 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pointlist.css">

<div class="wrap">
    <div class="top">
        <div class="top-title">
            <p><strong>SPO</strong>TALK 포인트</p>
        </div>
        <div class="top-bottom">
            <p><span>${sessionScope.point}</span> P</p>
        </div>
    </div>

    <div class="list">
        <ul class="nav nav-tabs">

            <select>
                <option value="2024">2024년</option>
                <option value="2023">2023년</option>
            </select>

            <li class="active"><a data-toggle="tab" href="#all">전체</a></li>
            <li><a data-toggle="tab" href="#success">성공 내역</a></li>
            <li><a data-toggle="tab" href="#fail">실패 내역</a></li>
        </ul>

        <div class="tab-content">
            <!-- 전체 -->
            <div id="all" class="tab-pane in active">
                <table class="all-box">
                    <c:forEach var="dto" items="${dto}">
                        <tr class="column s" id="2020">
                            <div class="user">
                                <input type="text" name="grade" value="${dto.cDate}" disabled>
                                <input type="text" name="nick" value="${dto.pResult}" disabled>
                                <input type="number" name="point" value="${dto.betPoint}" disabled>
                            </div>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <!-- 성공 내역 -->
            <div id="success" class="tab-pane ">
                <table class="success-box">
                    <c:forEach var="plusDTO" items="${plusDTO}">
                        <tr class="column s" id="2020">
                            <div class="user">
                                <input type="text" name="grade" value="${plusDTO.cDate}" disabled>
                                <input type="text" name="nick" value="${plusDTO.pResult}" disabled>
                                <input type="number" name="point" value="${plusDTO.betPoint}" disabled>
                            </div>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <!-- 실패 내역 -->
            <div id="fail" class="tab-pane ">
                <table class="fail-box">
                    <c:forEach var="minusDTO" items="${minusDTO}">
                        <tr class="column s" id="2020">
                            <div class="user">
                                <input type="text" name="grade" value="${minusDTO.cDate}" disabled>
                                <input type="text" name="nick" value="${minusDTO.pResult}" disabled>
                                <input type="number" name="point" value="${minusDTO.betPoint}" disabled>
                            </div>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>
    </div>
    <button type="button" class="btn btn-default" onclick="location.href='mypage.html';">완 료</button>

</div>
<%@ include file="../include/footer.jsp"%>