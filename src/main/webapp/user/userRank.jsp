
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    long num = 1;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOTALK</title>
    <link rel="stylesheet" href="../css/userlank.css">
</head>
<body>
    
    <div class="main">
        <div class="menu">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">승부예측</a></li>
                <li><a href="#">승부사랭킹</a></li>
            </ul>
        </div>

        <div class="wrap">

            <div class="boxtitle">
                <p>순위</p>
                <p>등급</p>
                <p>닉네임</p>
                <p>포인트</p>
            </div>

            <div class="box">

                <div class="content">
                    <c:forEach var="dto" items="${list}">
                        <p><%=num++%></p>
                        <div class="user">
                            <input type="text" name="grade" value="${dto.gradeId}" disabled>
                            <input type="text" name="nick" value="${dto.nick}" disabled>
                            <input type="number" name="point" value="${dto.point}" disabled>
                        </div>
                    </c:forEach>
                </div>
            </div>
    
            <div class="page">

                <a href="#" class="first-page">처음</a>
                <a href="#" class="pre-page">◀</a>
                <a href="#" class="num-on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="next-page">▶</a>
                <a href="#" class="last-page">마지막</a>

            </div>
        </div>
        
    </div>

</body>
</html>