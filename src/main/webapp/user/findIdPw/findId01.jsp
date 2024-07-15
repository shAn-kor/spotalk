<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindID</title>
</head>
<body>
	<form action="findId.user" method="post">
		이름 <input type="text" name="name">
		휴대폰번호 <input type="number" name="phone">
		${msg }
		
		<input type="submit" value="찾기">
		
	</form>
</body>
</html>