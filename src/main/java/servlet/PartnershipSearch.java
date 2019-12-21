package servlet;

import service.HiveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "PartnershipSearch", urlPatterns = "/partnershipSearch")
public class PartnershipSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        //role: 1 -> director; 0 -> actor
        String role = request.getParameter("role");
        Map<String, Object> resultByHive = HiveService.searchPartner(name, role);
        request.setAttribute("hive", resultByHive);

        request.getRequestDispatcher("searchPartnership.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
