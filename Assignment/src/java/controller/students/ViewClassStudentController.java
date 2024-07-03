package controller.students;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.LecturerDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Lecturer;
import model.Student;
import model.Student_Account;

public class ViewClassStudentController extends BaseRequiredStudentAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException {
        StudentDBContext stuDB = new StudentDBContext();
        LecturerDBContext lecDB = new LecturerDBContext();

        int cid = Integer.parseInt(request.getParameter("cid"));

        ArrayList<Student> students = stuDB.getStudentsByCourse(cid);
        Lecturer lecturer = lecDB.getLecturerByCourse(cid);

        request.setAttribute("students", students);
        request.setAttribute("lecturer", lecturer);
        request.getRequestDispatcher("../View/students/classview.jsp").forward(request, response);

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
