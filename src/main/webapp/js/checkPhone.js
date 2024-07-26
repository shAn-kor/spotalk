window.onload = function() {
    let authForm = document.authForm;
    let btn = document.querySelector('.submit_btn');

    btn.addEventListener('click', function(e) {
        e.preventDefault();
        let nameReg = /^[가-힣a-zA-Z]{2,}$/;
        let phoneReg = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

        let userName = authForm.name;
        let gender = authForm.gender;
        let year = authForm.year;
        let month = authForm.month;
        let day = authForm.day;
        let phone = authForm.phone;

        console.log(userName.value);

        // null 확인
        if (userName.value === "") {
            alert('이름을 입력해주세요');
            userName.focus();
            return;
        }
        if (userName.value.length < 2) {
            alert('이름은 2글자 이상 입력해주세요.');
            userName.focus();
            userName.value = "";
            return;
        }
        if (!nameReg.test(userName.value)) {
            alert('이름은 영어, 한글만 입력 가능합니다.');
            userName.focus();
            userName.value = "";
            return;
        }

        if (gender.value === "") {
            alert('성별을 선택해주세요');
            return;
        }
        if (year.value === "" || month.value === "" || day.value === "") {
            alert('생년월일을 입력해주세요');
            return;
        }

        if (phone.value === "") {
            alert('전화번호를 입력해주세요');
            userName.focus();
            return;
        }
        if (!phoneReg.test(phone.value)) {
            alert('유효한 전화번호 형식이 아닙니다.');
            phone.focus();
            phone.value = "";
            return;
        }

        phone.value = phone.value.replaceAll('-', '');

        authForm.submit();
    })
}