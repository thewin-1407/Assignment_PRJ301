package dal;

import model.Lecturer_Account;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;

public class LecturerAccDBContext extends DBContext<Lecturer_Account> {

    public Lecturer_Account getUserByUsernamePassword(String username, String password) {
        PreparedStatement stm = null;
        Lecturer_Account user = null;
        try {
            String sql = """
                         SELECT u.username,u.displayname,l.lid,l.lname
                         FROM users u LEFT JOIN users_lecturers ul ON ul.username = u.username
                         \t\t\t\t\t\tLEFT JOIN lecturers l ON ul.lid = l.lid
                         \t\t\t\t\t\tWHERE u.username = ? AND u.[password] = ?""";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new Lecturer_Account();
                user.setDisplayname(rs.getString("displayname"));
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
            Logger.getLogger(LecturerAccDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LecturerAccDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

}
