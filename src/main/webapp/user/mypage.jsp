<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOTALK</title>
    <link rel="stylesheet" href="../css/mypage.css">

    <!-- 부트스트랩 css링크 -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

    <!-- 제이쿼리(부트스트랩보다 먼저 링크) -->
    <script src="../bootstrap/js/jquery-3.7.1.min.js"></script>
    
    <!-- 부트스트랩 js링크 -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <script src="../js/modify.js"></script>
</head>
<body>
    <!-- jsy test -->
    <div class="main">
        <div class="menu">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">승부예측</a></li>
                <li><a href="#">승부사랭킹</a></li>
            </ul>
        </div>

        <div class="wrap">
            <table class="box">

                <tr>
                    <td>이 름</td>
                    <td><input type="text" name="name" value="${dto.name}" disabled></td>
                </tr>
                <tr>
                    <td>아 이 디</td>
                    <td><input class="id" id="user-id" type="text" name="id" value="${dto.id}" disabled></td>
                </tr>
                <tr>
                    <td>비 밀 번 호</td>
                    <td><input type="password" name="pw" value="${dto.pw}" disabled></td>
                </tr>
                <tr>
                    <td>닉 네 임</td>
                    <td><input type="text" name="nick" value="${dto.nick}" id="nick"></td>
                    <td><button type="button" class="btn-default change-nick">수정</button></td>
                </tr>
                <tr>
                    <td>회 원 등 급</td>
                    <td>
                        <input class="grade" type="text" name="grade" value="${dto.gradeId}" style="width: 90px;" disabled>
                        <img src="../img/iron.png" class="grade1" alt="회원등급">
                        <img src="../img/AllGrade.jpg" class="allgrade" alt="모든등급">
                    </td>
                </tr>
                <tr>
                    <td>포 인 트</td>
                    <td><input class="point" type="number" name="point" value="${dto.point}" disabled></td>
                </tr>

            </table>
            <button type="button" class="btn" onclick="location.href='pointlist.html';">포인트 내역</button>
        </div>
    </div>
</body>
</html>