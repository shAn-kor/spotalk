<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/findPw3.js"></script>
<div class="findPw-wrap">
	<div class="white-background"></div>
	<div class="findPw_wrap">
		<h3>비밀번호 재설정</h3>
		<form action="updatePw.user?id=${id }" method="post" class="resetPw_form" name="resetPwForm">
			<div class="findId-area" style="margin-bottom: 0;">
				<input type="password" name="pw" id="user-pw1" class="findId_input">
				<span class="p-findId top">새 비밀번호</span>
			</div>
			<input type="text" id="msg1" value="" readonly style="opacity:0; width: 100%; background: none; text-align: center">
			<div class="findId-area" style="margin-bottom: 0;">
				<input type="password" name="check" id="user-pw2" class="findId_input">
				<span class="p-findId top">비밀번호 재확인</span>
			</div>	
			
			<input type="text" id="msg2" value="" readonly style="opacity:0; width: 100%; background: none; text-align: center">
			
			<input type="submit" value="변경" id="resetPw">
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>