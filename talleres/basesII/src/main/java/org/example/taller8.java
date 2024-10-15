package org.example;

import java.sql.*;

public class taller8 {
    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        try {
            // Generar conexión
            String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=root";
            conn = DriverManager.getConnection(url);
            // Generar auditoría
            CallableStatement generar_auditoria = conn.prepareCall("call corte2.generar_auditoria(?, ?)");
            Date fecha_inicio = Date.valueOf("2024-10-11");
            Date fecha_fin = Date.valueOf("2024-11-11");
            generar_auditoria.setDate(1, fecha_inicio);
            generar_auditoria.setDate(2, fecha_fin);
            generar_auditoria.execute();
            generar_auditoria.close();

            // Simular ventas mes
            CallableStatement simular_ventas_mes = conn.prepareCall("call corte2.simular_ventas_mes()");
            simular_ventas_mes.execute();
            simular_ventas_mes.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        }
    }
}
