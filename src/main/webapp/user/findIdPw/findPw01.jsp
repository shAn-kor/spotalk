<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="findPw.user" method="post">
		아이디 <input type="text" name="id">
		${msg }
		<input type="submit" value="찾기">	
	</form>
	
</body>
</html>