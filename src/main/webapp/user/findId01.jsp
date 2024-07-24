<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindID</title> 
</head>
<body>
	<div class="wrap">
		<div>
			<button type="button">아이디 찾기</button>
			<button type="button">비밀번호 찾기</button>
		</div>
		<form action="findId.user" method="post">
			<input type="text" name="name" placeholder="이름"> <br>
			<input type="tel" name="phone" placeholder="-는 제외하고 입력해주세요"> <br>
			${msg } <br>
			<input type="submit" value="찾기">
		</form>	
	</div>
</body>
</html>