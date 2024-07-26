package util.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebFilter({
        // user controller
        "/user/myPage.user",
        "/user/changeNick.user",
        "/user/updatePw.user",
        "/user/logout.user",
        "/user/outMember.user",
        "/user/delete.user",

        // board controller
        "/board/boardWrite.board",
        "/board/postWrite.board",
        "/board/commentWrite.board",

        // game controller
        "/game/soccerlist.game",
        "/game/baselist.game",

        // predict controller
        "/predict/pointList.predict"
})
public class AuthenticationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        if (session.getAttribute("user_id") == null) { // 로그인 안됨
            response.setContentType("text/html;charset=utf-8;");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인을 해야 합니다.');");
            out.println("location.href = '" + request.getContextPath() + "/user/login.user';");
            out.println("</script>");

            return; // 조건에 부합하면 함수 종료를 해주어야 컨트롤러를 실행하지 않는다.
        }
        chain.doFilter(servletRequest, servletResponse);
    }
}
