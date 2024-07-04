
import dal.AssessmentDBContext;
import model.Assessment;

import java.util.ArrayList;

public class MainTest {

    public static void main(String[] args) {
        AssessmentDBContext dbContext = new AssessmentDBContext();
        int subid = 1; // Thay thế bằng subid thực tế của môn học bạn muốn kiểm tra

        try {
            ArrayList<Assessment> assessments = dbContext.getAssesmentsBySubid(subid);

            System.out.println("Assessments for subject with subid " + subid + ":");
            for (Assessment assessment : assessments) {
                System.out.println("ID: " + assessment.getId() + ", Name: " + assessment.getName() + ", Weight: " + assessment.getWeight());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
