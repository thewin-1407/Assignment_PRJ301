package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;

public abstract class BaseRequiredAdminAuthenticationController extends HttpServlet {

    private static final String LOGIN_PAGE = "/login";

    private boolean isAdminAuthenticated(HttpServletRequest request) {
        Admin user = (Admin) request.getSession().getAttribute("user");
        return user != null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAdminAuthenticated(request)) {
            Admin user = (Admin) request.getSession().getAttribute("user");
            doGet(request, response, user);
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAdminAuthenticated(request)) {
            Admin user = (Admin) request.getSession().getAttribute("user");
            doPost(request, response, user);
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
        return "Base servlet for admin authentication";
    }

}
