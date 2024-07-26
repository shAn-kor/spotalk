<%@ page import="com.myweb.user.model.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%
    UserDTO dto = (UserDTO) request.getAttribute("dto");
%>
<script src="${pageContext.request.contextPath}/js/join.js"></script>
<div class="join-wrap">
    <div class=white-background></div>
    <div class="join-box">
        <p>
            <a href="agree.user" class="agree_link" style="color: #777">약관 동의</a> 
            <span style="color: #777"> > </span> 
            <a href="auth.user" class="auth_link" style="color: #777">본인인증</a>
            <span style="color: #777"> > </span> 
            <a href="join.user" class="join_link">계정 생성</a>
        </p>
        <div class="join_wrap">
            <h3 class="join_title">입력해주세요.</h3>
            <form class="join_form" action="create.user" name="myForm" method="post">
                <div class="join-nick">
                    <input type="text" name="user-nick" id="user-nick" placeholder="닉네임" required>
                    <a href="#" id="check-nick">중복확인</a>
                </div>
                <div class="join-id">
                    <input type="text" name="user-id" id="user-id" placeholder="아이디" required>
                    <a href="#" id="check-id">중복확인</a>
                </div>
                <div class="join-pw">
                    <input type="password" name="user-pw1" id="user-pw1" placeholder="비밀번호" required>
                </div>
                <div class="join-pwchk">
                    <input type="password" name="user-pw2" id="user-pw2" placeholder="비밀번호 재확인" required>
                </div>
                <div class="join-pw-hint">
                    <select name="hint" id="pw-hint">
                        <option value="">비밀번호 찾기 질문</option>
                        <option value="element">1. 내가 나온 초등학교는?</option>
                        <option value="bestFriend">2. 제일 친한 친구 이름은?</option>
                        <option value="nickname">3. 어릴 적 별명은?</option>
                        <option value="celeb">4. 내가 닮은 연예인은?</option>
                        <option value="food">5. 내가 제일 좋아하는 음식은?</option>
                    </select>
                </div>
                <div class="join-pw-hint-answer">
                    <input type="text" name="hintAnswer" id="hint-answer" placeholder="답">
                </div>
                <input type="hidden" id="dto" name="dto" value="<%=dto.toJSONString()%>">
                <input type="submit" name="join-submit" id="join-submit" value="가입하기">
            </form>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp"%>