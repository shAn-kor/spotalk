package com.myweb.predict.service;

import com.myweb.predict.model.PredictDTO;
import com.myweb.predict.model.PredictMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.mybatis.MybatisUtil;

import java.io.IOException;
import java.util.List;


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
        sql.close();

        System.out.println(plusDTO.toString());
        System.out.println(minusDTO.toString());

        request.setAttribute("dto", dto);
        request.setAttribute("plusDTO", plusDTO);
        request.setAttribute("minusDTO", minusDTO);


        request.getRequestDispatcher("pointList.jsp").forward(request, response);
    }
}
