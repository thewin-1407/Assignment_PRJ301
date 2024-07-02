package controller.lecturers;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Lecturer;
import model.Student;
import model.Lecturer_Account;

public class ViewClassLecturerController extends BaseRequiredLecturerAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        StudentDBContext stuDB = new StudentDBContext();

        int cid = Integer.parseInt(request.getParameter("cid"));

        ArrayList<Student> students = stuDB.getStudentsByCourse(cid);

        request.setAttribute("students", students);

        request.getRequestDispatcher("../View/lecturers/classview.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
