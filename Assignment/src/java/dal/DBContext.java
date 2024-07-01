package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class DBContext<T> {

    protected Connection connection;

    public DBContext() {
        try {
            String user = "thangle";
            String pass = "1407";
            String url = "jdbc:sqlserver://localhost\\LDT-147\\SQLEXPRESS:1433;databaseName=Assingment_PRJ301;encrypt=true;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
