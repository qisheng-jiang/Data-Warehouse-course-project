package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "QueryExample", urlPatterns = "/QueryExample")
public class Example extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String moiveName = request.getParameter("movieName");
        System.out.println(moiveName);
        //do search
        List<String> names = new ArrayList<>();
        names.add("123");
        names.add("456");
        List<Integer> nums = new ArrayList<>();
        nums.add(2);
        nums.add(3);
        request.setAttribute("names", names);
        request.setAttribute("nums", nums);
        request.getRequestDispatcher("func_2.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
