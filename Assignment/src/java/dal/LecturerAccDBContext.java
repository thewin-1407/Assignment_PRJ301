package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;
import model.Lecturer_Account;

public class LecturerAccDBContext extends DBContext<Lecturer_Account> {
    
    public Lecturer_Account getLecturerAccount(String username, String password) {
        PreparedStatement stm = null;
        Lecturer_Account user = null;
        try {
            String sql = "SELECT la.username, la.displayname, l.lid, l.lname "
                    + "FROM lecturers_account la "
                    + "LEFT JOIN lecturers_users lu ON lu.username = la.username "
                    + "LEFT JOIN lecturers l ON lu.lid = l.lid "
                    + "WHERE la.username = ? AND la.password = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new Lecturer_Account();
                user.setDisplayName(rs.getString("displayname"));
                user.setUsername(username);
                int lid = rs.getInt("lid");
                if (lid != 0) {
                    Lecturer lecturer = new Lecturer();
                    lecturer.setId(lid);
                    lecturer.setName(rs.getString("lname"));
                    user.setLecturer(lecturer);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerAccDBContext.class.getName()).log(Level.SEVERE, "Error retrieving lecturer account", ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(LecturerAccDBContext.class.getName()).log(Level.SEVERE, "Error closing resources", ex);
            }
        }
        return user;
    }
    
}
