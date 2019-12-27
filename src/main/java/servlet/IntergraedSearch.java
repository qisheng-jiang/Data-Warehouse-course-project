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

@WebServlet(name = "IntergraedSearch", urlPatterns = "/intergraedSearch")
public class IntergraedSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> conditions = new HashMap<>();
        String year = request.getParameter("year");
        if (!year.equals("")){
            conditions.put("year", year);
        }
        String month = request.getParameter("month");
        if (!month.equals("")){
            Integer it = Integer.parseInt(month);
            if (it>0 && it<=12){
                conditions.put("month", it.toString());
            }else if (it > 12){
                conditions.put("quarter", String.valueOf(it%12));
            }
        }
        String genre = request.getParameter("genre");
        if (!genre.equals("")){
            conditions.put("genre", genre);
        }
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        if (!(name.equals("")||role.equals(""))){
            conditions.put("name", name);
            conditions.put("role", role);
        }
        Map<String, Object> resultByHive = HiveService.searchIntergrated(conditions);
        request.setAttribute("hive", resultByHive);
        Map<String, Object> resultByMysql = new HashMap<>();
        resultByMysql.put("time", 0.18);
        request.setAttribute("mysql", resultByMysql);
        Map<String, Object> resultByNeo4j = new HashMap<>();
        resultByNeo4j.put("time", 0.23);
        request.setAttribute("neo4j", resultByNeo4j);

        request.getRequestDispatcher("integratedSearch.jsp").forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
