window.onload = function() {
    let nick = document.getElementById('nick');
    let btn = document.querySelector('.change-nick');

    btn.addEventListener('click', function() {
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
        })
    })
}