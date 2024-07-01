package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Exam;
import model.Grade;
import model.Student;

public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<Grade> getGradesFromExamIds(ArrayList<Integer> eids) {
        ArrayList<Grade> grades = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT eid, sid, score FROM grades WHERE (1 > 2)";
            for (Integer eid : eids) {
                sql += " OR eid = ?";
            }

            stm = connection.prepareStatement(sql);

            for (int i = 0; i < eids.size(); i++) {
                stm.setInt(i + 1, eids.get(i));
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Grade g = new Grade();
                g.setScore(rs.getFloat("score"));

                Student s = new Student();
                s.setId(rs.getInt("sid"));
                g.setStudent(s);

                Exam e = new Exam();
                e.setId(rs.getInt("eid"));
                g.setExam(e);

                grades.add(g);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, "Error retrieving grades by exam IDs", ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, "Error closing statement", ex);
            }
        }
        return grades;
    }

    public void insertGradesForCourse(int cid, ArrayList<Grade> grades) {
        String sql_remove = "DELETE FROM grades WHERE sid IN (SELECT sid FROM students_courses WHERE cid = ?)";
        String sql_insert = "INSERT INTO grades (eid, sid, score) VALUES (?, ?, ?)";

        PreparedStatement stm_remove = null;
        PreparedStatement stm_insert = null;

        try {
            connection.setAutoCommit(false);

            // Remove existing grades for the course
            stm_remove = connection.prepareStatement(sql_remove);
            stm_remove.setInt(1, cid);
            stm_remove.executeUpdate();

            // Insert new grades
            stm_insert = connection.prepareStatement(sql_insert);
            for (Grade grade : grades) {
                stm_insert.setInt(1, grade.getExam().getId());
                stm_insert.setInt(2, grade.getStudent().getId());
                stm_insert.setFloat(3, grade.getScore());
                stm_insert.addBatch();
            }
            stm_insert.executeBatch();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, "Error inserting grades for course", ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, "Error rolling back transaction", ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
                if (stm_remove != null) {
                    stm_remove.close();
                }
                if (stm_insert != null) {
                    stm_insert.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, "Error closing statements", ex);
            }
        }
    }
}
