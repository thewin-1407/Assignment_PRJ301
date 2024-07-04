package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assessment;

public class AssessmentDBContext extends DBContext<Assessment> {

    public ArrayList<Assessment> getAssesmentsBySubid(int subid) {
        ArrayList<Assessment> assesments = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = """
                            SELECT a.aid, a.aname, a.[weight]
                            FROM dbo.assesments a
                            JOIN dbo.subjects s ON a.subid = s.subid
                            WHERE s.subid = ?""";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, subid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Assessment a = new Assessment();
                a.setId(rs.getInt("aid"));
                a.setName(rs.getString("aname"));
                a.setWeight(rs.getFloat("weight"));
                assesments.add(a);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return assesments;
    }

    public ArrayList<Assessment> getAssessmentsByCourseId(int cid) {
        ArrayList<Assessment> assessments = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = """
                         SELECT a.aid, a.aname, a.weight 
                         FROM assesments a 
                         JOIN courses c ON a.subid = c.subid 
                         WHERE c.cid = ?
                         """;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Assessment assessment = new Assessment();
                assessment.setId(rs.getInt("aid"));
                assessment.setName(rs.getString("aname"));
                assessment.setWeight(rs.getFloat("weight"));
                assessments.add(assessment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return assessments;
    }

}
