<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <link rel="stylesheet" href="../css/join.css">
    <script defer src="../js/join.js"></script>
</head>
<body>
    <div class="join-box">
        <p>
            <a href="agree.user" class="agree_link">약관 동의</a> > 
            <a href="auth.user" class="auth_link">본인인증</a> > 
            <a href="join.user" class="join_link">계정 생성</a>
        </p>
        <div class="join_wrap">
            <h3 class="join_title">입력해주세요.</h3>
            <form class="join_form" action="#">
                <div class="join-nick">
                    <input type="text" name="user-name" id="user-name" placeholder="닉네임" required>
                    <a href="#">중복확인</a>
                </div>
                <div class="join-id">
                    <input type="text" name="user-id" id="user-id" placeholder="아이디" required>
                    <a href="#">중복확인</a>
                </div>
                <div class="join-pw">
                    <input type="password" name="user-pw1" id="user-pw1" placeholder="비밀번호" required>
                </div>
                <div class="join-pwchk">
                    <input type="password" name="user-pw2" id="user-pw2" placeholder="비밀번호 재확인" required>
                </div>
                <div class="join-pw-hint">
                    <select name="hint" id="pw-hint">
                        <option value="">비밀번호 힌트</option>
                        <option value="">비밀번호 힌트</option>
                    </select>
                </div>
                <div class="join-pw-hint-answer">
                    <input type="text" name="hint-answer" id="hint-answer" placeholder="답">
                </div>
                <input type="submit" name="join-submit" id="join-submit" value="가입하기">
            </form>
        </div>
    </div>
</body>
</html>