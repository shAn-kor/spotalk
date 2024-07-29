package util.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({
        // user controller
        "/user/login.user",
        "/user/check.user",
        "/user/agree.user",
        "/user/auth.user",
        "/user/checkPhone.user",
        "/user/checkDuplicateNick.user",
        "/user/checkDuplicateId.user",
        "/user/joinForm.user",
        "/user/create.user",
        "/user/createSuccess.user",
        "/user/findIdPw_Id.user",
        "/user/findId.user",
        "/user/foundId.user",
        "/user/findIdPw_Pw.user",
        "/user/findPw.user",
        "/user/pwQnA.user",
        "/user/checkPwa.user",
        "/user/resetPw.user",
        "/user/updatePw.user"
})
public class IsLoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        if (session.getAttribute("user_id") != null) { // 로그인 되어있는 상태
            response.sendRedirect("../spotalk.do");

            return; // 조건에 부합하면 함수 종료를 해주어야 컨트롤러를 실행하지 않는다.
        }
        chain.doFilter(servletRequest, servletResponse);
    }
}
