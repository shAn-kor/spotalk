document.addEventListener('DOMContentLoaded', function() {
    // 로그인 상태를 확인하는 변수 (예시)
    let isLoggedIn = false; // 로그인 상태 (예시로 false로 설정)

    const loginButton = document.getElementById('loginButton');
    const signupButton = document.getElementById('signupButton');
    const myPageButton = document.getElementById('myPageButton');
    const logoutButton = document.getElementById('logoutButton');
    const myInfo = document.getElementById('myInfo');

    // 로그인 상태에 따른 버튼 토글 함수
    function toggleButtons() {
        if (isLoggedIn) {
            loginButton.style.display = 'none';
            signupButton.style.display = 'none';
            myPageButton.style.display = 'inline-block';
            logoutButton.style.display = 'inline-block';
            myInfo.style.display = 'block';
        } else {
            loginButton.style.display = 'inline-block';
            signupButton.style.display = 'inline-block';
            myPageButton.style.display = 'none';
            logoutButton.style.display = 'none';
            myInfo.style.display = 'none';
        }
    }

    // 초기 상태 설정
    toggleButtons();

    // 예시로 로그인/로그아웃 버튼 클릭 시 상태 변경 (실제 구현에서는 서버와의 통신 필요)
    loginButton.addEventListener('click', function() {
        isLoggedIn = true;
        toggleButtons();
    });

    logoutButton.addEventListener('click', function() {
        isLoggedIn = false;
        toggleButtons();
    });
});