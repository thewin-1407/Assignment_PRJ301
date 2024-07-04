package controller.students;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.GradeDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Grade;
import model.Student;
import model.Student_Account;

public class ViewGradeStudentController extends BaseRequiredStudentAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException {
        int sid = student.getId();
        int subid = Integer.parseInt(request.getParameter("subid"));

        GradeDBContext db = new GradeDBContext();
        ArrayList<Grade> grades = db.getGradesByStudentAndSubject(sid, subid);
        request.setAttribute("grades", grades);
        request.getRequestDispatcher("../View/students/report.jsp").forward(request, response);
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
