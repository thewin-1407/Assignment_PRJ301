package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assessment;
import model.Exam;
import model.Subject;

public class ExamDBContext extends DBContext<Exam> {

    public ArrayList<Exam> getExamsByCourse(int cid) {
        ArrayList<Exam> exams = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT e.eid, e.duration, e.[from], a.aid, a.aname, a.weight, sub.subid, sub.subname "
                    + "FROM exams e "
                    + "INNER JOIN assessments a ON a.aid = e.aid "
                    + "INNER JOIN subjects sub ON sub.subid = a.subid "
                    + "INNER JOIN courses c ON c.subid = sub.subid "
                    + "WHERE c.cid = ?";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("eid"));
                e.setDuration(rs.getInt("duration"));
                e.setFrom(rs.getTimestamp("from"));

                Assessment a = new Assessment();
                a.setId(rs.getInt("aid"));
                a.setName(rs.getString("aname"));
                a.setWeight(rs.getFloat("weight"));

                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                a.setSubject(sub);

                e.setAssessment(a);
                exams.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, "Error retrieving exams by course ID", ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, "Error closing statement", ex);
            }
        }
        return exams;
    }

    public ArrayList<Exam> getExamsByExamIds(ArrayList<Integer> eids) {
        ArrayList<Exam> exams = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT e.eid, e.[from], a.aid, a.aname, a.weight ")
                    .append("FROM exams e ")
                    .append("INNER JOIN assessments a ON a.aid = e.aid ")
                    .append("WHERE (1 > 2)");

            for (Integer eid : eids) {
                sqlBuilder.append(" OR eid = ?");
            }

            stm = connection.prepareStatement(sqlBuilder.toString());

            for (int i = 0; i < eids.size(); i++) {
                stm.setInt(i + 1, eids.get(i));
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam e = new Exam();
                e.setId(rs.getInt("eid"));
                e.setFrom(rs.getTimestamp("from"));

                Assessment a = new Assessment();
                a.setId(rs.getInt("aid"));
                a.setName(rs.getString("aname"));
                a.setWeight(rs.getFloat("weight"));

                e.setAssessment(a);
                exams.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, "Error retrieving exams by exam IDs", ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, "Error closing statement", ex);
            }
        }
        return exams;
    }
}
