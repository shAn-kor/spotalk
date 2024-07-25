<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="container">
        <div class="item item1">
            <p>커뮤니티 / <a href="#">${dto.getCategory() }</a></p>
        </div>

        <div class="item item2">
            <div class="top">
                <div class="left">
                    <img src="../img/profile32.png" alt="프로필">
                </div>
                <div class="right">
                    <a href="#">작성자</a>
                    <div class="hits">
                        <span>작성시간</span>
                        <img src="../img/eye.png" alt="조회수">
                        <span>${dto.getHit()}</span>
                    </div>
                </div>
            </div>

            <div class="title">
                <h3>${dto.getPostTitle() }</h3>
            </div>
            <div class="content">
            	${dto.getPostContent() }
            </div>
            <div class="bottom">
                <div class="right">
                	<button type="button" class="up"></button>
                    <span>${dto.getPostLike() }</span>
                    <button type="button" class="down"></button>
                    <span>${dto.getPostDislike() }</span>
                </div>
            </div>
        </div>

		<form action="commentWrite.board" method="post">
        	<div class="item item3">
        	
	            <div class="comments">
	                <strong><span>8</span>개의 댓글</strong>
	            </div>
	            <div class="box">
	                <div class="top">
	                    <div class="left">
	                        <img src="../img/profile32.png" alt="프로필">
	                    </div>
	                   <div class="right">
	                   
	                     <!--    <img src="../img/question.png" alt="물음표">
	                         댓글을 쓰려면
	                         <a href="#">로그인</a>
	                         이 필요합니다. -->
	                         <textarea name="comment_content" placeholder="댓글을 입력해주세요."></textarea>
	                          
						<%--     <% 
					            Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
					            
					            if (isLoggedIn != null && isLoggedIn) {
					        %>
					            <textarea name="comment_content" placeholder="댓글을 입력해주세요."></textarea>
					        <% 
					            } else {
					        %>
					            <img src="../img/question.png" alt="물음표">
					            댓글을 쓰려면
					            <a href="login.jsp">로그인</a>
					            이 필요합니다.
					        <% 
					            }
					        %> --%>
	                    </div>
	
	                </div>
	                <div class="bottom">
	                	<input type="submit" class="btn" value="댓글 작성">
	                </div>
	            </div>
        	</div>
        

 
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#"></a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
               ${dto.getCommentContent() }
            </div>
        </div>
        
        
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        
        </form>
        
        
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        <div class="item item4">
            <div class="box">
                <div class="top">
                    <div class="left">
                        <img src="../img/profile32.png" alt="프로필">
                    </div>
                    <div class="right">
                        <a href="#">작성자</a>
                        <div class="hits">
                            <span>작성시간</span>
                            <img src="../img/eye.png" alt="조회수">
                            <span>1.5k</span>
                        </div>
                    </div>
                </div>
    
                <div class="bottom">
                    <div class="right">
                      	<button type="button" class="up"></button>
                    	<span>5</span>
                    	<button type="button" class="down"></button>
                    	<span>3</span>
                    </div>
                </div>
            </div>

            <div class="comments">
                댓글 내용 ~~~~~~ 😊<br>
                댓글 내용 ~~~~~~ 😊<br>
            </div>
        </div>
        
        
        <div class="comments-page">
            <ul class="pager">
                <li class="previous"><a href="#">Previous</a></li>  
                <button type="button"><a href="#">1</a></button>
                <button type="button"><a href="#">2</a></button>
                <button type="button"><a href="#">3</a></button>
                <button type="button"><a href="#">4</a></button>
                <button type="button"><a href="#">5</a></button>
                <p>...</p>
                <button type="button"><a href="#">5768</a></button>
                <li class="next"><a href="#">Next</a></li>
            </ul>
        </div>

       
    </div>
<%@ include file="../include/footer.jsp"%>