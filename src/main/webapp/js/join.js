window.onload = function () {  
  let id = document.getElementById('user-id');
  let pwd = document.getElementById('user-pw1');
  let ckPwd = document.getElementById('user-pw2');

  // 각 태그에 변화 시 체크 조건 실행
  id.addEventListener('change', checkId);
  pwd.addEventListener('change', checkPwd);
  ckPwd.addEventListener('change', comparePwd);

  // 아이디 체크조건
  function checkId() {
    if (id.value.length > 15 || id.value.length < 4) {
      alert('4~15 자리의 아이디를 입력하세요 :)');
      id.select();
    }
    if (onlyNumberAndEnglish(id.value) == false) {
      alert('아이디는 영어, 숫자만 입력 가능합니다 :)');
      id.select();
    }
  }

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