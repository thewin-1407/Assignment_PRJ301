package controller.students;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.AssessmentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Assessment;
import model.Student;
import model.Student_Account;

public class ViewAssesmentController extends BaseRequiredStudentAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Student_Account user, Student student)
            throws ServletException, IOException {
        AssessmentDBContext assDB = new AssessmentDBContext();
        int subid = Integer.parseInt(request.getParameter("subid"));
        ArrayList<Assessment> assesments = assDB.getAssesmentsBySubid(subid);
        request.setAttribute("assesments", assesments);
        request.getRequestDispatcher("../View/subject/viewAssess.jsp").forward(request, response);
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
