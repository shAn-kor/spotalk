window.onload = function () {
  let id = document.getElementById('user-id');
  let pwd = document.getElementById('user-pw1');
  let ckPwd = document.getElementById('user-pw2');

  // 각 태그에 변화 시 체크 조건 실행
  id.addEventListener('change', checkId);
  pwd.addEventListener('change', checkPwd);
  ckPwd.addEventListener('change', comparePwd);

  // 아이디 체크조건
  let checkIdPatternResult = false;
  function checkId() {
    if (id.value.length > 15 || id.value.length < 4) {
      alert('4~15 자리의 아이디를 입력하세요 :)');
      id.select();
    }
    else if (onlyNumberAndEnglish(id.value) == false) {
      alert('아이디는 영어, 숫자만 입력 가능합니다 :)');
      id.select();
    }
    else checkIdPatternResult = true;
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
    if (pwd != null && ckPwd != null && pwd.value !== ckPwd.value) {
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

  let checkIdBtn = document.getElementById('check-id');
  let checkNickBtn = document.getElementById('check-nick');
  let nick = document.getElementById('user-nick');

  let nickResult = false;
  let idResult = false;

  checkNickBtn.addEventListener('click', function() {
    if (nick.value.length < 1) {
      alert('닉네임을 입력해주세요');
      return;
    }
    fetch("checkDuplicateNick.user", {
      method: 'POST',
      contentType: 'application/json',
      body: JSON.stringify({nick: nick.value})
    })
    .then(response => { return response.json()})
    .then(data => {
      if (data.msg === 'ok') {
        alert('사용 가능합니다.');
        nickResult = true;
      } else {
        alert('중복되었습니다.');
        nick.focus();
        nick.value="";
      }
    })
  });

  checkIdBtn.addEventListener('click', function() {
    if (!checkIdPatternResult) {
      alert('아이디 입력 형식을 확인해주세요');
      return;
    }
    fetch("checkDuplicateId.user", {
      method: 'POST',
      contentType: 'application/json',
      body: JSON.stringify({id: id.value})
    })
        .then((response) => { return response.json()})
        .then(data => {
          if (data.msg === 'ok') {
            alert('사용 가능합니다.');
            idResult = true;
          } else {
            alert('중복되었습니다.');
            id.focus();
            id.value="";
          }
        })
  });

  let submitBtn = document.getElementById('join-submit');

  submitBtn.addEventListener('click', function() {
    event.preventDefault();
    let form = document.myForm;

    if (!nickResult) {
      alert('닉네임 중복검사를 해주세요');
      nick.focus();
      return;
    }

    if (!idResult) {
      alert('아이디 중복검사를 해주세요');
      id.focus();
      return;
    }

    if (!pwd.value || !strongPassword(pwd.value)) {
      alert('비밀번호를 확인해주세요');
      pwd.focus();
      return;
    }

    if (!ckPwd.value || pwd.value !== ckPwd.value || !strongPassword(ckPwd.value)) {
      alert('비밀번호를 확인해주세요');
      ckPwd.focus();
      return;
    }

    if (form.hint.value === "") {
      alert('비밀번호 힌트를 골라주세요');
      form.hint.focus();
      return;
    }

    if (!form.hintAnswer.value) {
      alert('비밀번호 힌트 정답을 입력해주세요');
      form.hintAnswer.focus();
      return;
    }

    form.submit();
  })
}