<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/modify.js"></script>
<div class="white-wrap">
    <div class=white-background></div>
    <div class="myPage-wrap">
        <div class="myPage-box">
                <div>
                    <p class="left">이 름</p>
                    <input class="right" type="text" name="name" value="${dto.name}" disabled>
                </div>
                <div>
                    <p class="left">아 이 디</p>
                    <input class="id right" id="user-id" type="text" name="id" value="${dto.id}" disabled>
                </div>
                <div>
                    <p class="left">비 밀 번 호</p>
                    <input class="right" type="password" name="pw" value="${dto.pw}" disabled></td>
                </div>
                <div>
                    <p class="left">닉 네 임</p>
                    <div class="right">
                        <input type="text" name="nick" value="${dto.nick}" id="nick">
                        <button type="button" class="btn-default change-nick">수정</button>
                    </div>
                </div>
                <div>
                    <p class="left">회 원 등 급</p>
                    <div class="user-grade right">
                        <input id="data-grade" class="grade-id" type="text" name="grade" value="${dto.gradeId}" disabled>
                        <p class="grade" data-grade="${sessionScope.grade_id}">등급</p>
                    </div>
                </div>
                <div>
                    <p class="left">포 인 트</p>
                    <input class="point" type="number" name="point" value="${dto.point}" disabled>
                </div>
        </div>
        <div class="myPage-btn-box">
            <button type="button" class="btn left" onclick="location.href='${pageContext.request.contextPath}/predict/pointList.predict';">포인트 내역</button>
            <button type="button" class="btn right" onclick="location.href='outMember.user';">회원탈퇴</button>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp"%>