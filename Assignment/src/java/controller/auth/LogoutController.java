package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lecturer_Account;
import model.Student_Account;

public class LogoutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Object userObj = request.getSession().getAttribute("user");

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("auth_token")) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }

        if (userObj != null) {
            if (userObj instanceof Lecturer_Account) {
                Lecturer_Account lecturerAccount = (Lecturer_Account) userObj;
                request.getSession().removeAttribute("user");
            } else if (userObj instanceof Student_Account) {
                Student_Account studentAccount = (Student_Account) userObj;
                request.getSession().removeAttribute("user");
            }
        }
        response.sendRedirect("login");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "LogoutController: Handles user logout functionality.";
    }

}
