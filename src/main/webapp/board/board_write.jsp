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
            <form action="postWrite.board" method="post">
  				<div class="category">
               		<select class="form-control" id="categorySelect" name="category">
                    	<option value="">카테고리를 선택해주세요.</option>
                    	<option value="축구">축구</option>
                    	<option value="야구">야구</option>
                    	<option value="농구">농구</option>
                	</select>
            	</div>
	            <div class="title">
	                <input type="text" class="form-control" name="post_title" id="text-bar" placeholder="제목을 입력해주세요.">
	            </div>
	            <div class="content">
	              <textarea name="post_content" placeholder="내용을 입력해주세요."></textarea>
	            </div>
	            <div class="right">
	                <input type="submit" class="btn" value="취소">
	                <input type="submit" class="btn" value="등록">
	            </div>
            </form>
        </div>
    </div>
</body>
</html>