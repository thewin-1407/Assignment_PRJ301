package dal;

import model.Course;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseDBContext extends DBContext<Course> {

    public List<Course> getCoursesByLecturer(int lid) {
        List<Course> courses = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT c.cid, c.cname FROM courses c "
                    + "INNER JOIN lecturers l ON l.lid = c.lid "
                    + "INNER JOIN semester sem ON sem.semid = c.semid "
                    + "WHERE l.lid = ? AND sem.active = 1";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            rs = stm.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, "Error executing SQL query", ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, "Error closing resources", ex);
            }
        }
        return courses;
    }

}
