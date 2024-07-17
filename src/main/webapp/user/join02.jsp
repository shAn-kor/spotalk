<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>auth</title>
    <link rel="stylesheet" href="../css/auth.css">
    <!-- <script src="../js/auth.js"></script> -->
</head>
<body>
    <div class="auth_box">
        <p>
            <a href="agree.user" class="agree_link">약관 동의</a> > 
            <a href="auth.user" class="auth_link">본인인증</a> > 
        </p>
        <div class="auth_wrap">
            <h3 class="auth_title">입력해주세요.</h3>
            <form action="checkPhone.user" method="post" class="auth_form">
                <div class="auth1">
                    <div class="input_name">
                        <input type="text" name="name" id="user_name" placeholder="이름" value="${name }">
                    </div>
                    <div class="radio">
                        <input type="radio" name="gender" value="M" ${gender eq "M" ? 'checked' : null } id="genderM">
                        <label for="genderM">남</label>
                    </div>
                    <div class="radio">
                        <input type="radio" name="gender" value="W" ${gender eq "W" ? 'checked' : null } id="genderW">
                        <label for="genderW">여</label>
                    </div>
                </div>
                <div class="auth2">
                	<select id="year" name="year">
            			<option value="${year }">년 선택</option>
            			<!-- 1900년부터 2024년까지 선택할 수 있게 -->
            			<script>
                		for (let i = 1900; i <= new Date().getFullYear(); i++) {
                    	document.write('<option value="' + i + '">' + i + '</option>');
                		}
            			</script>
        			</select>
        			<select id="month" name="month">
			            <option value="${month }">월 선택</option>
			            <!-- 1월부터 12월까지 선택할 수 있게 -->
			            <script>
			                for (let i = 1; i <= 12; i++) {
			                    document.write('<option value="' + i + '">' + i + '</option>');
			                }
			            </script>
			        </select>
			        <select id="day" name="day">
			            <option value="${day }">일 선택</option>
			            <!-- 1일부터 31일까지 선택할 수 있게 -->
			            <script>
			                for (let i = 1; i <= 31; i++) {
			                    document.write('<option value="' + i + '">' + i + '</option>');
			                }
			            </script>
			        </select>
                    <%-- <input type="number" max="9999" name="year" id="year" placeholder="년" value="${year }" class="birth">
                    <input type="number" min="1" max="12" name="month" id="month" placeholder="월" value="${month }" class="birth">
                    <input type="number" min="1" max="31" name="day" id="day" placeholder="일" value="${day }" class="birth"> --%>
                </div>
                
	            <div class="auth3">
	                <input type="tel" name="phone" id="phone" placeholder="전화번호" value="${phone }">
	            </div>
                <input type="submit" value="확인" class="submit_btn">
            </form>
        </div>
    </div>
</body>
</html>