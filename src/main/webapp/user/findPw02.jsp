<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/findPw2.js"></script>

	<div class="findPw-wrap">
		<div class="white-background"></div>
		<div class="findPw_wrap">
			<div class="toggle-btn">
				<button type="button" onclick="location.href='findIdPw_Id.user';" style="background-color: antiquewhite;">아이디 찾기</button>
				<button type="button">비밀번호 찾기</button>
			</div>
			<form action="checkPwa.user?id=${dto.id }" method="post" class="QnA_form" name="QnAForm">
				<div class="QnA_Q">
					Q.${dto.pwq }
				</div>
				<div class="QnA-area">
				<input type="text" name="answer" id="QnA_A" class="QnA_input" placeholder="답을 입력해주세요.">
				</div>
				${msg }
				<input type="submit" value="제출" id="QnA_submit">
			</form>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp"%>