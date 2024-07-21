package controller.lecturers;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.CourseDBContext;
import dal.ExamDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.Exam;
import model.Lecturer;
import model.Lecturer_Account;

public class ViewCourseByLecturerController extends BaseRequiredLecturerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        CourseDBContext db = new CourseDBContext();
        int lid = lecturer.getId();
        ArrayList<Course> courses = db.getCoursesByLecturer(lid);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../View/lecturers/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        int lid = lecturer.getId();

        ExamDBContext db = new ExamDBContext();
        ArrayList<Exam> exams = db.getExamsByCourse(cid);
        request.setAttribute("exams", exams);

        request.getRequestDispatcher("../View/lecturers/edit.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
