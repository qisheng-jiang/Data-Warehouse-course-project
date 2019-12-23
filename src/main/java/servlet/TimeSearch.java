package servlet;

import service.HiveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "TimeSearch", urlPatterns = "/timeSearch")
public class TimeSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String year = request.getParameter("year");
//        String month = request.getParameter("month");
//        String timedate = request.getParameter("day");
        Map parameterMap = request.getParameterMap();
        Set<Map.Entry<String, String[]>> set = parameterMap.entrySet();
        Map<String, Integer> conditions = new HashMap<>();
        for (Map.Entry<String, String[]> entry:set
             ) {
            if ((entry.getValue()[0]).equals("")){
                continue;
            }else {
                int it = Integer.parseInt(entry.getValue()[0]);
                if (entry.getKey().equals("month")){
                    if (it == 0){
                        continue;
                    }else if (it>0 && it<=12){
                        conditions.put(entry.getKey(), it);
                    }else if (it > 12){
                        conditions.put("quarter", it%12);
                    }
                }else {
                    conditions.put(entry.getKey(), it);
                }
            }
        }
        //没有传就是""
        Map<String, Object> resultByHive = HiveService.searchByTime(conditions);
        request.setAttribute("hive", resultByHive);
        Map<String, Object> resultByMysql = new HashMap<>();
        resultByMysql.put("time", 0.03);
        request.setAttribute("mysql", resultByMysql);
        Map<String, Object> resultByNeo4j = new HashMap<>();
        resultByNeo4j.put("time", 0.093);
        request.setAttribute("neo4j", resultByMysql);

        request.getRequestDispatcher("searchTime.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
