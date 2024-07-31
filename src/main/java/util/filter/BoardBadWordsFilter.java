package util.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import util.constant.BadWords;

import java.io.IOException;
import java.io.PrintWriter;

import static util.constant.BadWords.BADWORDS;
import static util.constant.JSONObjectUtil.getJSONSObjectByReader;
import static util.utils.CheckBadWords.isBadWord;

@WebFilter ({
        "/board/checkBadWords.board"
})
public class BoardBadWordsFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        
        JSONObject jsonObject = null;
        try {
            jsonObject = getJSONSObjectByReader(request.getReader());
        } catch (ParseException | IOException e) {
            throw new RuntimeException(e);
        }

        String title = jsonObject.get("title").toString();
        String content = jsonObject.get("content").toString();


        JSONObject json = new JSONObject();
        if (isBadWord(title.split(" ")) || isBadWord(content.split(" "))) {
            json.put("boardMsg", "no");
        } else {
            json.put("boardMsg", "ok");
        }
        response.setContentType("application/json;charset=utf-8;");
        PrintWriter out = response.getWriter();
        out.println(json);


        chain.doFilter(req, res);
    }
}
