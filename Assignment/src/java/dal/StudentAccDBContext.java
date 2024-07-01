package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student_Account;
import model.Student;

public class StudentAccDBContext extends DBContext<Student_Account> {

    public Student_Account getStudentAccount(String username, String password) {
        PreparedStatement stm = null;
        Student_Account user = null;
        try {
            String sql = """
                         SELECT sa.username, sa.displayname, s.sid, s.sname 
                         FROM students_account sa
                         LEFT JOIN students_users su ON su.username = sa.username 
                         LEFT JOIN students s ON su.sid = s.sid 
                         WHERE sa.username = ? AND sa.[password] = ?""";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new Student_Account();
                user.setDisplayname(rs.getString("displayname"));
                user.setUsername(username);
                int sid = rs.getInt("sid");
                if (sid != 0) {
                    Student student = new Student();
                    student.setId(sid);
                    student.setName(rs.getString("sname"));
                    user.setStudent(student);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentAccDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentAccDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

}
