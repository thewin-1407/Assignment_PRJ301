package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Subject;

public class SubjectsDBContext extends DBContext<Subject> {

    public ArrayList<Subject> getSubjects() throws SQLException {
        ArrayList<Subject> subjects = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT subid, subname FROM subjects";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                subjects.add(sub);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDBContext.class.getName()).log(Level.SEVERE, "Error fetching subjects", ex);
            throw ex;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SubjectsDBContext.class.getName()).log(Level.WARNING, "Error closing ResultSet", ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SubjectsDBContext.class.getName()).log(Level.WARNING, "Error closing PreparedStatement", ex);
                }
            }
        }
        return subjects;
    }

    public ArrayList<Subject> getSubjectbyStudentID(int sid) throws SQLException {
        ArrayList<Subject> subjects = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = """
                         SELECT  sb.subid, sb.subname
                         FROM students s
                         JOIN courses_students cs ON s.sid = cs.sid
                         JOIN courses c ON cs.cid = c.cid
                         JOIN subjects sb ON c.subid = sb.subid
                         WHERE s.sid = ?""";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                subjects.add(sub);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SubjectsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SubjectsDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return subjects;
    }

}
