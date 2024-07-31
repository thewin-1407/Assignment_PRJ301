package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
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
        if (grades.isEmpty()) {
            throw new IllegalArgumentException("List of grades cannot be empty");
        }

        List<Integer> eids = grades.stream()
                .map(grade -> grade.getExam().getId())
                .distinct()
                .collect(Collectors.toList());

        StringBuilder sqlRemove = new StringBuilder("DELETE FROM grades WHERE eid IN (");
        for (int i = 0; i < eids.size(); i++) {
            sqlRemove.append("?");
            if (i < eids.size() - 1) {
                sqlRemove.append(", ");
            }
        }
        sqlRemove.append(") AND sid IN (SELECT sid FROM courses_students WHERE cid = ?)");

        String sqlInsert = "INSERT INTO grades (eid, sid, score) VALUES (?, ?, ?)";

        PreparedStatement stmRemove = null;
        PreparedStatement stmInsert = null;

        try {
            connection.setAutoCommit(false);

            stmRemove = connection.prepareStatement(sqlRemove.toString());
            for (int i = 0; i < eids.size(); i++) {
                stmRemove.setInt(i + 1, eids.get(i));
            }
            stmRemove.setInt(eids.size() + 1, cid);
            stmRemove.executeUpdate();

            stmInsert = connection.prepareStatement(sqlInsert);
            for (Grade grade : grades) {
                stmInsert.setInt(1, grade.getExam().getId());
                stmInsert.setInt(2, grade.getStudent().getId());
                stmInsert.setFloat(3, grade.getScore());
                stmInsert.addBatch();
            }
            stmInsert.executeBatch();

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
                if (stmRemove != null) {
                    stmRemove.close();
                }
                if (stmInsert != null) {
                    stmInsert.close();
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

    public ArrayList<Grade> getGradesByStudentAndSubject(int sid, int subid) {
        ArrayList<Grade> grades = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = """
             SELECT a.aid, g.score FROM grades g
             JOIN exams e ON g.eid = e.eid
             JOIN assesments a ON e.aid = a.aid
             JOIN subjects s ON a.subid = s.subid
             JOIN students stu ON stu.sid = g.sid
             WHERE stu.sid = ?
             AND s.subid = ?
             """;

            stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, subid);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setScore(rs.getFloat("score"));

                Assessment assessment = new Assessment();
                assessment.setId(rs.getInt("aid"));

                Exam exam = new Exam();
                exam.setAssessment(assessment);
                grade.setExam(exam);

                Student student = new Student();
                student.setId(sid);
                grade.setStudent(student);

                grades.add(grade);
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

}
