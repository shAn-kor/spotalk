<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>탈퇴하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <style>
        /* 모달 스타일 */
        .modal {
            display: none; /* 기본적으로 숨겨짐 */
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 300px;
            text-align: center;
        }
        .modal-content button {
            margin-top: 10px;
        }
    </style>
    <script>
        let result = '<%= request.getAttribute("result") %>';

        function showModal(message, isSuccess) {
            const modal = document.getElementById('modal');
            const messageElement = document.getElementById('modal-message');
            const closeButton = document.getElementById('modal-close');

            messageElement.textContent = message;
            modal.style.display = 'flex';
            
            closeButton.onclick = function() {
                if (isSuccess) {
                    // 성공 시 원래 창의 메인 페이지로 이동
                    if (window.opener) {
                        window.opener.location.href = '/spotalk/spotalk.do'; // 메인 페이지로 이동
                    }
                    window.close(); // 현재 창 닫기
                } else {
                    // 실패 시 모달만 숨기기
                    modal.style.display = 'none';
                }
            };
        }

        function handleResponse(message, isSuccess) {
            showModal(message, isSuccess);
        }

        window.onload = function() {
            if (result === 'success') {
                handleResponse('계정이 삭제되었습니다.', true);
            } else if (result === 'failure') {
                handleResponse('비밀번호가 일치하지 않습니다.', false);
            }
        };
    </script>
</head>
<body style="background-color: antiquewhite; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0;">
    <form action="delete.user" method="post" name="outMember">
        <h3>비밀번호 확인</h3>
        <div>
            <input type="password" name="user-pw" id="user-pw" placeholder="비밀번호" required>
            <input type="submit" value="탈퇴">
        </div>
    </form>

    <!-- 모달 -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <p id="modal-message"></p>
            <button id="modal-close">닫기</button>
        </div>
    </div>
</body>
</html>