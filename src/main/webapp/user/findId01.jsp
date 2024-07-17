<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindID</title>

<style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1080px;
            margin: 0 auto; /* 페이지 중앙 정렬 */
            padding: 20px; /* 내용과 외곽 사이의 간격 */
        }
        
        .wrap {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: 560px;
        }

        div {
            text-align: center; /* 내부 버튼 가운데 정렬 */
            margin-bottom: 20px; /* 아래 여백 */
        }

        button {
            margin: 0px; /* 버튼 사이 여백 */
            padding: 0;
            font-size: 16px;
            cursor: pointer;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }


        form label {
            display: block;
            margin-bottom: 10px;
        }

        form input[type="text"],
        form input[type="tel"] {
            width: 500px; /* 입력 필드 너비 */
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        form input[type="submit"] {
            width: 500px;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        p {
            margin-top: 10px;
            color: #ff0000; /* 오류 메시지 색상 */
        }
    </style>
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