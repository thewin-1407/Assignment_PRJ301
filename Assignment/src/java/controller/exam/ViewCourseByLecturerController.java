package controller.exam;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.CourseDBContext;
import dal.ExamDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Exam;
import model.Lecturer;
import model.Lecturer_Account;

public class ViewCourseByLecturerController extends BaseRequiredLecturerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        try {
            CourseDBContext db = new CourseDBContext();
            int lid = lecturer.getId();
            List<Course> courses = db.getCoursesByLecturer(lid);
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("../View/exam/lecturer.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ViewCourseByLecturerController.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception or display error message to the user
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        try {
            int cid = Integer.parseInt(request.getParameter("cid"));
            ExamDBContext db = new ExamDBContext();
            ArrayList<Exam> exams = db.getExamsByCourse(cid);
            request.setAttribute("exams", exams);
            request.getRequestDispatcher("../View/exam/lecturer.jsp").forward(request, response);
        } catch (NumberFormatException | ServletException | IOException ex) {
            Logger.getLogger(ViewCourseByLecturerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "View Course By Lecturer Controller";
    }

}
