window.onload = function() {
  let name = document.getElementById('user_name');
  let phone = document.getElementById('user_phone');
  let nameResult = false;
  let phoneResult = false;
  // 각 태그에 변화 시 체크 조건 실행
  name.addEventListener('change', checkName);
  phone.addEventListener('change', checkPhone);

  // 이름 체크조건
  function checkName() {
    if (name.value.length >= 1) {
		nameResult = true;
      name.style.opacity = "1";
      name.className += ' focus';
      name.nextElementSibling.style.fontSize = "10px";
    } else nameResult = false;
  }

  // 전화번호 체크조건
  function checkPhone() {
	if (phone.value.length>= 1) {
	  phoneResult = true;
      phone.style.opacity = "1";
      phone.className += ' focus';
      phone.nextElementSibling.style.fontSize = "10px";
    } else phoneResult = false;
  }
  
  let findIdForm = document.findIdForm;
  let findBtn = document.getElementById("findId_find");
  findBtn.addEventListener('click', function() {
	event.preventDefault();
	
	checkName();
	checkPhone();
	
	if (!nameResult) {
		alert('이름을 입력해주세요.');
	} else if (!phoneResult) {
		alert('전화번호를 입력해주세요.');
	}
	
	if (nameResult && phoneResult) {
		findIdForm.submit();
	}
  });
  
  
}