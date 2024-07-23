package com.myweb.user.service;

import com.myweb.user.model.UserDTO;
import com.myweb.user.model.UserMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.mybatis.MybatisUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

public class UserServiceImpl implements UserService{
    private final SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
    
    @Override
	public void findId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		UserDTO dto = new UserDTO();
		dto.setName(name);
		dto.setPhone(phone);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		String id = mapper.findId(dto);
		sql.close();
		
		if(id == null) {
			request.setAttribute("msg", "아이디를 찾을 수 없습니다.");
			request.getRequestDispatcher("findIdPw_Id.user").forward(request, response);
		} else {
			request.setAttribute("user_id",id);
			request.getRequestDispatcher("foundId.user").forward(request, response);
		}
		
	}
	@Override
	public void findPw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.getUserById(id);
		sql.close();
		if(dto == null) {
			request.setAttribute("msg", "아이디가 존재하지 않습니다.");
			request.getRequestDispatcher("findIdPw_Pw.user").forward(request, response);			
		} else {
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("pwQnA.user").forward(request, response);;
		}
	}
	@Override
	public void checkPwa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String answer = request.getParameter("answer");
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.getUserById(id);
		sql.close();
		if(!dto.getPwa().equals(answer)) {
			request.setAttribute("dto", dto);
			request.setAttribute("msg", "답이 일치하지 않습니다.");
			request.getRequestDispatcher("pwQnA.user").forward(request, response);
		} else {
			request.setAttribute("id", id);
			request.getRequestDispatcher("resetPw.user").forward(request, response);
		}
	}
	@Override
	public void updatePw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		mapper.updatePw(dto);
		sql.close();
		HttpSession session = request.getSession();
		if(session != null) session.invalidate();
		
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('재설정 되었습니다.');");
        out.println("location.href='/spotalk/user/login.user';");
        out.println("</script>");
	}
	@Override
	public void checkPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String phone = request.getParameter("phone");
		          
		String dateStr = year + "-" + month + "-" + day;         
		Date b_date = Date.valueOf(dateStr);         

		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.checkPhone(phone);
		sql.close();
		
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
		if(dto != null) {
			out.println("<script>");
	        out.println("alert('이미 존재하는 회원입니다.');");
	        out.println("var confirmflag = confirm('아이디찾기로 이동하시겠습니까?')");
	        out.println("if(confirmflag) location.href='/spotalk/user/findIdPw/findIdPw_Id.user';");
	        out.println("else location.href='/spotalk/user/auth.user';");
	        out.println("</script>");
		} else {
			dto = new UserDTO();
			dto.setName(name);
			dto.setGender(gender);
			dto.setBDate(b_date);
			dto.setPhone(phone);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("joinForm.user").forward(request, response);
			
		}
	}
	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.getUserById(id);
		sql.close();
		
		if(dto == null) {
			request.setAttribute("msg", "아이디가 존재하지 않습니다.");
			request.getRequestDispatcher("login.user").forward(request, response);
		} else {
			if(!pw.equals(dto.getPw())) {
				request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
				request.getRequestDispatcher("login.user").forward(request, response);
			} else { //로그인 성공
				HttpSession session = request.getSession();
				session.setAttribute("user_id", id);
				session.setAttribute("user_nick", dto.getNick());
				session.setAttribute("grade_id", dto.getGradeId());
				session.setAttribute("point", dto.getPoint());
				
				response.sendRedirect("../index.jsp");
			}
		}
		
	}

	@Override
	public void getMyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.getUserById(request.getSession().getAttribute("user_id").toString());
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("mypage.jsp").forward(request, response);
	}

	@Override
	public void getUserRank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		List<UserDTO> list = mapper.getUserList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("userRank.jsp").forward(request, response);
	}

	@Override
	public void checkDuplicateNick(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.getUserByNick(request.getParameter("nick"));

		System.out.println(request.getParameter("nick"));

		String msg = "";
		if(dto == null) {
			msg = "ok";
		} else {
			msg = "no";
		}

		response.setContentType("text/text");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(msg);
	}

	@Override
	public void checkDuplicateId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.getUserById(request.getParameter("user_id"));

		String msg = "";
		if(dto == null) {
			msg = "ok";
		} else {
			msg = "no";
		}

		response.setContentType("text/text");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(msg);
	}

}
