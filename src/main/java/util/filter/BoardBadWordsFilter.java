package util.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.constant.BadWords;

import java.io.IOException;
import java.io.PrintWriter;

import static util.constant.BadWords.BADWORDS;
import static util.utils.CheckBadWords.isBadWord;

@WebFilter ({
        "/board/postWrite.board"
})
public class BoardBadWordsFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String postTitle = request.getParameter("post_title");
        String postContent = request.getParameter("post_content");


        if (isBadWord(postTitle.split(" ")) || isBadWord(postContent.split(" "))) {
            response.setContentType("text/html;charset=utf-8;");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('욕설은 삼가해주세요.');");
            out.println("location.href = '" + request.getContextPath() + "/board/boardWrite.board';");
            out.println("</script>");

            return;
        }

        chain.doFilter(req, res);
    }
}
