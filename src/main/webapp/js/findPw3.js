window.onload = function() {
  let pwd = document.getElementById('user-pw1');
  let ckPwd = document.getElementById('user-pw2');
  let msg1 = document.getElementById('msg1');
  let msg2 = document.getElementById('msg2');
  let pwdResult = false;
  let ckPwdResult = false;
 
  pwd.addEventListener('change', checkPwd);
  ckPwd.addEventListener('change', checkCkPwd);

  // 비밀번호 체크조건
  function checkPwd() {
    if (pwd.value.length >= 1) {
		pwdResult = true;
      pwd.style.opacity = "1";
      pwd.className += ' focus';
      pwd.nextElementSibling.style.fontSize = "10px";
    } else pwdResult = false;
	
	if (strongPassword(pwd.value) == false) {
      msg1.style.opacity=1;
      msg1.value = ("8 자리 이상 영문, 숫자, 특수문자 조합이어야 합니다.");
      document.querySelector("#user-pw1").value = "";
      pwd.focus();
    } else msg1.style.opacity=0;
  }

  // 재확인 체크조건
  function checkCkPwd() {
	if (ckPwd.value.length>= 1) {
	  ckPwdResult = true;
      ckPwd.style.opacity = "1";
      ckPwd.className += ' focus';
      ckPwd.nextElementSibling.style.fontSize = "10px";
    } else ckPwdResult = false;
	
	if (pwd != null && ckPwd != null && pwd.value != ckPwd.value) {
      msg2.style.opacity=1;
	  msg2.value = ("비밀번호가 일치하지 않습니다.");
      document.querySelector("#user-pw2").value = "";
      ckPwd.focus();
    } else msg2.style.opacity=0;
  }
  
  function onlyNumberAndEnglish(str) {
      return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
  }

  function strongPassword (str) {
      return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
  }
	  
  let resetPwForm = document.resetPwForm;
  let resetBtn = document.getElementById("resetPw");
  resetBtn.addEventListener('click', function() {
	event.preventDefault();
	
	checkPwd();
	checkCkPwd();
	
	if (!pwdResult) {
		alert('비밀번호를 입력해주세요.');
		pw.focus();
	} else if (!ckPwdResult) {
		alert('재확인을 진행해주세요.');
		check.focus();
	}
	if (pwdResult && ckPwdResult) {
		resetPwForm.submit();
	}
  });
  
  
}