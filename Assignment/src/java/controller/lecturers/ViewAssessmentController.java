package controller.lecturers;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.AssessmentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Assessment;
import model.Lecturer;
import model.Lecturer_Account;

public class ViewAssessmentController extends BaseRequiredLecturerAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        AssessmentDBContext assDB = new AssessmentDBContext();
        int subid = Integer.parseInt(request.getParameter("subid"));
        ArrayList<Assessment> assesments = assDB.getAssesmentsBySubid(subid);
        request.setAttribute("assesments", assesments);
        request.getRequestDispatcher("../View/subject/viewAssess.jsp").forward(request, response);
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
