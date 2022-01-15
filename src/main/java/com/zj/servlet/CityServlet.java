package com.zj.servlet;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author 1216916137
 */
@WebServlet("/CityServlet")
public class CityServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/xml;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        SAXReader reader = new SAXReader();
        InputStream inputStream=this.getClass().getResourceAsStream("/China.xml");
        Document doc = null;
        try {
            doc = reader.read(inputStream);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
       String province=req.getParameter("province");
        System.out.println(province);
        Element element=(Element)doc.selectNodes("//Province[@Name='"+province+"']");
        String xmlStr=element.asXML();

        resp.getWriter().print(xmlStr);
    }
}
