package controller.exam;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.ExamDBContext;
import dal.GradeDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import model.Exam;
import model.Grade;
import model.Lecturer;
import model.Student;
import model.Lecturer_Account;

public class TakeExamController extends BaseRequiredLecturerAuthenticationController {

    private final StudentDBContext studentDBContext;
    private final ExamDBContext examDBContext;
    private final GradeDBContext gradeDBContext;

    public TakeExamController() {
        studentDBContext = new StudentDBContext();
        examDBContext = new ExamDBContext();
        gradeDBContext = new GradeDBContext();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<Student> students = studentDBContext.getStudentsByCourse(cid);

        String[] raw_eids = request.getParameterValues("eid");
        ArrayList<Integer> eids = parseExamIds(raw_eids);

        ArrayList<Exam> exams = examDBContext.getExamsByExamIds(eids);
        ArrayList<Grade> grades = gradeDBContext.getGradesFromExamIds(eids);

        request.setAttribute("students", students);
        request.setAttribute("exams", exams);
        request.setAttribute("grades", grades);

        request.getRequestDispatcher("../View/exam/take.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Lecturer_Account user, Lecturer lecturer)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        HashSet<Integer> eids = new HashSet<>();

        String[] raw_gradeids = request.getParameterValues("gradeid");
        ArrayList<Grade> grades = parseGrades(raw_gradeids, request);

        for (Grade grade : grades) {
            eids.add(grade.getExam().getId());
        }

        gradeDBContext.insertGradesForCourse(cid, grades);

        redirectWithExamIds(response, cid, eids);
    }

    private ArrayList<Integer> parseExamIds(String[] raw_eids) {
        ArrayList<Integer> eids = new ArrayList<>();
        for (String raw_eid : raw_eids) {
            eids.add(Integer.valueOf(raw_eid));
        }
        return eids;
    }

    private ArrayList<Grade> parseGrades(String[] raw_gradeids, HttpServletRequest request) {
        ArrayList<Grade> grades = new ArrayList<>();
        for (String raw_gradeid : raw_gradeids) {
            int sid = Integer.parseInt(raw_gradeid.split("_")[0]);
            int eid = Integer.parseInt(raw_gradeid.split("_")[1]);

            String raw_score = request.getParameter("score" + sid + "_" + eid);
            if (!raw_score.isEmpty()) {
                Grade g = new Grade();
                g.setScore(Float.parseFloat(raw_score));
                Exam e = new Exam();
                e.setId(eid);
                g.setExam(e);
                Student s = new Student();
                s.setId(sid);
                g.setStudent(s);
                grades.add(g);
            }
        }
        return grades;
    }

    private void redirectWithExamIds(HttpServletResponse response, int cid, HashSet<Integer> eids) throws IOException {
        StringBuilder url_param = new StringBuilder();
        for (Integer eid : eids) {
            url_param.append("&eid=").append(eid);
        }
        response.sendRedirect("take?cid=" + cid + url_param.toString());
    }

    @Override
    public String getServletInfo() {
        return "Take Exam Controller";
    }
}
