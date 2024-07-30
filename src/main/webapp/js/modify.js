window.onload = function() {
    //grade 이미지 변환
    // .grade 요소를 가져옵니다.
    let gradeElement = document.querySelector('.myPage-box .user-grade > .grade');

    // data-grade 속성에서 grade_id 값을 가져옵니다.
    let gradeId = document.getElementById('data-grade');

    // grade_id 값에 따라 background-position을 설정합니다.
    switch (gradeId.value) {
        case '1':
            gradeElement.style.backgroundPosition = '5px 0px';

            break;
        case '2':
            gradeElement.style.backgroundPosition = '-36px 0px';
            break;
        case '3':
            gradeElement.style.backgroundPosition = '-76px 0px';
            break;
        case '4':
            gradeElement.style.backgroundPosition = '-117px 0px';
            break;
        case '5':
            gradeElement.style.backgroundPosition = '-157px 0px';
            break;
        case '6':
            gradeElement.style.backgroundPosition = '2px -40px';
            break;
        case '7':
            gradeElement.style.backgroundPosition = '-38px -40px';
            break;
        case '8':
            gradeElement.style.backgroundPosition = '-78px -40px';
            break;
        case '9':
            gradeElement.style.backgroundPosition = '-118px -40px';
            break;
        case '10':
            gradeElement.style.backgroundPosition = '-157px -40px';
            break;
        case '11':
            gradeElement.style.backgroundPosition = '-157px -40px';
            break;
        default:
            gradeElement.style.backgroundPosition = '5px 0px'; // 기본값 설정
            break;
    }

    let nick = document.getElementById('nick');
    let btn = document.querySelector('.myPage-box > div > .nick-btn');
    let oldValue = nick.value;

    btn.addEventListener('click', function() {
        if (btn.classList.contains('change-nick')) {
            btn.classList.remove('change-nick');
            btn.classList.add('submit-nick');
            btn.innerHTML = '변경하기';
            nick.disabled = false;
        } else {

            btn.classList.remove('submit-nick');
            btn.classList.add('change-nick');
            btn.innerHTML = '수정';
            nick.disabled = true;

            if (nick.value === "" || nick.value == null) {
                alert('빈 문자는 보낼 수 없습니다.');
                nick.value = oldValue;
                return;
            }

            if (nick.value.length > 10) {
                alert('닉네임은 최대 10글자 입니다.');
                nick.value = oldValue;
                return;
            }

            fetch('changeNick.user', {
                method: 'POST',
                contentType: 'application/json',
                body: JSON.stringify({nick: nick.value})
            })
                .then(response => { return response.json() })
                .then(data => {
                    if (data.msg === 'ok') {
                        alert('수정 완료');
                    }
                    else {
                        alert('중복되었습니다!');
                    }

                    location.reload();
                })
        }
    })
}