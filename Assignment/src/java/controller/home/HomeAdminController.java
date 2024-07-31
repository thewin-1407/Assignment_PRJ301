package controller.home;

import controller.auth.BaseRequiredAdminAuthenticationController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;

public class HomeAdminController extends BaseRequiredAdminAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("View/home/homeAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Admin admin) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Admin admin) throws ServletException, IOException {
        processRequest(request, response);
    }
}
