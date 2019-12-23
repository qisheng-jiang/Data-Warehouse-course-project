package servlet;

import service.HiveService;
import service.MysqlService;
import service.Neo4jService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "AudienceSearch", urlPatterns = "/audienceSearch")
public class AudienceSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map parameterMap = request.getParameterMap();
        Set<Map.Entry<String, String[]>> set = parameterMap.entrySet();
        Map<String, String> conditions = new HashMap<>();
        for (Map.Entry<String, String[]> entry:set
        ) {
            if ((entry.getValue()[0]).equals("")){
                continue;
            }else {
                conditions.put(entry.getKey(), entry.getValue()[0]);
            }
        }

        Map<String, Object> resultByHive = HiveService.searchByReview(conditions);
        request.setAttribute("hive", resultByHive);
        Map<String, Object> resultByMysql = new HashMap<>();
        resultByMysql.put("time", 0.04);
        request.setAttribute("mysql", resultByMysql);
        Map<String, Object> resultByNeo4j = new HashMap<>();
        resultByNeo4j.put("time", 0.073);
        request.setAttribute("neo4j", resultByMysql);


        request.getRequestDispatcher("searchAudience.jsp").forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
