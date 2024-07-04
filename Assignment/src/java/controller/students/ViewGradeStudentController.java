package controller.students;

import controller.auth.BaseRequiredStudentAuthenticationController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import model.Student_Account;

public class ViewGradeStudentController extends BaseRequiredStudentAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student) throws ServletException, IOException {
        processRequest(request, response, user, student);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student) throws ServletException, IOException {
        processRequest(request, response, user, student);
    }
}
