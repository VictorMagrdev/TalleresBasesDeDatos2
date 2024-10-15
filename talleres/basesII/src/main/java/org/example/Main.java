package org.example;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
        try {
            String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=root";
            Connection conn = DriverManager.getConnection(url);
            CallableStatement stmt = conn.prepareCall("call taller1.transferir_dinero(?,?,?)");
            stmt.setInt(1,123249882);
            stmt.setInt(2,122432467);
            stmt.setInt(3,300);
            stmt.execute();
            stmt.close();
            conn.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}