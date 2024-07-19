<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_write</title>

  	<!-- 부트스트랩 css링크 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <!-- 제이쿼리(부스트랩보다 먼저 링크) -->
    <script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <!-- 부트스트랩 js링크 -->
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="../css/board_write.css" type="text/css">
    
</head>
<body>
   <div class="container">
        <div class="item">
            <h3>글 쓰기</h3>
            <form action="write.board" method="post">
            
	            <div class="dropdown category">
	                <button class="btn dropdown-toggle" type="button" data-toggle="dropdown">
	                    <p>카테고리를 선택해주세요.</p>
	                    <img src="../img/category.png" alt="카테고리">
	                </button>
	                <ul class="dropdown-menu">
	                  <li><a href="#">축구 <img src="../img/soccer-icon.png" alt="축구"></a></li>
	                  <li><a href="#">야구 <img src="../img/baseball-icon.png" alt="야구"></a></li>
	                  <li><a href="#">농구 <img src="../img/basketball-icon.png" alt="농구"></a></li>
	                </ul>
	                <input type="hidden" name="category" value="soccer">
	            </div>
	            <div class="title">
	                <input type="text" class="form-control" name="title" id="text-bar" placeholder="제목을 입력해주세요.">
	            </div>
	            <div class="content">
	              <textarea name="content" placeholder="내용을 입력해주세요."></textarea>
	            </div>
	            <div class="right">
	                <button type="button" class="btn">취소</button>
	                <input type="submit" class="btn" value="등록">
	            </div>
            </form>
        </div>
    </div>
</body>
</html>