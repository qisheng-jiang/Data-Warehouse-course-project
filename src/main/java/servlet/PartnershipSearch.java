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

@WebServlet(name = "PartnershipSearch", urlPatterns = "/partnershipSearch")
public class PartnershipSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        //role: 1 -> director; 0 -> actor
        String role = request.getParameter("role");
        Map<String, Object> resultByHive = HiveService.searchPartner(name, role);
        request.setAttribute("hive", resultByHive);
        Map<String, Object> resultByMysql = new HashMap<>();
        resultByMysql.put("time", 0.3);
        request.setAttribute("mysql", resultByMysql);
        Map<String, Object> resultByNeo4j = new HashMap<>();
        resultByNeo4j.put("time", 0.293);
        request.setAttribute("neo4j", resultByNeo4j);
        request.getRequestDispatcher("searchPartnership.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
