<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="findPw-wrap">
	<div class="white-background"></div>
	<div class="findPw_wrap">
		<div class="toggle-btn">
			<button type="button" onclick="location.href='findIdPw_Id.user';" style="background-color: antiquewhite;">아이디 찾기</button>
			<button type="button">비밀번호 찾기</button>
		</div>
		<form action="findPw.user" method="post">
			아이디 <input type="text" name="id">
			${msg }
			<input type="submit" value="찾기">	
		</form>		
	</div>
</div>
	
<%@ include file="../include/footer.jsp"%>