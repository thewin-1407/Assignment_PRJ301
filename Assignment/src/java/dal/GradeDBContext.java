package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Exam;
import model.Grade;
import model.Student;
import model.Assessment;

public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<Grade> getGradesFromExamIds(ArrayList<Integer> eids) {
        ArrayList<Grade> grades = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT eid,sid,score FROM grades WHERE (1 > 2)";
            for (Integer eid : eids) {
                sql += " OR eid = ?";
            }

            stm = connection.prepareStatement(sql);

            for (int i = 0; i < eids.size(); i++) {
                stm.setInt((i + 1), eids.get(i));
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
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return grades;
    }

    public void insertGradesForCourse(int cid, ArrayList<Grade> grades) {
        String sql_remove = "DELETE grades WHERE sid IN (SELECT sid FROM courses_students WHERE cid = ?)";
        String sql_insert = """
                            INSERT INTO [grades]
                                       ([eid]
                                       ,[sid]
                                       ,[score])
                                 VALUES
                                       (?
                                       ,?
                                       ,?)""";

        PreparedStatement stm_remove = null;
        ArrayList<PreparedStatement> stm_inserts = new ArrayList<>();

        try {
            connection.setAutoCommit(false);
            stm_remove = connection.prepareStatement(sql_remove);
            stm_remove.setInt(1, cid);
            stm_remove.executeUpdate();

            for (Grade grade : grades) {
                PreparedStatement stm_insert = connection.prepareStatement(sql_insert);
                stm_insert.setInt(1, grade.getExam().getId());
                stm_insert.setInt(2, grade.getStudent().getId());
                stm_insert.setFloat(3, grade.getScore());
                stm_insert.executeUpdate();
                stm_inserts.add(stm_insert);
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
                stm_remove.close();
                for (PreparedStatement stm_insert : stm_inserts) {
                    stm_insert.close();
                }
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public HashMap<Integer, HashMap<Integer, Grade>> getGradesByCourseId(int cid) {
        HashMap<Integer, HashMap<Integer, Grade>> grades = new HashMap<>();
        PreparedStatement stm = null;
        try {
            String sql = """
                         SELECT g.eid, g.sid, g.score, e.aid FROM grades g
                           JOIN exams e ON g.eid = e.eid
                           JOIN assesments a ON e.aid = a.aid
                           JOIN subjects s ON a.subid = s.subid
                           JOIN courses c ON s.subid = c.subid
                           WHERE c.cid = ?
                           ORDER BY g.sid""";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int sid = rs.getInt("sid");
                int aid = rs.getInt("aid");
                Grade grade = new Grade();
                grade.setScore(rs.getFloat("score"));

                Student student = new Student();
                student.setId(sid);
                grade.setStudent(student);

                Exam exam = new Exam();
                exam.setId(rs.getInt("eid"));
                Assessment assessment = new Assessment();
                assessment.setId(aid);
                exam.setAssessment(assessment);
                grade.setExam(exam);

                if (!grades.containsKey(sid)) {
                    grades.put(sid, new HashMap<>());
                }
                grades.get(sid).put(aid, grade);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return grades;
    }

    public ArrayList<Grade> getGradeByStuID_SubID(int sid, int subid) {

    }

}
