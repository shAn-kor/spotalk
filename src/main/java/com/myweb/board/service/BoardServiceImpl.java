package com.myweb.board.service;

import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.myweb.board.model.BoardCheck;
import com.myweb.board.model.BoardDTO;
import com.myweb.board.model.BoardMapper;
import com.myweb.board.model.LikeDislikeRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.mybatis.MybatisUtil;

public class BoardServiceImpl implements BoardService {

	private final SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	@Override
	public void postWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("user_id");
		String category = request.getParameter("category");
		String postTitle = request.getParameter("post_title");
		String postContent = request.getParameter("post_content");
		String gradeId = (String) session.getAttribute("grade_id");
		
		
		System.out.println(userId);
		System.out.println(category);
		System.out.println(postTitle);
		System.out.println(postContent);
		System.out.println(gradeId);
		
		BoardDTO dto = new BoardDTO();
		dto.setUserId(userId);
		dto.setCategory(category);
		dto.setPostTitle(postTitle);
		dto.setPostContent(postContent);
		dto.setGradeId(gradeId);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		mapper.insertPost(dto);
		String postId = mapper.getPostId(userId);
		
		
		sql.close();
		
		request.setAttribute("postId", postId);
		request.getRequestDispatcher("getPost.board").forward(request, response);
		
	}
	
	
	private static final int SESSION_MAX_AGE = 180;
	
	@Override
	public void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postId = (String) request.getAttribute("postId");
		String a = request.getParameter("a");
		if(a == null || a.isEmpty()) a = "0";
		if(postId == null) {
			postId = request.getParameter("postId");			
		}
		
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		BoardDTO dto = mapper.getPost(postId);
		List<BoardDTO> comments = mapper.getComments(postId); // 댓글 목록 조회 메서드 추가
		
		if (shouldIncreaseHit(request.getSession(), postId)) {
	            mapper.increaseHit(postId);
	        }
		
		sql.close();
		
		request.setAttribute("dto", dto);
		request.setAttribute("comments", comments);
		request.setAttribute("postId", postId);
		if (a.equals("1")) {
			request.getRequestDispatcher("modifyPost.board").forward(request, response);
		} else {
			request.getRequestDispatcher("post.board").forward(request, response);
		}
	}


	private boolean shouldIncreaseHit(HttpSession session, String postId) {
	    Long lastVisit = (Long) session.getAttribute("postHit_" + postId);
        long currentTime = Instant.now().getEpochSecond();

        if (lastVisit != null && currentTime - lastVisit < SESSION_MAX_AGE) {
            return false; // 조회수 증가 조건 미충족
        }

        // 세션에 새로 저장
        session.setAttribute("postHit_" + postId, currentTime);
        return true; // 조회수 증가 조건 충족
    }
	


	@Override
    public List<BoardDTO> homePosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = sqlSessionFactory.openSession(true);
        BoardMapper mapper = sql.getMapper(BoardMapper.class);
        List<BoardDTO> homePosts = mapper.getHomePosts();
        sql.close();
		return homePosts;
    }



	@Override
	public void listPostsByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = request.getParameter("category");
		if(category == null || category.isEmpty()) category = (String) request.getAttribute("category");
		String order = request.getParameter("order");
		
        SqlSession sql = sqlSessionFactory.openSession(true);
        BoardMapper mapper = sql.getMapper(BoardMapper.class);
        
        // 페이지 번호를 파라미터에서 가져옵니다. 기본값은 1로 설정합니다.
        String pageParam = request.getParameter("page");
        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;

        int limit = 10;
        int offset = (page - 1) * limit + 1 ;

        // Map에 페이징 정보 추가
        Map<String, Integer> params = new HashMap<>();
        params.put("limit", limit);
        params.put("offset", offset);
        
        System.out.println(params);
        
        BoardCheck check = new BoardCheck(order, params, pageParam);
        
        List<BoardDTO> posts = new ArrayList<>();
        if(category.equals("전체글")) {
        	posts = mapper.getPosts(check);
        } else if(category.equals("공지")) {
        	posts = mapper.getAnnPosts(check); 
        } else if(category.equals("축구")) {
        	posts = mapper.getSoccerPosts(check); 
		} else if(category.equals("야구")) {
        	posts = mapper.getBaseballPosts(check); 
		} else if(category.equals("농구")) {
        	posts = mapper.getBasketballPosts(check); 
		}

        int totalPosts = mapper.getTotalPosts(category);
        int totalPages = (int) Math.ceil(totalPosts / (double) limit);


        
        sql.close();
        
        request.setAttribute("category", category);
        request.setAttribute("posts", posts);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("boardMain.board").forward(request, response);
       
	}

	@Override
	public void commentWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    
	    String userId = (String) session.getAttribute("user_id");
	    String postId = request.getParameter("postId");
	    String commentContent = request.getParameter("comment_content");
	    
	    
	    BoardDTO dto = new BoardDTO();
	    dto.setUserId(userId);
	    dto.setPostId(postId);
	    dto.setCommentContent(commentContent);
	    
	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);
	    
	    mapper.insertComment(dto);
	    
	    sql.close();
	    
	 // 댓글 작성 후 게시글 상세 페이지로 포워딩
	    request.setAttribute("postId", postId);
	    request.getRequestDispatcher("getPost.board?postId=" + postId).forward(request, response);;
	}

	
	
	@Override
	public void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    String gradeId = (String) session.getAttribute("grade_id");
	    String postId = request.getParameter("postId");
	    String postTitle = request.getParameter("postTitle");
	    String postContent = request.getParameter("postContent");

	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);

	    // 게시글 정보를 가져와 작성자와 비교
	    BoardDTO existingPost = mapper.getPost(postId);
	    if (!userId.equals(existingPost.getUserId()) && !"admin".equals(userId)) {
	        // 작성자가 아니거나 admin이 아닌 경우
	        sql.close();
	        response.sendError(HttpServletResponse.SC_FORBIDDEN, "권한이 없습니다.");
	        return;
	    }

	    BoardDTO dto = new BoardDTO();
	    dto.setPostId(postId);
	    dto.setUserId(userId);
	    dto.setPostTitle(postTitle);
	    dto.setPostContent(postContent);
	    dto.setGradeId(gradeId);

	    mapper.updatePost(dto);
	    sql.close();
	    request.getRequestDispatcher("getPost.board?postId=" + postId).forward(request, response);
	}


	@Override
	public void deletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    String gradeId = (String) session.getAttribute("grade_id");
	    String postId = request.getParameter("postId");

	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);

	    // 게시글 정보를 가져와 작성자와 비교
	    BoardDTO existingPost = mapper.getPost(postId);
	    boolean isAdmin = "admin".equals(userId);
	    //String isAdminStr = isAdmin ? "true" : "false";
	    if (!userId.equals(existingPost.getUserId()) && !isAdmin) {
	        // 작성자가 아니고 admin도 아닌 경우
	        sql.close();
	        response.sendError(HttpServletResponse.SC_FORBIDDEN, "권한이 없습니다.");
	        return;
	    }

	    Map<String, Object> params = new HashMap<>();
	    params.put("postId", postId);
	    params.put("userId", 	userId);
	    params.put("isAdmin", isAdmin ? "true" : "false");

	    mapper.deletePost(params);
	    sql.close();
	    request.setAttribute("category", "전체글");
	    request.getRequestDispatcher("category.board").forward(request, response);
	}


	@Override
	public void updateComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    String commentId = request.getParameter("commentId");
	    String commentContent = request.getParameter("commentContent");
	    String postId = request.getParameter("postId");

	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);

	    // 댓글 정보를 가져와 작성자와 비교
	    BoardDTO existingComment = mapper.updateComment(commentId);
	    if (!userId.equals(existingComment.getUserId()) && !"admin".equals(existingComment.getUserId())) {
	        // 작성자가 아니거나 admin이 아닌 경우
	        sql.close();
	        response.sendError(HttpServletResponse.SC_FORBIDDEN, "권한이 없습니다.");
	        return;
	    }

	    BoardDTO dto = new BoardDTO();
	    dto.setCommentId(commentId);
	    dto.setUserId(userId);
	    dto.setCommentContent(commentContent);

	    mapper.updateComment(dto);
	    sql.close();
	    response.sendRedirect("getPost.board?postId=" + postId);
	}



	@Override
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    String commentId = request.getParameter("commentId");
	    String postId = request.getParameter("postId");

	    String gradeId = (String) session.getAttribute("grade_id");
	    boolean isAdmin = "admin".equals(userId);

	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);

	    // 댓글 정보를 가져와 작성자와 비교
	    BoardDTO existingComment = mapper.getComment(commentId);
	    if (!userId.equals(existingComment.getUserId()) && !isAdmin) {
	        // 작성자가 아니고 admin도 아닌 경우
	        sql.close();
	        response.sendError(HttpServletResponse.SC_FORBIDDEN, "권한이 없습니다.");
	        return;
	    }

	    Map<String, Object> params = new HashMap<>();
	    params.put("commentId", commentId);
	    params.put("userId", userId);
	    params.put("isAdmin", isAdmin ? "true" : "false");

	    mapper.deleteComment(params);
	    sql.close();
	    response.sendRedirect("getPost.board?postId=" + postId);
	}

	
	@Override
	public void searchPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);

	    String searchTerm = request.getParameter("searchTerm");
	    String pageParam = request.getParameter("page");
	    int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;

	    int limit = 10;
	    int offset = (page - 1) * limit + 1;

	    Map<String, Object> params = new HashMap<>();
	    params.put("limit", limit);
	    params.put("offset", offset);
	    params.put("searchTerm", searchTerm);
	    params.put("order", "최신순"); // 기본 정렬 기준

	    List<BoardDTO> posts = mapper.searchPosts(params);

	    int totalPosts = mapper.getTotalPosts("전체글"); // 전체 게시글 수를 가져오는 메서드 필요
	    int totalPages = (int) Math.ceil(totalPosts / (double) limit);

	    int pageRange = 5; // 페이지 버튼 개수
	    int startPage = Math.max(1, (page - 1) / pageRange * pageRange + 1);
	    int endPage = Math.min(startPage + pageRange - 1, totalPages);

	    sql.close();

	    request.setAttribute("posts", posts);
	    request.setAttribute("searchTerm", searchTerm);
	    request.setAttribute("totalPages", totalPages);
	    request.setAttribute("currentPage", page);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.getRequestDispatcher("search_result.jsp").forward(request, response);
	}

	@Override
	public void likePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String postId = request.getParameter("postId");
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    
	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("postId", postId);
	    
	    if (mapper.hasUserVotedOnPost(params) == 0) {
	        mapper.increasePostLike(params);
	        mapper.insertPostLikeDislike(new LikeDislikeRecord(userId, postId, "Y"));
	    }
	    
	    sql.close();
	    response.sendRedirect("getPost.board?postId=" + postId);
	}

	@Override
	public void dislikePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String postId = request.getParameter("postId");
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    
	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("postId", postId);
	    
	    if (mapper.hasUserVotedOnPost(params) == 0) {
	        mapper.increasePostDislike(params);
	        mapper.insertPostLikeDislike(new LikeDislikeRecord(userId, postId, "N"));
	    }
	    
	    sql.close();
	    response.sendRedirect("getPost.board?postId=" + postId);
	}

	@Override
	public void likeComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String commentId = request.getParameter("commentId");
	    String postId = request.getParameter("postId");
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    
	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("commentId", commentId);
	    
	    if (mapper.hasUserVotedOnComment(params) == 0) {
	        mapper.increaseCommentLike(params);
	        mapper.insertCommentLikeDislike(new LikeDislikeRecord(userId, commentId, "Y"));
	    }
	    
	    sql.close();
	    response.sendRedirect("getPost.board?postId=" + postId);
	}

	@Override
	public void dislikeComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String commentId = request.getParameter("commentId");
	    String postId = request.getParameter("postId");
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");
	    
	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("commentId", commentId);
	    
	    if (mapper.hasUserVotedOnComment(params) == 0) {
	        mapper.increaseCommentDislike(params);
	        mapper.insertCommentLikeDislike(new LikeDislikeRecord(userId, commentId, "N"));
	    }
	    
	    sql.close();
	    response.sendRedirect("getPost.board?postId=" + postId);
	}


		

	
	    
}