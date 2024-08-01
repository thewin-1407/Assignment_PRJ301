package controller.auth;

import dal.LecturerAccDBContext;
import dal.StudentAccDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Lecturer_Account;
import model.Student_Account;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("View/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LecturerAccDBContext ldb = new LecturerAccDBContext();
        Lecturer_Account lecUser = ldb.getLecturerAccount(username, password);
        if (lecUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", lecUser);
            response.sendRedirect("HomeLecturer");
            return;
        }

        StudentAccDBContext sdb = new StudentAccDBContext();
        Student_Account stuUser = sdb.getStudentAccount(username, password);
        if (stuUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", stuUser);
            response.sendRedirect("HomeStudent");
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("errorMessage", "Invalid username or password");
        response.sendRedirect("login");
    }

    @Override
    public String getServletInfo() {
        return "LoginController: Handles user login functionality.";
    }
}
