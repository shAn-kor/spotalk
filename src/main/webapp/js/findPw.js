window.onload = function() {
  let id = document.getElementById('user_id');
  let idResult = false;
  // 각 태그에 변화 시 체크 조건 실행
  id.addEventListener('change', checkId);

  // 이름 체크조건
  function checkId() {
    if (id.value.length >= 1) {
		idResult = true;
      id.style.opacity = "1";
      id.className += ' focus';
      id.nextElementSibling.style.fontSize = "10px";
    } else idResult = false;
  }
  
  let findPwForm = document.findPwForm;
  let findBtn = document.getElementById("findPw_find");
  findBtn.addEventListener('click', function() {
	event.preventDefault();
	
	checkId();
	
	if (!idResult) {
		alert('아이디를 입력해주세요.');
		id.focus();
	} 
	
	if (idResult) {
		findPwForm.submit();
	}
  });
  
  
}