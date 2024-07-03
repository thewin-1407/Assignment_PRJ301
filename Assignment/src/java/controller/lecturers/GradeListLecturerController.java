package controller.lecturers;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.GradeDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Grade;
import model.Lecturer;
import model.Lecturer_Account;
import model.Student;

public class GradeListLecturerController extends BaseRequiredLecturerAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException, SQLException {

        int cid = Integer.parseInt(request.getParameter("cid"));

        StudentDBContext stuDB = new StudentDBContext();
        GradeDBContext gradeDB = new GradeDBContext();

        ArrayList<Student> students = stuDB.getStudentsByCourse(cid);
        ArrayList<Grade> grades = gradeDB.getGradesByCourse(cid);

        Map<Integer, ArrayList<Grade>> studentGrades = new HashMap<>();
        for (Grade grade : grades) {
            int sid = grade.getStudent().getId();
            if (!studentGrades.containsKey(sid)) {
                studentGrades.put(sid, new ArrayList<>());
            }
            studentGrades.get(sid).add(grade);
        }

        request.setAttribute("students", students);
        request.setAttribute("studentGrades", studentGrades);

        request.getRequestDispatcher("View/lecturer/grade.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        try {
            processRequest(request, response, user, lecturer);
        } catch (SQLException ex) {
            Logger.getLogger(GradeListLecturerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        try {
            processRequest(request, response, user, lecturer);
        } catch (SQLException ex) {
            Logger.getLogger(GradeListLecturerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
