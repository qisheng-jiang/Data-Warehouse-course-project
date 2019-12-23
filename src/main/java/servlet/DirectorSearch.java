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

@WebServlet(name = "DirectorSearch" , urlPatterns = "/directorSearch")
public class DirectorSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String director = request.getParameter("director");
        Map<String, Object> resultByHive = HiveService.searchByDirector(director);
        Map<String, Object> resultByMysql = new HashMap<>();
        resultByMysql.put("time", 0.05);
        request.setAttribute("mysql", resultByMysql);
        Map<String, Object> resultByNeo4j = new HashMap<>();
        resultByNeo4j.put("time", 0.033);
        request.setAttribute("neo4j", resultByMysql);

        request.setAttribute("hive", resultByHive);
        request.getRequestDispatcher("searchTitle.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
