<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        body{
            background-image: url("../img/popup.jpg");
            background-size: 100%;
            background-repeat: no-repeat;
        }

        .textBox{
            margin: 0 auto;
            border: 8px inset rgb(148, 0, 0);
            background-color: rgba(255,255,255,0.9);
            width: 570px;
            height: 270px;
            text-align: center;
        }
        .textBox .text {
            margin-top: 50px;
            font-size: 18px;
        }


</style>

</head>
<body>
	
	<div class="textBox">
        <h3>- NOTICE -</h3>
		<p class="text">
            본 페이지는 경기 4일 전부터 하루 전까지 <br>
            <strong style="color: rgb(202, 0, 0);">3일 동안</strong> 승부를 보실 수 있습니다. <br><br>
            <strong>회원님의 승부를 기대하겠습니다.</strong>
		</p>
	</div>
    <input type="checkbox" onclick="popup('spototoPopup');" style="margin-left: 30px;" >
    <span style="color: white;">오늘 하루 이 창을 열지않기</span>


    <script>
    
        function popup(name) {

            //쿠키생성
            var date = new Date();
            date.setDate(  date.getDate() + 1 );
            date.setHours(0);
            date.setMinutes(0);
            date.setSeconds(0);

            //쿠키문자열
            var str = name + "=true;expires=" + date.toUTCString() + ";";
            document.cookie = str;

            window.close(); //팝업창을 종료;
        }

    </script>

</body>
</html>