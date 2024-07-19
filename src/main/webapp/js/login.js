window.onload = function() {
  let id = document.getElementById('user_id');
  let pwd = document.getElementById('user_pw');

  // 각 태그에 변화 시 체크 조건 실행
  id.addEventListener('change', checkId);
  pwd.addEventListener('change', checkPwd);

  // 아이디 체크조건
  function checkId() {
    if (id.value.length > 15 || id.value.length < 4) {
      alert('4~15 자리의 아이디를 입력하세요 :)');
      id.value="";
      id.select();
    } else if (onlyNumberAndEnglish(id.value) === false) {
      alert('아이디는 영어, 숫자만 입력 가능합니다 :)');
      id.value="";
      id.select();
    } else {
      id.style.opacity = "1";
      id.className += ' focus';
      event.target.nextElementSibling.style.fontSize = "10px";
    }
  }

  // 비밀번호 체크조건
  function checkPwd() {
    if (strongPassword(pwd.value) === false) {
      alert("8 자리 이상 영문, 숫자, 특수문자 조합이어야 합니다 :)");
      document.querySelector("#user_pw").value = "";
      pwd.focus();
    } else {
      pwd.style.opacity = "1";
      pwd.className += ' focus';
      event.target.nextElementSibling.style.fontSize = "10px";
    }
  }

  function onlyNumberAndEnglish(str) {
    return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
  }

  function strongPassword (str) {
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
  }
}