window.onload = function () {  
  let pwd = document.getElementById('user-pw1');
  let ckPwd = document.getElementById('user-pw2');

  // 각 태그에 변화 시 체크 조건 실행
  pwd.addEventListener('change', checkPwd);
  ckPwd.addEventListener('change', comparePwd);

  // 비밀번호 체크조건
  function checkPwd() {
    if (strongPassword(pwd.value) == false) {
      alert("8 자리 이상 영문, 숫자, 특수문자 조합이어야 합니다 :)");
      document.querySelector("#user-pw1").value = "";
      pwd.focus();
    }
  }

  // 비밀번호 확인 체크조건
  function comparePwd() {
    if (pwd != null && ckPwd != null && pwd.value != ckPwd.value) {
      alert("비밀번호가 일치하지 않습니다 :)");
      document.querySelector("#user-pw2").value = "";
      ckPwd.focus();
    }
  }

  function onlyNumberAndEnglish(str) {
      return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
  }

  function strongPassword (str) {
      return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
  }
}