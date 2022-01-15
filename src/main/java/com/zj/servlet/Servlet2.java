package com.zj.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 1216916137
 */
@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String xml="<students>"+
                "<student number='zj_1017'>"+
                "<name>张锦</name>"+
                "<age>20</age>"+
                "<sex>m</sex>"+
                "</student>"+
                "</students>";
        resp.setContentType("text/html;charset=utf-8");

        resp.getWriter().println(xml);
    }


}
