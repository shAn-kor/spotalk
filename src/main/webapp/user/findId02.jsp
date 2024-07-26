<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="findId-wrap">
	<div class="white-background"></div>
	<div class="findId_wrap">
		<h1>회원님의 아이디</h1>
		<div class="id_area">
			<input type="text" value="${user_id }" readonly id="copyId">
			<button type="button" onclick="copy()" id="copyBtn">복사</button>
		</div>
		<button type="button" class="btnToLogin" onclick="location.href='login.user';">로그인</button>
	</div>
	<script>
		function copy() {
			  // 복사문구값 가져오기
			  var copyId = document.getElementById("copyId");
			  var copyBtn = document.getElementById("copyBtn");
	
			  // 복사문구 선택
			  copyId.select();
	
			   // 복사
			  navigator.clipboard.writeText(copyId.value);
	
			  // 복사완료에 대해 Alert으로 띄우기
			  copyBtn.innerHTML = "✔";
			  copyBtn.style.color = "green";
			  
			}
	</script>
</div>
<%@ include file="../include/footer.jsp"%>