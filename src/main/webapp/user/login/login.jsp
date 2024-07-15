<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../css/login.css">
    <script defer src="../../js/login.js"></script>
</head>
<body>
    <div class="login_box">
        <h3>승부하러 가기</h3>
        <form action="" class="login_form">
            <div class="login-area">
                <input type="text" name="user_id" id="user_id" class="user_input">
                <span class="p-login top">아이디</span>
            </div>
            
            <div class="login-area">
                <input type="password" name="user_pw" id="user_pw" class="user_input">
                <span class="p-login top">비밀번호</span>
            </div>
            <input type="submit" value="로그인" id="user_login">
            <a href="#" class="join">회원가입</a>
            <p class="find"><a href="../findIdPw/findIdPw_Id.user">아이디</a> / <a href="../findIdPw/findIdPw_Pw.user">비밀번호 찾기</a></p>
        </form>
    </div>
</body>
</html>