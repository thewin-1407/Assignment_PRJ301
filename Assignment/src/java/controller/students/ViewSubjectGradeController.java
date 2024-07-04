package controller.students;

import controller.auth.BaseRequiredStudentAuthenticationController;
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

public class ViewSubjectGradeController extends BaseRequiredStudentAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException, SQLException {
        SubjectsDBContext db = new SubjectsDBContext();
        int sid = student.getId();
        ArrayList<Subject> subs = db.getSubjectbyStudentID(sid);
        request.setAttribute("subs", subs);
        request.getRequestDispatcher("../View/students/subStu.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student) throws ServletException, IOException {
        try {
            processRequest(request, response, user, student);
        } catch (SQLException ex) {
            Logger.getLogger(ViewSubjectGradeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student) throws ServletException, IOException {
        try {
            processRequest(request, response, user, student);
        } catch (SQLException ex) {
            Logger.getLogger(ViewSubjectGradeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
