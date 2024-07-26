window.onload = function() {
  let id = document.getElementById('user_id');
  let pwd = document.getElementById('user_pw');
  let idResult = false;
  let pwdResult = false;
  // 각 태그에 변화 시 체크 조건 실행
  id.addEventListener('change', checkId);
  pwd.addEventListener('change', checkPwd);

  // 아이디 체크조건
  function checkId() {
    if (id.value.length >= 1) {
		idResult = true;
      id.style.opacity = "1";
      id.className += ' focus';
      event.target.nextElementSibling.style.fontSize = "10px";
    } else idResult = false;
  }

  // 비밀번호 체크조건
  function checkPwd() {
	if (pwd.value.length>= 1) {
	  pwdResult = true;
      pwd.style.opacity = "1";
      pwd.className += ' focus';
      event.target.nextElementSibling.style.fontSize = "10px";
    } else pwdResult = false;
  }
  let loginForm = document.loginForm;
  let loginBtn = document.getElementById("user_login");
  loginBtn.addEventListener('click', function() {
	event.preventDefault();
	
	checkId();
	checkPwd();
	
	if (!idResult) {
		alert('아이디를 입력해주세요.');
	} else if (!pwdResult) {
		alert('비밀번호를 입력해주세요.');
	}
	
	if (idResult && pwdResult) {
		loginForm.submit();
	}
  });
  
  
}