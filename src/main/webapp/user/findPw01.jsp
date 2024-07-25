<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
	<form action="findPw.user" method="post">
		아이디 <input type="text" name="id">
		${msg }
		<input type="submit" value="찾기">	
	</form>
<%@ include file="../include/footer.jsp"%>