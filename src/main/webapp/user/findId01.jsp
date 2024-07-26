<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/findId.js"></script>
<div class="findId-wrap">
	<div class="white-background"></div>
	<div class="findId_wrap">
		<div class="toggle-btn">
			<button type="button">아이디 찾기</button>
			<button type="button" onclick="location.href='findIdPw_Pw.user';">비밀번호 찾기</button>
		</div>
		<form action="findId.user" method="post" class="findId_form" name="findIdForm">
			<div class="findId-area">
				<input type="text" name="name" id="user_name" class="findId_input">
				<span class="p-findId top">이름</span>
			</div>
			<div class="findId-area">
				<input type="tel" name="phone" id="user_phone" class="findId_input">
				<span class="p-findId top">전화번호</span>
			</div>
			${msg }
			<input type="submit" value="찾기" id="findId_find">
		</form>		
	</div>
</div>
	
<%@include file="../include/footer.jsp"%>