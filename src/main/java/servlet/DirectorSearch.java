package servlet;

import service.HiveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "DirectorSearch" , urlPatterns = "/directorSearch")
public class DirectorSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String director = request.getParameter("director");
        Map<String, Object> resultByHive = HiveService.searchByDirector(director);

        request.setAttribute("hive", resultByHive);
        request.getRequestDispatcher("searchTitle.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
