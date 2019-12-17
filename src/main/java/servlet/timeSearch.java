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

@WebServlet(name = "timeSearch", urlPatterns = "/timeSearch")
public class timeSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String timedate = request.getParameter("day");
        Map parameterMap = request.getParameterMap();
        Set<Map.Entry> set = parameterMap.entrySet();
        Map<String, Integer> conditions = new HashMap<>();
        for (Map.Entry entry:set
             ) {
            if (entry.getValue().equals("")){
                continue;
            }else {
                int it = Integer.parseInt((String)entry.getValue());
                if (entry.getKey().equals("month")){
                    if (it == 0){
                        continue;
                    }else if (it>0 && it<=12){
                        conditions.put((String)entry.getKey(), it);
                    }else if (it > 12){
                        conditions.put("quarter", it%12);
                    }
                }else {
                    conditions.put((String)entry.getKey(), it);
                }
            }
        }
        //没有传就是""
        Map<String, Object> resultByHive = HiveService.searchByTime(conditions);
        request.setAttribute("hive", resultByHive);

        request.getRequestDispatcher("searchTime.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
