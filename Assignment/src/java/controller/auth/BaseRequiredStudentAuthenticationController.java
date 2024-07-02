package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import model.Student_Account;

public abstract class BaseRequiredStudentAuthenticationController extends HttpServlet {

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
        Student_Account user = (Student_Account) request.getSession().getAttribute("user");
        if (isStuAuthenticated(request)) {
            doGet(request, response, user, user.getStudent());
        } else {
            response.sendRedirect("login");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Student_Account user = (Student_Account) request.getSession().getAttribute("user");
        if (isStuAuthenticated(request)) {
            doPost(request, response, user, user.getStudent());
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
