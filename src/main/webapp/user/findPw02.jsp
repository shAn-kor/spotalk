<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp"%>

	<form action="checkPwa.user?id=${dto.id }" method="post" name="QnA">
		질문 ${dto.pwq }
		답 <input type="text" name="answer">
		${msg }
		<input type="submit" value="제출">
	</form>
	
<%@ include file="../include/footer.jsp"%>