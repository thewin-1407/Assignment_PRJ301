package controller.auth;

import dal.LecturerAccDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lecturer_Account;

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

        LecturerAccDBContext db = new LecturerAccDBContext();
        Lecturer_Account user = db.getLecturerAccount(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("Home"); 
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("View/auth/login.jsp").forward(request, response); // Quay lại trang đăng nhập với thông báo lỗi
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
