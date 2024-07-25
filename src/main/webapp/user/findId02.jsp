<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
		<h4>회원님의 아이디</h4>
		${user_id }
		<input type="button" value="로그인" onclick="location.href='login.user';">
<%@ include file="../include/footer.jsp"%>