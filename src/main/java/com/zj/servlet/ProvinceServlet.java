package com.zj.servlet;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @author 1216916137
 */
@WebServlet("/ProvinceServlet")
public class ProvinceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        SAXReader reader = new SAXReader();
        InputStream inputStream=this.getClass().getResourceAsStream("/China.xml");
        Document doc = null;
        try {
            doc = reader.read(inputStream);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        List<Attribute> arrList=doc.selectNodes("//Province/@Name");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < arrList.size(); i++) {
            sb.append(arrList.get(i).getValue());
            if(i<arrList.size() - 1){
                sb.append(",");
            }
        }
        resp.getWriter().print(sb);
    }
}
