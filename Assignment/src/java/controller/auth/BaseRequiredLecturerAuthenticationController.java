package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lecturer;
import model.Lecturer_Account;

public abstract class BaseRequiredLecturerAuthenticationController extends HttpServlet {

    private static final String LOGIN_PAGE = "/login";

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
        if (isLecAuthenticated(request)) {
            Lecturer_Account user = (Lecturer_Account) request.getSession().getAttribute("user");
            doGet(request, response, user, user.getLecturer());
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isLecAuthenticated(request)) {
            Lecturer_Account user = (Lecturer_Account) request.getSession().getAttribute("user");
            doPost(request, response, user, user.getLecturer());
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
        return "Base servlet for lecturer authentication";
    }

}
