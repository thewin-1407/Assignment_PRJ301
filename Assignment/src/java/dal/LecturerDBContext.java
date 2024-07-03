package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;

public class LecturerDBContext extends DBContext<Lecturer> {

    public Lecturer getLecturerByCourse(int cid) {
        Lecturer lecturer = null;
        PreparedStatement stm = null;
        try {
            String sql = """
                     SELECT l.lname
                     FROM courses c
                     INNER JOIN lecturers l ON c.lid = l.lid
                     WHERE c.cid = ?""";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                lecturer = new Lecturer();
                lecturer.setName(rs.getString("lname"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lecturer;
    }
}
