<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/modify.js"></script>

        <div class="wrap">
            <table class="myPage-box">

                <tr>
                    <td>이 름</td>
                    <td><input type="text" name="name" value="${dto.name}" disabled></td>
                </tr>
                <tr>
                    <td>아 이 디</td>
                    <td><input class="id" id="user-id" type="text" name="id" value="${dto.id}" disabled></td>
                </tr>
                <tr>
                    <td>비 밀 번 호</td>
                    <td><input type="password" name="pw" value="${dto.pw}" disabled></td>
                </tr>
                <tr>
                    <td>닉 네 임</td>
                    <td><input type="text" name="nick" value="${dto.nick}" id="nick"></td>
                    <td><button type="button" class="btn-default change-nick">수정</button></td>
                </tr>
                <tr>
                    <td>회 원 등 급</td>
                    <td>
                        <input class="grade" type="text" name="grade" value="${dto.gradeId}" style="width: 90px;" disabled>
                        <img src="../img/iron.png" class="grade1" alt="회원등급">
                        <img src="../img/AllGrade.jpg" class="allgrade" alt="모든등급">
                    </td>
                </tr>
                <tr>
                    <td>포 인 트</td>
                    <td><input class="point" type="number" name="point" value="${dto.point}" disabled></td>
                </tr>

            </table>
            <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/predict/pointList.predict';">포인트 내역</button>
            <button type="button" class="btn" onclick="location.href='outMember.user';">회원탈퇴</button>
        </div>
    </div>
<%@include file="../include/footer.jsp"%>