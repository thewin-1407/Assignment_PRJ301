package controller.lecturers;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.AssessmentDBContext;
import dal.GradeDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import model.Assessment;
import model.Grade;
import model.Lecturer;
import model.Lecturer_Account;
import model.Student;

public class GradeReportLecturerController extends BaseRequiredLecturerAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));

        GradeDBContext gradeDB = new GradeDBContext();
        StudentDBContext stuDB = new StudentDBContext();
        AssessmentDBContext assDB = new AssessmentDBContext();
        ArrayList<Student> students = stuDB.getStudentsByCourse(cid);
        ArrayList<Assessment> assessments = assDB.getAssessmentsByCourseId(cid);
        HashMap<Integer, HashMap<Integer, Grade>> grades = gradeDB.getGradesByCourseId(cid);

        request.setAttribute("students", students);
        request.setAttribute("assessments", assessments);
        request.setAttribute("grades", grades);

        request.getRequestDispatcher("../View/lecturers/grade.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }
}
