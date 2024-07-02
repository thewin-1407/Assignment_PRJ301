package controller.lecturers;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.SubjectsDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;
import model.Lecturer_Account;
import model.Subject;

public class ViewSubjectLecturerController extends BaseRequiredLecturerAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer) throws ServletException, IOException {
        processRequest(request, response, user, lecturer);
    }

}
