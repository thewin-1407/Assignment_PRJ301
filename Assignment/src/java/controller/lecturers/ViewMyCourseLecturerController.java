package controller.lecturers;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.CourseDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.Lecturer;
import model.Lecturer_Account;

public class ViewMyCourseLecturerController extends BaseRequiredLecturerAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        CourseDBContext db = new CourseDBContext();
        int lid = lecturer.getId();
        ArrayList<Course> courses = db.getCoursesByLecturer(lid);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../View/lecturers/courseLec.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
