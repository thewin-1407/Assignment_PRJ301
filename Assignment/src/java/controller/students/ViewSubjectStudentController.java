package controller.students;

import controller.auth.BaseRequiredStudentAuthenticationController;
import controller.lecturers.ViewSubjectLecturerController;
import dal.SubjectsDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;
import model.Student_Account;
import model.Subject;

public class ViewSubjectStudentController extends BaseRequiredStudentAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException {
        try {
            SubjectsDBContext db = new SubjectsDBContext();
            ArrayList<Subject> subjects = db.getSubjects();
            request.setAttribute("subject", subjects);
            request.getRequestDispatcher("../View/subject/viewSub.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewSubjectLecturerController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
