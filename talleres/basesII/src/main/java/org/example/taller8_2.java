package org.example;

import java.math.BigDecimal;
import java.sql.*;

public class taller8_2 {
    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        try {
            String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=root";
            conn = DriverManager.getConnection(url);

            PreparedStatement transacciones_total_mes = conn.prepareCall("select corte2.transacciones_total_mes(?, ?)");
            transacciones_total_mes.setInt(1, 9);
            transacciones_total_mes.setString(2, "663573201");
            transacciones_total_mes.execute();
            final ResultSet rs = transacciones_total_mes.getResultSet();

            while (rs.next()) {
                System.out.println(rs.getString("transacciones_total_mes"));
            }
            transacciones_total_mes.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        }
    }
}
