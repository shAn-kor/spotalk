<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/findPw.js"></script>
<div class="findPw-wrap">
	<div class="white-background"></div>
	<div class="findPw_wrap">
		<div class="toggle-btn">
			<button type="button" onclick="location.href='findIdPw_Id.user';" style="background-color: antiquewhite;">아이디 찾기</button>
			<button type="button">비밀번호 찾기</button>
		</div>
		<form action="findPw.user" method="post" class="findPw_form" name="findPwForm">
			<div class="findId-area">
				<input type="text" name="id" id="user_id" class="findId_input">
				<span class="p-findId top">아이디</span>
			</div>
			${msg }
			<input type="submit" value="찾기" id="findPw_find">	
		</form>		
	</div>
</div>
	
<%@ include file="../include/footer.jsp"%>