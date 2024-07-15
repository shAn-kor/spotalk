package com.myweb.user.service;

import com.myweb.user.model.UserDTO;
import com.myweb.user.model.UserMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.mybatis.MybatisUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class UserServiceImpl implements UserService{
    private final SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
    @Override
    public void getUser() {
        System.out.println("service");
        SqlSession sql = sqlSessionFactory.openSession();  // 커넥션 객체
        UserMapper mapper = sql.getMapper(UserMapper.class); // 호출시킬 인터페이스명 작성
        List<UserDTO> list = mapper.getMember();
        System.out.println(list);
        for (UserDTO userDTO : list) {
            System.out.println(userDTO);
        }
        sqlSessionFactory.openSession(true).close();
    }
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
		
		if(id == null) {
			request.setAttribute("msg", "아이디를 찾을 수 없습니다.");
			request.getRequestDispatcher("findIdPw_Id.user").forward(request, response);
		} else {
			request.setAttribute("user_id",id);
			request.getRequestDispatcher("foundId.user").forward(request, response);
		}
		sql.close();
		
	}
	@Override
	public void findPw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.findPw(id);
		if(dto == null) {
			request.setAttribute("msg", "아이디가 존재하지 않습니다.");
			request.getRequestDispatcher("findIdPw_Pw.user").forward(request, response);			
		} else {
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("pwQnA.user").forward(request, response);;
		}
		sql.close();
	}
	@Override
	public void checkPwa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String answer = request.getParameter("answer");
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.findPw(id);
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
		
		HttpSession session = request.getSession();
		if(session != null) session.invalidate();
		
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('재설정 되었습니다.');");
        out.println("location.href='/spotalk/user/login/login.user';");
        out.println("</script>");
	}
	
}
