package servlet;

import service.HiveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CooperationSearch", urlPatterns = "/cooperationSearch")
public class CooperationSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actorName = request.getParameter("actorName");
        String cooperationName = request.getParameter("cooperationName");
        //role: 1 -> director; 0 -> actor
        String role = request.getParameter("role");
        Map<String, Object> resultByHive = HiveService.searchCooperation(actorName, cooperationName, role);
        request.setAttribute("hive", resultByHive);

        request.getRequestDispatcher("searchCooperationMovie.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
