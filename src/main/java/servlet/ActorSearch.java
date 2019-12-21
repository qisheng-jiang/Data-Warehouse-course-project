package servlet;

import service.HiveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "ActorSearch", urlPatterns = "/actorSearch")
public class ActorSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        //role: 0 -> all; 1 -> star; 2 -> suppose
        String role = request.getParameter("role");
        Map<String, Object> resultByHive = HiveService.searchByActor(name, role);
        request.setAttribute("hive", resultByHive);

        request.getRequestDispatcher("searchActor.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
