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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import util.mybatis.MybatisUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import static util.constant.JSONObjectUtil.getJSONSObjectByReader;

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

		sqlSessionFactory.openSession(true).close();
		
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
		UserDTO dto = getUserById(request.getParameter("id"));

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
		UserDTO dto = getUserById(id);

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

		sqlSessionFactory.openSession(true).close();
		
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
		Date bDate = Date.valueOf(dateStr);

		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.checkPhone(phone);

		sqlSessionFactory.openSession(true).close();
		
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
			dto.setBDate(bDate);
			dto.setPhone(phone);
			
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("joinForm.user").forward(request, response);
			
		}
	}

	@Override
	public void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String nick = request.getParameter("user-nick");
		String id = request.getParameter("user-id");
		String pw = request.getParameter("user-pw1");
		String pwq = request.getParameter("hint");
		String pwa = request.getParameter("hintAnswer");
		String dtoJSON = request.getParameter("dto");

		UserDTO dto = UserDTO.parseJSONToUserDTO(dtoJSON);
		dto.setNick(nick);
		dto.setId(id);
		dto.setPw(pw);
		dto.setPwq(pwq);
		dto.setPwa(pwa);
		dto.setPoint("500");
		dto.setGradeId("1");

		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		mapper.createUser(dto);

		sqlSessionFactory.openSession(true).close();

		response.sendRedirect("createSuccess.user");
	}

	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		UserDTO dto = getUserById(id);

		sqlSessionFactory.openSession(true).close();
		
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
				
				response.sendRedirect("../spotalk.do");
			}
		}
		
	}

	@Override
	public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String id = session.getAttribute("user_id").toString();
		String pw = request.getParameter("user-pw");

		UserDTO dto = getUserById(id);

		sqlSessionFactory.openSession(true).close();

		System.out.println(id);
		System.out.println(dto.toString());
		System.out.println(pw);

		if (dto.getPw().equals(pw)) {
			session.invalidate();
			deleteUser(id);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('계정 삭제 되었습니다.');");
			out.println("location.href='/spotalk/spotalk.do';");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("location.href='/spotalk/user/outMember.user';");
			out.println("</script>");
		}
	}

	@Override
	public void getMyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDTO dto = getUserById(request.getSession().getAttribute("user_id").toString());

		sqlSessionFactory.openSession(true).close();
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("mypage.jsp").forward(request, response);
	}

	@Override
	public void changeNick(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject json = null;
        try {
            json = getJSONSObjectByReader(request.getReader());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String nick = json.get("nick").toString();

		HttpSession session = request.getSession();
		String id = session.getAttribute("user_id").toString();
		UserDTO dto = getUserById(id);

		if(checkDuplicateNick(nick)) {
			SqlSession sql = sqlSessionFactory.openSession(true);
			UserMapper mapper = sql.getMapper(UserMapper.class);
			dto.setNick(nick);
			mapper.changeNick(dto);

			json.put("msg", "ok");
		} else {
			json.put("msg", "no");
		}

		sqlSessionFactory.openSession(true).close();

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
	}

	@Override
	public void getUserRankPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserDTO> list = getUserRank(request, response);

		sqlSessionFactory.openSession(true).close();

		request.setAttribute("list", list);
		request.getRequestDispatcher("userRank.jsp").forward(request, response);
	}

	@Override
	public List<UserDTO> getUserRank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		List<UserDTO> list = mapper.getUserList();
		return list;
	}

	@Override
	public void checkDuplicateNick(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject json = null;
        try {
            json = getJSONSObjectByReader(request.getReader());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String nick = json.get("nick").toString();

		if(checkDuplicateNick(nick)) {
			json.put("msg", "ok");
		} else {
			json.put("msg", "no");
		}

		sqlSessionFactory.openSession(true).close();

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
	}

	@Override
	public void checkDuplicateId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject json = null;
        try {
            json = getJSONSObjectByReader(request.getReader());
        }  catch (ParseException e) {
            throw new RuntimeException(e);
        }

		System.out.println(json.get("id").toString());

        if(getUserById(json.get("id").toString()) == null) {
			json.put("msg", "ok");
		} else {
			json.put("msg", "no");
		}

		sqlSessionFactory.openSession(true).close();

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
	}

	private boolean checkDuplicateNick(String nick) throws IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		UserDTO dto = mapper.getUserByNick(nick);

        return dto == null;
    }

	private UserDTO getUserById (String id) {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);

        return mapper.getUserById(id);
	}

	private void deleteUser (String id) {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		mapper.deleteUser(id);
	}

	@Override
	public void closeSqlSession() {
		sqlSessionFactory.openSession(true).close();
	}

	@Override
	public void updateGrade() {
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);

		List<UserDTO> list = mapper.getUserList();

		for (UserDTO dto : list) {
			long point = Long.parseLong(dto.getPoint());
			String grade = dto.getGradeId();

			if (point >= 1000000000) {
				dto.setGradeId("10");
			} else if (point >= 500000000) {
				dto.setGradeId("9");
			} else if (point >= 100000000) {
				dto.setGradeId("8");
			} else if (point >= 50000000) {
				dto.setGradeId("7");
			} else if (point >= 10000000) {
				dto.setGradeId("6");
			} else if (point >= 5000000) {
				dto.setGradeId("5");
			} else if (point >= 1000000) {
				dto.setGradeId("4");
			} else if (point >= 500000) {
				dto.setGradeId("3");
			} else if (point >= 100000) {
				dto.setGradeId("2");
			} else {
				dto.setGradeId("1");
			}
			dto.setGradeId(grade);

			mapper.updateGrade(dto);
		}
	}

	@Override
	public void checkAttendance(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject json = null;
		try {
			json = getJSONSObjectByReader(request.getReader());
		} catch (ParseException | IOException e) {
			throw new RuntimeException(e);
		}
		String nick = json.get("nick").toString();

		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);
		Date date = mapper.getDateByAttendance(nick);

		if (date == null) {
			date = new Date(0L);
		}

		LocalDateTime local = LocalDateTime.from(date.toLocalDate());

		LocalDateTime localDate = LocalDateTime.now();

		JSONObject jsonObject = new JSONObject();

		if (local.isBefore(localDate)) {
			jsonObject.put("msg", "ok");
			mapper.updateAttendanceDate(nick);
		}

		sql.close();

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toJSONString());
	}

    @Override
    public void inputBonusPoint(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject json = null;
		try {
			json = getJSONSObjectByReader(request.getReader());
		} catch (ParseException | IOException e) {
			throw new RuntimeException(e);
		}
		String nick = json.get("nick").toString();
		long point = Long.parseLong(json.get("point").toString());

		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper mapper = sql.getMapper(UserMapper.class);

		UserDTO dto = mapper.getUserByNick(nick);
		dto.setPoint(Long.toString(point + Long.parseLong(dto.getPoint())));

		mapper.setPoint(dto);

		sql.close();

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
	}
}
