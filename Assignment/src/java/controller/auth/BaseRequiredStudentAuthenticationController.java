package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import model.Student_Account;

public abstract class BaseRequiredStudentAuthenticationController extends HttpServlet {

    private static final String LOGIN_PAGE = "/login";

    private boolean isStuAuthenticated(HttpServletRequest request) {
        Student_Account user = (Student_Account) request.getSession().getAttribute("user");
        if (user == null) {
            return false;
        } else {
            Student student = user.getStudent();
            return student != null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isStuAuthenticated(request)) {
            Student_Account user = (Student_Account) request.getSession().getAttribute("user");
            doGet(request, response, user, user.getStudent());
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isStuAuthenticated(request)) {
            Student_Account user = (Student_Account) request.getSession().getAttribute("user");
            doPost(request, response, user, user.getStudent());
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    @Override
    public String getServletInfo() {
        return "Base servlet for student authentication";
    }

}
