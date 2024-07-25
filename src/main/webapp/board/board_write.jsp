<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
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
<%@ include file="../include/footer.jsp"%>