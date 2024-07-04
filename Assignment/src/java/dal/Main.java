
import dal.GradeDBContext;
import model.Grade;

import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {
        // Khởi tạo GradeDBContext (đảm bảo rằng connection đã được thiết lập và khởi tạo)
        GradeDBContext dbContext = new GradeDBContext();

        try {
            int studentId = 1;  // ID của sinh viên cần lấy điểm
            int subjectId = 1;  // ID của môn học cần lấy điểm

            // Gọi phương thức để lấy danh sách điểm của sinh viên theo môn học
            ArrayList<Grade> grades = dbContext.getGradesByStudentAndSubject(studentId, subjectId);

            // In ra danh sách điểm
            for (Grade grade : grades) {
                System.out.println("Subject: " + grade.getExam().getAssessment().getName());
                System.out.println("Score: " + grade.getScore());
                System.out.println("-----------------------");
            }
        } catch (Exception e) {
        }
    }
}
