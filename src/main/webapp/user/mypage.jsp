<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/modify.js"></script>
<div class="white-wrap">
    <div class=white-background></div>
    <div class="myPage-wrap">
        <div class="myPage-box">
        		<h2 style="margin-bottom: 30px;">마이페이지</h2>
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
                    <input type="text" name="nick" value="${dto.nick}" id="nick">
                    <button type="button" class="change-nick">수정</button>
                </div>
                <div>
                    <p class="left">회 원 등 급</p>
                    <div class="user-grade">
                        <input id="data-grade" class="grade-id" type="text" name="grade" value="${dto.gradeId}" disabled>
                        <p class="grade" data-grade="${sessionScope.grade_id}">등급</p>
                    </div>
                </div>
                <div>
                    <p class="left">포 인 트</p>
                    <input class="right" type="text" name="point" value="<fmt:formatNumber value="${dto.point}" type="number" pattern="${formatPattern}"/> P" style="width: 323px; text-indent: 70px" disabled>
                    <button type="button" class="pointBtn" onclick="location.href='${pageContext.request.contextPath}/predict/pointList.predict';">내역</button>
                </div>
    </div>
                <div style="text-align: right; padding-right: 50px; width: 100%;">
                	<a href="#" class="exitBtn" id="deleteAccountLink">회원탈퇴</a>               
                </div>
                <script>
	                document.getElementById('deleteAccountLink').addEventListener('click', function(event) {
	                    // 기본 링크 동작을 막음
	                    event.preventDefault();
	                    
	                    // 창 크기와 위치를 변수로 정의
	                    var width = 400;
	                    var height = 300;
	                    var top = (window.innerHeight / 2) - (height / 2) + window.screenY;
	                    var left = (window.innerWidth / 2) - (width / 2) + window.screenX;
	
	                    // 새 창을 열어 비밀번호 입력 폼을 표시
	                    window.open(
	                        'outMember.user', // 컨트롤러 URL 경로
	                        'popupWindow',
	                        'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',scrollbars=no,menubar=no,toolbar=no,location=no,status=no'
	                    );
	                });
			    </script>
	</div>
</div>
<%@include file="../include/footer.jsp"%>