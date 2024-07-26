<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp"%>
	<form action="delete.user" method="post" name="outMember">
		<div>
			<input type="password" name="user-pw" id="user-pw" placeholder="비밀번호" required>
		</div>
		<input type="submit" value="탈퇴">
	</form>
<%@ include file="../include/footer.jsp"%>