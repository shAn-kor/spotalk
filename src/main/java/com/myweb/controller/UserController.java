package com.myweb.controller;

import java.io.IOException;

import com.myweb.user.service.UserService;
import com.myweb.user.service.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("*.user")
public class UserController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public UserController() {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청분기
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI(); //ip, port번호 제외된 주소
		String path = request.getContextPath(); //프로젝트 식별 이름
		String command = uri.substring(path.length());
				
		System.out.println(command);
		

		//로그인
		if(command.equals("/user/login.user")) {//로그인 페이지
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		if(command.equals("/user/check.user")) {//로그인 페이지
			UserService service = new UserServiceImpl();
			service.login(request, response);
		}

		// 로그아웃
		if(command.equals("/user/logout.user")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/spotalk.do"); // 메인 화면으로
		}

		// 회원 탈퇴
		if(command.equals("/user/outMember.user")) {
			request.getRequestDispatcher("outMember.jsp").forward(request, response);
		}
		if(command.equals("/user/delete.user")) {
			UserService service = new UserServiceImpl();
			service.deleteUser(request, response);
		}
		
		//회원가입
		if(command.equals("/user/agree.user")) {//약관동의 페이지
			request.getRequestDispatcher("join01.jsp").forward(request, response);
		}
		if(command.equals("/user/auth.user")) {//본인인증 페이지
			request.getRequestDispatcher("join02.jsp").forward(request, response);
		}
		if(command.equals("/user/checkPhone.user")) {//본인인증 페이지
			UserService service = new UserServiceImpl();
			service.checkPhone(request, response);
		}
		if(command.equals("/user/checkDuplicateNick.user")) {//본인인증 페이지
			UserService service = new UserServiceImpl();
			service.checkDuplicateNick(request, response);
        }
		if(command.equals("/user/checkDuplicateId.user")) {//본인인증 페이지
			UserService service = new UserServiceImpl();
			service.checkDuplicateId(request, response);
        }
		if(command.equals("/user/joinForm.user")) {//계정생성 페이지
			request.getRequestDispatcher("join03.jsp").forward(request, response);
		}
		if(command.equals("/user/create.user")) { // 계정 생성
			UserService service = new UserServiceImpl();
			service.createUser(request, response);
		}
		if (command.equals("/user/createSuccess.user")) { // 계정 생성 성공
			request.getRequestDispatcher("join_success.jsp").forward(request, response);
		}
		
		//아이디 & 비밀번호 찾기
		if(command.equals("/user/findIdPw_Id.user")) {//아이디찾기 페이지
			request.getRequestDispatcher("findId01.jsp").forward(request, response);
		}
		if(command.equals("/user/findId.user")) {//아이디찾기
			UserService service = new UserServiceImpl();
			service.findId(request, response);
		}
		if(command.equals("/user/foundId.user")) {//아이디찾음 페이지
			request.getRequestDispatcher("findId02.jsp").forward(request, response);
		}
		if(command.equals("/user/findIdPw_Pw.user")) {//비밀번호찾기 페이지
			request.getRequestDispatcher("findPw01.jsp").forward(request, response);
		}
		if(command.equals("/user/findPw.user")) {//비밀번호찾기 페이지
			UserService service = new UserServiceImpl();
			service.findPw(request, response);
		}
		if(command.equals("/user/pwQnA.user")) {//비밀번호QnA 페이지
			request.getRequestDispatcher("findPw02.jsp").forward(request, response);
		}
		if(command.equals("/user/checkPwa.user")) {//비밀번호질문 답 확인
			UserService service = new UserServiceImpl();
			service.checkPwa(request, response);
		}
		if(command.equals("/user/resetPw.user")) {//비밀번호재설정 페이지
			request.getRequestDispatcher("findPw03.jsp").forward(request, response);
		}
		if(command.equals("/user/updatePw.user")) {//비밀번호재설정 페이지
			UserService service = new UserServiceImpl();
			service.updatePw(request, response);
		}

		// 마이페이지
		if(command.equals("/user/myPage.user")) {
			UserService service = new UserServiceImpl();
			service.getMyPage(request, response);
		}
		if(command.equals("/user/changeNick.user")) {
			UserService service = new UserServiceImpl();
			service.changeNick(request, response);
        }

		// 승부사 랭킹
		if (command.equals("/user/rank.user")) {
			UserService service = new UserServiceImpl();
			service.getUserRankPage(request, response);
		}

		// 출석부 확인
		if (command.equals("/checkIsAttendance.user")) {
			UserService service = new UserServiceImpl();
			service.checkAttendance(request, response);
		}
	}
	
}
