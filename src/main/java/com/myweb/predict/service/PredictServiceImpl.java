package com.myweb.predict.service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myweb.predict.model.PredictDTO;
import com.myweb.predict.model.PredictMapper;
import com.myweb.user.model.UserDTO;
import com.myweb.user.model.UserMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import util.mybatis.MybatisUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static util.constant.JSONObjectUtil.getJSONSObjectByReader;


public class PredictServiceImpl implements PredictService{
    private final SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

    @Override
    public void getPointList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = session.getAttribute("user_id").toString();

        SqlSession sql = sqlSessionFactory.openSession(true);
        PredictMapper mapper = sql.getMapper(PredictMapper.class);

        List<PredictDTO> dto = mapper.getPointList(id);
        List<PredictDTO> plusDTO = mapper.getPlusPointList(id);
        List<PredictDTO> minusDTO = mapper.getMinusPointList(id);

        System.out.println(plusDTO.toString());
        System.out.println(minusDTO.toString());

        request.setAttribute("dto", dto);
        request.setAttribute("plusDTO", plusDTO);
        request.setAttribute("minusDTO", minusDTO);

        sql.close();


        request.getRequestDispatcher("pointList.jsp").forward(request, response);
    }

    @Override
    public void betPoint(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject json = null;
        try {
            json = getJSONSObjectByReader(request.getReader());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        String id = (String) json.get("userId");
        long point = Long.parseLong ((String)json.get("userPoint"));
        String gameId = (String) json.get("gameId");
        long usingPoint = Long.parseLong ((String)json.get("usingPoint"));
        String choose = (String)json.get("choose");

        PredictDTO dto = new PredictDTO();
        dto.setGameId(gameId);
        dto.setUserId(id);
        dto.setBetPoint(usingPoint);
        dto.setChoice(choose);


        SqlSession sql = sqlSessionFactory.openSession(true);
        PredictMapper mapper = sql.getMapper(PredictMapper.class);
        int tempInsert = mapper.insertBatting(dto);
        System.out.println(tempInsert);

        if (tempInsert > 0) {
            UserDTO userDTO = new UserDTO();
            userDTO.setId(id);
            userDTO.setPoint(String.valueOf(point-usingPoint));

            UserMapper mapperUser = sql.getMapper(UserMapper.class);
            mapperUser.setPoint(userDTO);

            HttpSession session = request.getSession();
            session.setAttribute("point", userDTO.getPoint());

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("ok", "ajax input ok");

            System.out.println(jsonObject.toString());

            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(jsonObject.toJSONString());
        }
        sql.close();
    }

    public void closeGameSqlSession() {
        sqlSessionFactory.openSession(true).close();
    }

    @Override
    public void getPredictStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject json = null;
        try {
            json = getJSONSObjectByReader(request.getReader());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        String gameId = (String) json.get("gameId");

        SqlSession sql = sqlSessionFactory.openSession(true);
        PredictMapper mapper = sql.getMapper(PredictMapper.class);

        List<PredictDTO> list = mapper.getTeamChoice(gameId);
        Map<String, Integer> map = new HashMap<>();

        System.out.println(list);

        for (PredictDTO dto : list) {
            if (map.containsKey(dto.getChoice())) {
                map.put(dto.getChoice(), map.get(dto.getChoice()) + 1);
            } else {
                map.put(dto.getChoice(), 1);
            }
        }

        JSONObject jsonObject = new JSONObject(map);

        System.out.println(jsonObject);

        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(jsonObject.toJSONString());

        sql.close();
    }

}
