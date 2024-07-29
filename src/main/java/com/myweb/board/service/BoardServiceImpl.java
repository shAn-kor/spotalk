package com.myweb.board.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.myweb.board.model.BoardCheck;
import com.myweb.board.model.BoardDTO;
import com.myweb.board.model.BoardMapper;

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
	
	@Override
	public void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postId = (String) request.getAttribute("postId");
		if(postId == null) {
			postId = request.getParameter("postId");			
		}
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		BoardDTO dto = mapper.getPost(postId);
		
		sql.close();
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("post.board").forward(request, response);
	}


	@Override
    public void listPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = sqlSessionFactory.openSession(true);
        BoardMapper mapper = sql.getMapper(BoardMapper.class);
        
        // 페이지 번호를 파라미터에서 가져옵니다. 기본값은 1로 설정합니다.
        String pageParam = request.getParameter("page");
        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;

        int limit = 10;
        int offset = (page - 1) * limit;

        // Map에 페이징 정보 추가
        Map<String, Integer> params = new HashMap<>();
        params.put("limit", limit);
        params.put("offset", offset);

        List<BoardDTO> posts = mapper.getPosts((BoardCheck) params);

        int totalPosts = mapper.getTotalPosts();
        int totalPages = (int) Math.ceil(totalPosts / (double) limit);
        
        int pageRange = 5; // 페이지 버튼 개수
        int startPage = Math.max(1, (page - 1) / pageRange * pageRange + 1);
        int endPage = Math.min(startPage + pageRange - 1, totalPages);
        
        sql.close();

        request.setAttribute("posts", posts);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("board_main.jsp").forward(request, response);
    }

	@Override
	public void sortPosts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
        BoardMapper mapper = sql.getMapper(BoardMapper.class);
        
        String postId = (String) request.getAttribute("postId");
        
        BoardDTO dto = mapper.sortPosts(postId);
		
	}

	@Override
	public void listPostsByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = request.getParameter("category");
		String order = request.getParameter("order");
		/*
		 * String order = ""; if(order == null || order.isEmpty()) order = "최신순";
		 */
		/*
		 * else if(order.equals("인기순")) order =
		 * "(p.post_like - p.post_dislike + COALESCE(c.comment_count, 0))"; else
		 * if(order.equals("조회순")) order = "HIT";
		 */
		
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
        
        BoardCheck check = new BoardCheck(order, params);
        
        List<BoardDTO> posts = new ArrayList<>();
        if(category.equals("전체글")) {
        	posts = mapper.getPosts(check);
        } else if(category.equals("공지사항")) {
        	posts = mapper.getAnnPosts(check); 
        } else if(category.equals("축구")) {
        	posts = mapper.getSoccerPosts(check); 
		} else if(category.equals("야구")) {
        	posts = mapper.getBaseballPosts(check); 
		} else if(category.equals("농구")) {
        	posts = mapper.getBasketballPosts(check); 
		}

        int totalPosts = mapper.getTotalPosts();
        int totalPages = (int) Math.ceil(totalPosts / (double) limit);
        
        
        sql.close();
        
        request.setAttribute("category", category);
        request.setAttribute("posts", posts);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("boardMain.board").forward(request, response);
       
	}

	@Override
	public void commentWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
        BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
	}

	
	
	
}
