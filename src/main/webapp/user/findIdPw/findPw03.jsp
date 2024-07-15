<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	비밀번호 재설정
	<form action="updatePw.user?id=${id }" method="post">
		비밀번호 <input type="password" name="pw" id="user-pw1">
		
		재확인 <input type="password" name="check" id="user-pw2">
		
		<input type="text" id="msg" value="" readonly style="opacity:0;">
		
		<input type="submit" value="변경">
	</form>
	
	<script>
		let pwd = document.getElementById('user-pw1');
	 	let ckPwd = document.getElementById('user-pw2');
		let msg = document.getElementById('msg');
	  	// 각 태그에 변화 시 체크 조건 실행
	  pwd.addEventListener('change', checkPwd);
	  ckPwd.addEventListener('change', comparePwd);
	  

	  // 비밀번호 체크조건
	  function checkPwd() {
	    if (strongPassword(pwd.value) == false) {
	    	msg.style.opacity=1;
	      msg.value = ("8 자리 이상 영문, 숫자, 특수문자 조합이어야 합니다 :)");
	      document.querySelector("#user-pw1").value = "";
	      pwd.focus();
	    }

	    else msg.style.opacity=0;
	  }

	  // 비밀번호 확인 체크조건
	  function comparePwd() {
	    if (pwd != null && ckPwd != null && pwd.value != ckPwd.value) {
	    	msg.style.opacity=1;
		      msg.value = ("비밀번호가 일치하지 않습니다 :)");
	      document.querySelector("#user-pw2").value = "";
	      ckPwd.focus();
	    }
	    else msg.style.opacity=0;
	  }

	  function onlyNumberAndEnglish(str) {
	      return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
	  }

	  function strongPassword (str) {
	      return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
	  }
	
	</script>
	
	
</body>
</html>