package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

public class AdminDBContext extends DBContext<Admin> {

    public Admin getAdminAccount(String username, String password) {
        PreparedStatement stm = null;
        Admin admin = null;
        try {
            String sql = """
                         SELECT ad.id, ad.username, ad.password
                         FROM [admin] ad
                         WHERE ad.[username] = ? AND ad.[password] = ?""";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return admin;
    }

}
