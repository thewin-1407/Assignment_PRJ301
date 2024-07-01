package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lecturer;
import model.Lecturer_Account;

public abstract class BaseRequiredLecturerAuthenticationController extends HttpServlet {

    private boolean isLecAuthenticated(HttpServletRequest request) {
        Lecturer_Account user = (Lecturer_Account) request.getSession().getAttribute("user");
        if (user == null) {
            return false;
        } else {
            Lecturer lecturer = user.getLecturer();
            return lecturer != null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Lecturer_Account user = (Lecturer_Account) request.getSession().getAttribute("user");
        if (isLecAuthenticated(request)) {
            doGet(request, response, user, user.getLecturer());
        } else {
            response.getWriter().println("Access denied!");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Lecturer_Account user = (Lecturer_Account) request.getSession().getAttribute("user");
        if (isLecAuthenticated(request)) {
            doPost(request, response, user, user.getLecturer());
        } else {
            response.getWriter().println("Access denied!");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
